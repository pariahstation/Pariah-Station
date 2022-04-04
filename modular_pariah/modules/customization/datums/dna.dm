/**
 * Some identity blocks (basically pieces of the unique_identity string variable of the dna datum, commonly abbreviated with ui)
 * may have a length that differ from standard length of 3 ASCII characters. This list is necessary
 * for these non-standard blocks to work, as well as the entire unique identity string.
 * Should you add a new ui block which size differ from the standard (again, 3 ASCII characters), like for example, a color,
 * please do not forget to also include it in this list in the following format:
 *  "[dna block number]" = dna block size,
 * Failure to do that may result in bugs. Thanks.
 */
GLOBAL_LIST_INIT(identity_block_lengths, list(
		"[DNA_HAIR_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_FACIAL_HAIR_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_EYE_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
	))

/**
 * The same rules of the above also apply here, with the exception that this is for the unique_features string variable
 * (commonly abbreviated with uf) and its blocks. Both ui and uf have a standard block length of 3 ASCII characters.
 */
GLOBAL_LIST_INIT(features_block_lengths, list(
		"[DNA_MUTANT_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_MUTANT_COLOR_2_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_MUTANT_COLOR_3_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_ETHEREAL_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
		"[DNA_SKIN_COLOR_BLOCK]" = DNA_BLOCK_SIZE_COLOR,
	))

/**
 * A list of numbers that keeps track of where ui blocks start in the unique_identity string variable of the dna datum.
 * Commonly used by the datum/dna/set_uni_identity_block and datum/dna/get_uni_identity_block procs.
 */
GLOBAL_LIST_EMPTY(total_ui_len_by_block)

/proc/populate_total_ui_len_by_block()
	GLOB.total_ui_len_by_block = list()
	var/total_block_len = 1
	for(var/blocknumber in 1 to DNA_UNI_IDENTITY_BLOCKS)
		GLOB.total_ui_len_by_block += total_block_len
		total_block_len += GET_UI_BLOCK_LEN(blocknumber)

///Ditto but for unique features. Used by the datum/dna/set_uni_feature_block and datum/dna/get_uni_feature_block procs.
GLOBAL_LIST_EMPTY(total_uf_len_by_block)

/proc/populate_total_uf_len_by_block()
	GLOB.total_uf_len_by_block = list()
	var/total_block_len = 1
	for(var/blocknumber in 1 to GLOB.dna_total_feature_blocks)
		GLOB.total_uf_len_by_block += total_block_len
		total_block_len += GET_UF_BLOCK_LEN(blocknumber)

/datum/dna
	var/list/list/mutant_bodyparts = list()
	features = MANDATORY_FEATURE_LIST
	///Body markings of the DNA's owner. This is for storing their original state for re-creating the character. They'll get changed on species mutation
	var/list/list/body_markings = list()

/datum/dna/proc/initialize_dna(newblood_type, skip_index = FALSE)
	if(newblood_type)
		blood_type = newblood_type
	unique_enzymes = generate_unique_enzymes()
	unique_identity = generate_unique_identity()
	if(!skip_index) //I hate this
		generate_dna_blocks()
	features = species.get_random_features()
	mutant_bodyparts = species.get_random_mutant_bodyparts(features)

/mob/living/carbon/set_species(datum/species/mrace, icon_update = TRUE, var/datum/preferences/pref_load)
	if(mrace && has_dna())
		var/datum/species/new_race
		if(ispath(mrace))
			new_race = new mrace
		else if(istype(mrace))
			new_race = mrace
		else
			return
		deathsound = new_race.deathsound
		dna.species.on_species_loss(src, new_race, pref_load)
		var/datum/species/old_species = dna.species
		dna.species = new_race
		//BODYPARTS AND FEATURES
		var/list/bodyparts_to_add
		var/list/organs_to_build = list()
		if(pref_load)
			dna.features = pref_load.features.Copy()
			dna.mutant_bodyparts = pref_load.mutant_bodyparts.Copy()
			dna.body_markings = pref_load.body_markings.Copy()
		else
			dna.features = new_race.get_random_features()
			dna.mutant_bodyparts = new_race.get_random_mutant_bodyparts(dna.features)
			dna.body_markings = new_race.get_random_body_markings(dna.features)
			dna.species.body_markings = dna.body_markings.Copy()

		bodyparts_to_add = dna.mutant_bodyparts.Copy()

		for(var/key in bodyparts_to_add)
			var/datum/sprite_accessory/SP = GLOB.sprite_accessories[key][bodyparts_to_add[key][MUTANT_INDEX_NAME]]
			if(!SP.factual)
				bodyparts_to_add -= key
				continue
			if(SP.organ_type)
				organs_to_build[key] = SP.organ_type
					//Why dont we remove the key from the list here, as it's gonna get added either way?
					//Well there's some jank that makes the organ not properly do it on initializations, which doesnt happen on organ manipulations
					//And this way there is literally no difference in practice
		dna.species.mutant_bodyparts = bodyparts_to_add.Copy()

		dna.species.on_species_gain(src, old_species, pref_load)

		//We have to build them later as they require other DNA information
		for(var/key in organs_to_build)
			var/path = organs_to_build[key]
			var/obj/item/organ/ORG = new path
			ORG.build_from_dna(dna, key)
			ORG.Insert(src, 0, FALSE)

		dna.species.mutant_bodyparts = bodyparts_to_add.Copy()
		//END OF BODYPARTS AND FEATURES
		//dna.species.on_species_gain(src, old_species, pref_load)
		if(ishuman(src))
			qdel(language_holder)
			var/species_holder = initial(mrace.species_language_holder)
			language_holder = new species_holder(src)
		update_atom_languages()
