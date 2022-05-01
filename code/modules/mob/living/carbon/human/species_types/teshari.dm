/datum/species/teshari
	name = "\improper Teshari"
	plural_form = "Teshari"
	id = SPECIES_TESHARI
	species_traits = list(MUTCOLORS, EYECOLOR, NO_UNDERWEAR, HAS_FLESH, HAS_BONE)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/teshari
	species_eye_path = 'icons/mob/species/teshari/eyes.dmi'

	say_mod = "chirps"
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	meat = /obj/item/food/meat/slab/chicken
	liked_food = MEAT
	disliked_food = GRAIN | GROSS

	payday_modifier = 0.75
	punchdamagelow = 0 // TODO: Make sure these are all correct with the lore people
	punchdamagehigh = 6
	heatmod = 1.5
	coldmod = 0.67
	brutemod = 1.5
	burnmod = 1.5
	bodytemp_normal = BODYTEMP_NORMAL + 30
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_DAMAGE_LIMIT + 30
	bodytemp_cold_damage_limit = BODYTEMP_COLD_DAMAGE_LIMIT + 30

	offset_features = list(OFFSET_EARS = list(0,-4), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-4), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-4), OFFSET_ACCESSORY = list(0, -4))
	external_organs = list(/obj/item/organ/external/teshari_feathers = "Plain", /obj/item/organ/external/teshari_body_feathers = "Plain")
	mutant_bodyparts = list("tail_teshari" = "Teshari Default Tail")
	mutant_organs = list(/obj/item/organ/tail/teshari)
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/teshari,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/teshari,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/teshari,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/teshari,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/teshari,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/teshari,
	)

/datum/species/teshari/random_name(gender, unique, lastname)
	if(unique)
		return random_unique_teshari_name()
	return teshari_name()

/datum/species/teshari/get_species_description()
	return "Placeholder"

/datum/species/teshari/get_species_lore()
	return list(
		"Placeholder"
	)
