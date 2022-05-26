//gene modded humans
/datum/species/human/modder
	name = "Modded Human"
	id = SPECIES_MODDER
	//say_mod = "meows"

	mutant_bodyparts = list("tail_human" = "Cat", "ears" = "Cat", "wings" = "None")

	mutantears = /obj/item/organ/ears/cat
	mutant_organs = list(/obj/item/organ/tail/cat)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	//species_language_holder = /datum/language_holder/felinid
	payday_modifier = 0.75
	ass_image = 'icons/ass/asscat.png'
	examine_limb_id = SPECIES_HUMAN

//Curiosity killed the cat's wagging tail.
/datum/species/human/modder/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		stop_wagging_tail(H)

/datum/species/human/modder/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		stop_wagging_tail(H)
	. = ..()

/datum/species/human/modder/can_wag_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["tail_human"] || mutant_bodyparts["waggingtail_human"]

/datum/species/human/modder/is_wagging_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["waggingtail_human"]

/datum/species/human/modder/start_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["tail_human"])
		mutant_bodyparts["waggingtail_human"] = mutant_bodyparts["tail_human"]
		mutant_bodyparts -= "tail_human"
	H.update_body()

/datum/species/human/modder/stop_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["waggingtail_human"])
		mutant_bodyparts["tail_human"] = mutant_bodyparts["waggingtail_human"]
		mutant_bodyparts -= "waggingtail_human"
	H.update_body()

/datum/species/human/modder/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(H.dna.features["ears"] != "None")
			var/obj/item/organ/ears/cat/ears = new
			ears.Insert(H, drop_if_replaced = FALSE)
		else
			mutantears = /obj/item/organ/ears
		if(H.dna.features["tail_human"] != "None")
			var/obj/item/organ/tail/cat/tail = new
			tail.Insert(H, special = TRUE, drop_if_replaced = FALSE)
		else
			mutant_organs = list()
	return ..()

/datum/species/human/modder/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hairstyle = "Hime Cut"
	human.hair_color = "#ffcccc" // pink
	human.update_hair()

	var/obj/item/organ/ears/cat/cat_ears = new
	cat_ears.Insert(human, drop_if_replaced = FALSE)
	cat_ears.color = human.hair_color
	human.update_body()

/datum/species/human/modder/get_species_description()
	return "Humans are the dominant species in the known galaxy. \
		Their kind extend from old Earth to the edges of known space. \
		Modded humans are humans that have undergone advanced \
		genemodding for various reasons."

/datum/species/human/modder/get_species_lore()
	return list(
		"These primate-descended creatures, originating from the mostly harmless Earth, \
		have long-since outgrown their home and semi-benign designation. \
		The space age has taken humans out of their solar system and into the galaxy-at-large.",

		"In traditional human fashion, this near-record pace from terra firma to the final frontier spat \
		in the face of other races they now shared a stage with. \
		This included the lizards - if anyone was offended by these upstarts, it was certainly lizardkind.",

		"Humanity never managed to find the kind of peace to fully unite under one banner like other species. \
		The pencil and paper pushing of the UN bureaucrat lives on in the mosaic that is TerraGov; \
		a composite of the nation-states that still live on in human society.",

		"The human spirit of opportunity and enterprise continues on in its peak form: \
		the hypercorporation. Acting outside of TerraGov's influence, literally and figuratively, \
		hypercorporations buy the senate votes they need and establish territory far past the Earth Government's reach. \
		In hypercorporation territory company policy is law, giving new meaning to \"employee termination\".",

		"With the advent of advanced bio-engineering, many humans have undergone \"genemods\". \
		People undergo genemods for various reasons, although they are usually only cosmetic, \
		with animal ears and tails being a very popular choice."
	)
