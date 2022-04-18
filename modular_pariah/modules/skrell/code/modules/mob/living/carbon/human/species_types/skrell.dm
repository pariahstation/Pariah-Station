GLOBAL_LIST_EMPTY(headtails_list)

/randomize_human(mob/living/carbon/human/H)
	H.dna.features["headtails"] = pick(GLOB.headtails_list)
	. = ..()

// The datum for Skrell.
/datum/species/skrell
	name = "Skrell"
	id = SPECIES_SKRELL
	say_mod = "warbles"
	default_color = "42F58D"
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, NO_SLIP_WHEN_WALKING)
	inherent_traits = list(TRAIT_ADVANCEDTOOLUSER, TRAIT_CAN_STRIP, TRAIT_LIGHT_DRINKER)
	external_organs = list(/obj/item/organ/external/headtails = "Long")
	liked_food = VEGETABLES | FRUIT
	disliked_food = GROSS | MEAT | RAW | DAIRY
	toxic_food = TOXIC | SEAFOOD
	payday_modifier = 0.95
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/skrell
	exotic_bloodtype = "S"

	mutantbrain = /obj/item/organ/brain/skrell
	mutanteyes = /obj/item/organ/eyes/skrell
	mutantlungs = /obj/item/organ/lungs/skrell
	mutantheart = /obj/item/organ/heart/skrell
	mutantliver = /obj/item/organ/liver/skrell
	mutanttongue = /obj/item/organ/tongue/skrell

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/skrell,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/skrell,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/skrell,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/skrell,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/skrell,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/skrell,
	)

/datum/species/skrell/spec_life(mob/living/carbon/human/skrell_mob, delta_time, times_fired)
	. = ..()
	if(skrell_mob.nutrition > NUTRITION_LEVEL_ALMOST_FULL)
		skrell_mob.set_nutrition(NUTRITION_LEVEL_ALMOST_FULL)

/datum/species/skrell/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_BLUE_GRAY)
	human.update_body()
	human.update_body_parts()

// Preset Skrell species
/mob/living/carbon/human/species/skrell
	race = /datum/species/skrell

// Skrell bloodbag, for S type blood
/obj/item/reagent_containers/blood/skrell
	blood_type = "S"

// Copper restores blood for Skrell instead of iron.
/datum/reagent/copper/on_mob_life(mob/living/carbon/C, delta_time)
	if((isskrell(C)) && (C.blood_volume < BLOOD_VOLUME_NORMAL))
		C.blood_volume += 0.5 * delta_time
	..()

// Organ for Skrell head tentacles.
/obj/item/organ/external/headtails
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HEADTAILS
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	dna_block = DNA_HEADTAILS_BLOCK
	feature_key = "headtails"
	preference = "feature_headtails"

/obj/item/organ/external/headtails/can_draw_on_bodypart(mob/living/carbon/human/human)
	. = TRUE
	if(istype(human.head) && (human.head.flags_inv & HIDEHAIR))
		. = FALSE
	if(istype(human.wear_mask) && (human.wear_mask.flags_inv & HIDEHAIR))
		. = FALSE
	var/obj/item/bodypart/head/our_head = human.get_bodypart(BODY_ZONE_HEAD)
	if(our_head && !IS_ORGANIC_LIMB(our_head))
		. = FALSE

/obj/item/organ/external/headtails/get_global_feature_list()
	return GLOB.headtails_list


/obj/item/organ/heart/skrell
	name = "skrellian heart"
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "heart"

/obj/item/organ/brain/skrell
	name = "spongy brain"
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "brain2"

/obj/item/organ/eyes/skrell
	name = "amphibian eyes"
	desc = "Large black orbs."
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "eyes"
	flash_protect = FLASH_PROTECTION_SENSITIVE

/obj/item/organ/lungs/skrell
	name = "skrell lungs"
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "lungs"
	safe_plasma_max = 40
	safe_co2_max = 40

	cold_message = "You can't stand the freezing cold with every breath you take!"
	cold_level_1_threshold = 248
	cold_level_2_threshold = 220
	cold_level_3_threshold = 170
	cold_level_1_damage = COLD_GAS_DAMAGE_LEVEL_2 //Keep in mind with gas damage levels, you can set these to be negative, if you want someone to heal, instead.
	cold_level_2_damage = COLD_GAS_DAMAGE_LEVEL_2
	cold_level_3_damage = COLD_GAS_DAMAGE_LEVEL_3
	cold_damage_type = BRUTE

	hot_message = "You can't stand the searing heat with every breath you take!"
	heat_level_1_threshold = 318
	heat_level_2_threshold = 348
	heat_level_3_threshold = 1000
	heat_level_1_damage = HEAT_GAS_DAMAGE_LEVEL_2
	heat_level_2_damage = HEAT_GAS_DAMAGE_LEVEL_2
	heat_level_3_damage = HEAT_GAS_DAMAGE_LEVEL_3
	heat_damage_type = BURN

/obj/item/organ/liver/skrell
	name = "skrell liver"
	icon_state = "liver"
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	alcohol_tolerance = 5
	toxTolerance = 10 //can shrug off up to 10u of toxins.
	toxLethality = 0.8 * LIVER_DEFAULT_TOX_LETHALITY //20% less damage than a normal liver

/obj/item/organ/tongue/skrell
	name = "internal vocal sacs"
	desc = "An Strange looking sac."
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "tongue"
	taste_sensitivity = 5
	var/static/list/languages_possible_skrell = typecacheof(list(
		/datum/language/common,
		/datum/language/uncommon,
		/datum/language/draconic,
		/datum/language/codespeak,
		/datum/language/monkey,
		/datum/language/narsie,
		/datum/language/beachbum,
		/datum/language/aphasia,
		/datum/language/piratespeak,
		/datum/language/moffic,
		/datum/language/sylvan,
		/datum/language/shadowtongue,
		/datum/language/terrum,
		/datum/language/skrell,
	))

