/datum/sprite_accessory/snouts
	key = "snout"
	generic = "Snout"
	icon = 'modular_pariah/master_files/icons/mob/sprite_accessory/lizard_snouts.dmi'
	recommended_species = list(SPECIES_MAMMAL, SPECIES_LIZARD, SPECIES_LIZARD_ASH, SPECIES_LIZARD_SILVER)
	relevent_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE

/datum/sprite_accessory/snouts/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/HD)
	if((H.wear_mask && (H.wear_mask.flags_inv & HIDESNOUT)) || (H.head && (H.head.flags_inv & HIDESNOUT)) || !HD)
		return TRUE
	return FALSE

/datum/sprite_accessory/snouts/none
	name = "None"
	icon_state = "none"
	use_muzzled_sprites = FALSE
	factual = FALSE

/datum/sprite_accessory/snouts/mammal
	icon = 'modular_pariah/master_files/icons/mob/sprite_accessory/snouts.dmi'
	color_src = USE_MATRIXED_COLORS
	recommended_species = list(SPECIES_MAMMAL, SPECIES_HUMANOID)

/datum/sprite_accessory/snouts/mammal/vulpkanin
	recommended_species = list(SPECIES_MAMMAL, SPECIES_VULP, SPECIES_HUMANOID)

/datum/sprite_accessory/snouts/mammal/tajaran
	recommended_species = list(SPECIES_MAMMAL, SPECIES_TAJARAN, SPECIES_HUMANOID)

/datum/sprite_accessory/snouts/mammal/vulpkanin/lcanid
	name = "Mammal, Long"
	icon_state = "lcanid"

/datum/sprite_accessory/snouts/mammal/lcanidalt
	name = "Mammal, Long ALT"
	icon_state = "lcanidalt"

/datum/sprite_accessory/snouts/mammal/vulpkanin/lcanidstriped
	name = "Mammal, Long, Striped"
	icon_state = "lcanidstripe"

/datum/sprite_accessory/snouts/mammal/lcanidstripedalt
	name = "Mammal, Long, Striped ALT"
	icon_state = "lcanidstripealt"

/datum/sprite_accessory/snouts/mammal/tajaran/scanid
	name = "Mammal, Short"
	icon_state = "scanid"

/datum/sprite_accessory/snouts/mammal/tajaran/scanidalt
	name = "Mammal, Short ALT"
	icon_state = "scanidalt"

/datum/sprite_accessory/snouts/mammal/tajaran/scanidalt2
	name = "Mammal, Short ALT 2"
	icon_state = "scanidalt2"

/datum/sprite_accessory/snouts/mammal/tajaran/scanidalt3
	name = "Mammal, Short ALT 3"
	icon_state = "scanidalt3"

/datum/sprite_accessory/snouts/mammal/tajaran/normal
	name = "Tajaran, normal"
	icon_state = "ntajaran"
	color_src = USE_ONE_COLOR

/******************************************
**************** Snouts *******************
*************but higher up*****************/

/datum/sprite_accessory/snouts/mammal/vulpkanin/flcanid
	name = "Mammal, Long (Top)"
	icon_state = "flcanid"

/datum/sprite_accessory/snouts/mammal/flcanidalt
	name = "Mammal, Long ALT (Top)"
	icon_state = "flcanidalt"

/datum/sprite_accessory/snouts/mammal/vulpkanin/flcanidstriped
	name = "Mammal, Long, Striped (Top)"
	icon_state = "flcanidstripe"

/datum/sprite_accessory/snouts/mammal/flcanidstripedalt
	name = "Mammal, Long, Striped ALT (Top)"
	icon_state = "flcanidstripealt"

/datum/sprite_accessory/snouts/mammal/tajaran/fscanid
	name = "Mammal, Short (Top)"
	icon_state = "fscanid"

/datum/sprite_accessory/snouts/mammal/tajaran/fscanidalt
	name = "Mammal, Short ALT (Top)"
	icon_state = "fscanidalt"

/datum/sprite_accessory/snouts/mammal/tajaran/fscanidalt2
	name = "Mammal, Short ALT 2 (Top)"
	icon_state = "fscanidalt2"

/datum/sprite_accessory/snouts/mammal/tajaran/fscanidalt3
	name = "Mammal, Short ALT 3 (Top)"
	icon_state = "fscanidalt3"

/datum/sprite_accessory/snouts/mammal/fwolf
	name = "Mammal, Thick (Top)"
	icon_state = "fwolf"

/datum/sprite_accessory/snouts/mammal/fwolfalt
	name = "Mammal, Thick ALT (Top)"
	icon_state = "fwolfalt"
