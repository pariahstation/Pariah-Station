GLOBAL_LIST_EMPTY(headtails_list)

// The datum for Skrell.
/datum/species/skrell
	name = "Skrell"
	id = SPECIES_SKRELL
	say_mod = "warbles"
	default_color = "42F58D"
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE)
	inherent_traits = list(TRAIT_ADVANCEDTOOLUSER, TRAIT_CAN_STRIP, TRAIT_LIGHT_DRINKER)
	external_organs = list(/obj/item/organ/external/headtails = "Long")
	liked_food = VEGETABLES | FRUIT
	disliked_food = GROSS | MEAT | RAW | DAIRY
	toxic_food = TOXIC | SEAFOOD
	payday_modifier = 0.95
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/skrell
	exotic_bloodtype = "S"

	species_eye_path = 'modular_pariah/modules/skrell/icons/mob/skrell_eyes.dmi'

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

// Preset Skrell species
/mob/living/carbon/human/species/skrell
	race = /datum/species/skrell

// Skrell bloodbag, for S type blood
/obj/item/reagent_containers/blood/skrell
	blood_type = "S"

// Copper restores blood for Skrell instead of iron.
/datum/species/skrell/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, delta_time, times_fired)
	if(chem.type == /datum/reagent/copper)
		H.blood_volume += 0.5 * delta_time
		return TRUE

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
	if(human.head && (human.head.flags_inv & HIDEHAIR))
		return FALSE
	if(human.wear_mask && (human.wear_mask.flags_inv & HIDEHAIR))
		return FALSE

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

	cold_level_1_threshold = 248
	cold_level_2_threshold = 220
	cold_level_3_threshold = 170
	cold_level_1_damage = COLD_GAS_DAMAGE_LEVEL_2 //Keep in mind with gas damage levels, you can set these to be negative, if you want someone to heal, instead.
	cold_level_2_damage = COLD_GAS_DAMAGE_LEVEL_2
	cold_level_3_damage = COLD_GAS_DAMAGE_LEVEL_3
	cold_damage_type = BRUTE

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
	desc = "A strange looking sac."
	icon = 'modular_pariah/modules/skrell/icons/obj/skrell_organ.dmi'
	icon_state = "tongue"
	taste_sensitivity = 5

/datum/species/skrell/random_name(gender, unique, lastname, attempts)
	. = ""

	var/full_name = ""
	var/new_name = ""
	var/static/list/syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix")
	for(var/x = rand(1,2) to 0 step -1)
		new_name += pick(syllables)
		full_name += pick(syllables)

	full_name += " [capitalize(new_name)]"
	. += "[capitalize(full_name)]"

	if(unique && attempts < 10)
		if(findname(new_name))
			. = .(gender, TRUE, null, attempts++)

	return .

//Skrell lore

/datum/species/skrell/get_species_description()
	return "Skrells are aquatic humanoids coming from the planet of Qerrbalak, often deeply ceremonial and focused on learning more about the galaxy. \
		Their inherent fondness for learning and technology has resulted in them advancing further in science when compared to humanity, \
		however progress has mostly gone stagnant due to recent political turmoil and the economic crisis back home."

/datum/species/skrell/get_species_lore()
	return list(
		"Skrellian society is obviously quite different from that of humanity, and many outsiders often call Skrell emotionless however this is wrong,  \
		as Skrell lack facial muscles and frequently make use of their tone of voice, movement and more. \
		Skrell also sees things far more in the long term side of things because of their long lifespan.",

		"Despite the good relations enjoyed with most other species, there is a deep fear within the federation of foreign influence, and because of this   \
		fear, the federation adopted a rather isolationist foreign policy which was mostly caused by the recent political turmoil and  \
		economic crash.",

		"The economic crash also known as \"Qerrbalak recession\" was caused when a large disaster happened on huge mining facility at Urmx housing one  \
		of the federations biggest plasma mines, this disaster was caused when a fire erupted in one of the lower tunnels of XM-2 a mining site, this \
		caused an immense plasmafire that raged for 6 years and lead to the casualities of 84 employees of the facility, with 4356 being injured and around  \
		50.0000 people living on the planet being directly affected.",

		"Not only did this fire destroy one of the biggest mining sites of the federation, but as well affected various other nearby sites causing a huge scarcity in plasma. \
		As plasma supply dropped around various worlds in federation such as Qerrbalak were unable to maintain the demand in plasma, and caused a \
		huge rise in unemployment and caused a stock crash in the plasma market in federation.",
	)

//Skrell features

/datum/species/skrell/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "biohazard",
			SPECIES_PERK_NAME = "Toxin Tolerance",
			SPECIES_PERK_DESC = "Skrell have a higher resistance to toxins.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "syringe",
			SPECIES_PERK_NAME = "Haemocyanin-Based Circulatory System",
			SPECIES_PERK_DESC = "Skrell blood is restored faster with copper, iron doesn't work.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "thermometer",
			SPECIES_PERK_NAME = "Temperature Intolerance",
			SPECIES_PERK_DESC = "Skrell lungs cannot handle temperature differences.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "sun",
			SPECIES_PERK_NAME = "High Light Sensitivity",
			SPECIES_PERK_DESC = "Skrell eyes are sensitive to bright lights and are more susceptible to damage when not sufficiently protected.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "wine-bottle",
			SPECIES_PERK_NAME = "Low Alcohol Tolerance",
			SPECIES_PERK_DESC = "Skrell have a low tolerance to alcohol, resulting in them feeling the effects of it much earlier compared to other species."
		),
	)

	return to_add
