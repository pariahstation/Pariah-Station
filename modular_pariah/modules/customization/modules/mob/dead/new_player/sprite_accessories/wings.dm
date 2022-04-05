// When adding or making new wing sprites, try to use matrixed colours!
// You can find a color palette to work with in modular_pariah\modules\customization\icons\mob\sprite_accessory\wings.dmi as 'colorpalette matrixcolors'
// Check some of the wings that make use of them for examples on how to make it look decent
/datum/sprite_accessory/wings
	icon = 'icons/mob/clothing/wings.dmi'
	generic = "Wings"
	key = "wings"
	color_src = USE_ONE_COLOR
	organ_type = /obj/item/organ/external/wings
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER, BODY_ADJ_LAYER)
	genetic = TRUE

/datum/sprite_accessory/wings/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/HD)
	if(H.wear_suit && H.try_hide_mutant_parts)
		return TRUE
	return FALSE

/datum/sprite_accessory/wings/none
	name = "None"
	icon_state = "none"
	factual = FALSE

/datum/sprite_accessory/wings/angel
	color_src = USE_ONE_COLOR
	default_color = "#FFFFFF"

/datum/sprite_accessory/wings/megamoth
	color_src = USE_ONE_COLOR
	default_color = "#FFFFFF"

/datum/sprite_accessory/wings/dragon
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/wings/moth
	icon = 'modular_pariah/master_files/icons/mob/sprite_accessory/moth_wings.dmi' //Needs new icon to suit new naming convention
	default_color = "#FFFFFF"
	recommended_species = list(SPECIES_MOTH) //Mammals too, I guess. They wont get flight though, see the wing organs for that logic
	organ_type = /obj/item/organ/external/wings/moth
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/wings/moth/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/wings/moth/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/HD)
	if((H.wear_suit && (H.try_hide_mutant_parts || (H.wear_suit.flags_inv & HIDEJUMPSUIT) && (!H.wear_suit.species_exception || !is_type_in_list(H.dna.species, H.wear_suit.species_exception)))))
		return TRUE
	return FALSE

/datum/sprite_accessory/wings/moth/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/wings/moth/monarch
	name = "Monarch"
	icon_state = "monarch"

/datum/sprite_accessory/wings/moth/luna
	name = "Luna"
	icon_state = "luna"

/datum/sprite_accessory/wings/moth/atlas
	name = "Atlas"
	icon_state = "atlas"

/datum/sprite_accessory/wings/moth/reddish
	name = "Reddish"
	icon_state = "redish"

/datum/sprite_accessory/wings/moth/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/wings/moth/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/wings/moth/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/wings/moth/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/wings/moth/punished
	name = "Burnt Off"
	icon_state = "punished"
	locked = TRUE

/datum/sprite_accessory/wings/moth/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/wings/moth/deathhead
	name = "Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/wings/moth/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/wings/moth/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/wings/moth/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/wings/moth/snow
	name = "Snow"
	icon_state = "snow"

/datum/sprite_accessory/wings/moth/oakworm
	name = "Oak Worm"
	icon_state = "oakworm"

/datum/sprite_accessory/wings/moth/jungle
	name = "Jungle"
	icon_state = "jungle"

/datum/sprite_accessory/wings/moth/witchwing
	name = "Witch Wing"
	icon_state = "witchwing"

/datum/sprite_accessory/wings/moth/rosy
	name = "Rosy"
	icon_state = "rosy"

/datum/sprite_accessory/wings/moth/featherful // Is actually 'feathery' on upstream
	name = "Featherful"
	icon_state = "featherful"

/datum/sprite_accessory/wings/moth/brown
	name = "Brown"
	icon_state = "brown"

/datum/sprite_accessory/wings/moth/plasmafire
	name = "Plasmafire"
	icon_state = "plasmafire"

