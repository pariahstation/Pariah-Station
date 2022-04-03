/datum/species/teshari
	name = "\improper Teshari"
	plural_form = "Teshari"
	id = SPECIES_TESHARI
	say_mod = "chirps"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, NO_UNDERWEAR)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
	)
	mutant_bodyparts = list("teshari_feathers" = "Plain")
	external_organs = list(/obj/item/organ/external/teshari_feathers = "None")
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/food/meat/slab/chicken
	liked_food = MEAT
	disliked_food = GRAIN | GROSS
	coldmod = 0.67
	heatmod = 1.3
	brutemod = 1.5
	burnmod = 1.5
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/teshari

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/teshari,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/teshari,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/teshari,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/teshari,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/teshari,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/teshari,
	)

/datum/species/teshari/get_species_description()
	return "The militaristic Lizardpeople hail originally from Tizira, but have grown \
		throughout their centuries in the stars to possess a large spacefaring \
		empire: though now they must contend with their younger, more \
		technologically advanced Human neighbours."

/datum/species/teshari/get_species_lore()
	return list(
		"The face of conspiracy theory was changed forever the day mankind met the lizards.",

		"Hailing from the arid world of Tizira, lizards were travelling the stars back when mankind was first discovering how neat trains could be. \
		However, much like the space-fable of the space-tortoise and space-hare, lizards have rejected their kin's motto of \"slow and steady\" \
		in favor of resting on their laurels and getting completely surpassed by 'bald apes', due in no small part to their lack of access to plasma.",

		"The history between lizards and humans has resulted in many conflicts that lizards ended on the losing side of, \
		with the finale being an explosive remodeling of their moon. Today's lizard-human relations are seeing the continuance of a record period of peace.",

		"Lizard culture is inherently militaristic, though the influence the military has on lizard culture \
		begins to lessen the further colonies lie from their homeworld - \
		with some distanced colonies finding themselves subsumed by the cultural practices of other species nearby.",

		"On their homeworld, lizards celebrate their 16th birthday by enrolling in a mandatory 5 year military tour of duty. \
		Roles range from combat to civil service and everything in between. As the old slogan goes: \"Your place will be found!\"",
	)
