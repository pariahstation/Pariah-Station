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

	var/obj/item/organ/ears/cat/cat_ears = human.getorgan(/obj/item/organ/ears/cat)
	if (cat_ears)
		cat_ears.color = human.hair_color
		human.update_body()

/datum/species/human/modder/get_species_description()
	return "Modded humans are humans who have undergone genetic modifcation \
		for various reasons. Perhaps this was for animal ears, changing \
		height, or maybe even to increase penis size! Who knows!"

//i dont really feel like writing a fucking essay about genemodder rn
/*
/datum/species/human/modder/get_species_lore()
	return list(
		"Bio-engineering at its felinest, Felinids are the peak example of humanity's mastery of genetic code. \
			One of many \"Animalid\" variants, Felinids are the most popular and common, as well as one of the \
			biggest points of contention in genetic-modification.",

		"Body modders were eager to splice human and feline DNA in search of the holy trifecta: ears, eyes, and tail. \
			These traits were in high demand, with the corresponding side effects of vocal and neurochemical changes being seen as a minor inconvenience.",

		"Sadly for the Felinids, they were not minor inconveniences. Shunned as subhuman and monstrous by many, Felinids (and other Animalids) \
			sought their greener pastures out in the colonies, cloistering in communities of their own kind. \
			As a result, outer Human space has a high Animalid population.",
	)
*/
