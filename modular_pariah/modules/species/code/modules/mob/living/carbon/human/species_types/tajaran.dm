GLOBAL_LIST_EMPTY(body_markings_list_tajaran)
GLOBAL_LIST_EMPTY(tails_list_tajaran)
GLOBAL_LIST_EMPTY(animated_tails_list_tajaran)
GLOBAL_LIST_EMPTY(snouts_list_tajaran)

/datum/species/tajaran
	// Meow
	name = "\improper Tajaran"
	plural_form = "Tajaran"
	id = SPECIES_TAJARAN
	say_mod = "meows"
	default_color = "4B4B4B"
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, HAIR)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list("tail_tajaran" = "Standard", "body_markings_tajaran" = "None", "legs" = "Normal Legs")
	external_organs = list(/obj/item/organ/external/snout/tajaran = "Standard")
	mutant_organs = list(/obj/item/organ/tail/tajaran)
	mutantears = /obj/item/organ/ears/cat
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	disliked_food = CLOTH
	liked_food = GRAIN | MEAT
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_TAJARAN
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/tajaran,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/tajaran,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/tajaran,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/tajaran,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/tajaran,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/tajaran,
	)
	digitigrade_l_leg = /obj/item/bodypart/l_leg/digitigrade_tajaran
	digitigrade_r_leg = /obj/item/bodypart/r_leg/digitigrade_tajaran

//I wag in death
/datum/species/tajaran/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		stop_wagging_tail(H)

/datum/species/tajaran/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		stop_wagging_tail(H)
	. = ..()

/datum/species/tajaran/can_wag_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["tail_tajaran"] || mutant_bodyparts["waggingtail_tajaran"]

/datum/species/tajaran/is_wagging_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["waggingtail_tajaran"]

/datum/species/tajaran/start_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["tail_tajaran"])
		mutant_bodyparts["waggingtail_tajaran"] = mutant_bodyparts["tail_tajaran"]
		mutant_bodyparts -= "tail_tajaran"
	H.update_body()

/datum/species/tajaran/stop_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["waggingtail_tajaran"])
		mutant_bodyparts["tail_tajaran"] = mutant_bodyparts["waggingtail_tajaran"]
		mutant_bodyparts -= "waggingtail_tajaran"
	H.update_body()

/datum/species/tajaran/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	var/real_tail_type = C.dna.features["tail_tajaran"]

	. = ..()

	// Special handler for loading preferences. If we're doing it from a preference load, we'll want
	// to make sure we give the appropriate tajaran tail AFTER we call the parent proc, as the parent
	// proc will overwrite the tajaran tail. Species code at its finest.
	if(pref_load)
		C.dna.features["tail_tajaran"] = real_tail_type

		var/obj/item/organ/tail/tajaran/new_tail = new /obj/item/organ/tail/tajaran()

		new_tail.tail_type = C.dna.features["tail_tajaran"]

		// organ.Insert will qdel any existing organs in the same slot, so
		// we don't need to manage that.
		new_tail.Insert(C, TRUE, FALSE)

/datum/species/tajaran/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/tail = pick(GLOB.tails_list_tajaran)
	human_mob.dna.features["tail_tajaran"] = tail
	mutant_bodyparts["tail_tajaran"] = tail
	human_mob.update_body()

/datum/species/tajaran/get_scream_sound(mob/living/carbon/human/tajaran)
	return "modular_pariah/modules/tajaran/sound/cat_scream.ogg"

/datum/species/tajaran/random_name(gender, unique, lastname)
	var/randname
	if(gender == MALE)
		randname = pick(GLOB.first_names_male_taj)
	else
		randname = pick(GLOB.first_names_female_taj)

	if(lastname)
		randname += " [lastname]"
	else
		randname += " [pick(GLOB.last_names_taj)]"

	return randname

/datum/species/tajaran/get_species_description()
	return "WIP"

/datum/species/tajaran/get_species_lore()
	return list("WIP")
