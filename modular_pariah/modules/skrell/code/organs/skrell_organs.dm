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
