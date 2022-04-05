/datum/sprite_accessory/ears
	key = "ears"
	generic = "Ears"
	organ_type = /obj/item/organ/ears/mutant
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE

/datum/sprite_accessory/ears/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/HD)
	if(H.head && (H.head.flags_inv & HIDEHAIR) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEHAIR)) || !HD)
		//This line basically checks if we FORCE accessory-ears to show, for items with earholes like Balaclavas and Luchador masks
		if(!(H.head && (H.head.flags_inv & SHOWSPRITEEARS) || (H.wear_mask && (H.wear_mask.flags_inv & SHOWSPRITEEARS)) || !HD))
			return TRUE
	return FALSE


/datum/sprite_accessory/ears/cat
	recommended_species = list(SPECIES_HUMAN)
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/mutant
	icon = 'modular_pariah/master_files/icons/mob/sprite_accessory/ears.dmi'
	organ_type = /obj/item/organ/ears/mutant
	color_src = USE_MATRIXED_COLORS
	recommended_species = list(SPECIES_HUMAN)
	uses_emissives = TRUE

/datum/sprite_accessory/ears/mutant/none
	name = "None"
	icon_state = "none"
	color_src = null
	factual = FALSE

/datum/sprite_accessory/ears/mutant/big
	icon = 'modular_pariah/master_files/icons/mob/sprite_accessory/ears_big.dmi'

/datum/sprite_accessory/ears/mutant/vulpkanin
	recommended_species = list(SPECIES_HUMAN)

/datum/sprite_accessory/ears/mutant/tajaran
	recommended_species = list(SPECIES_HUMAN)

/datum/sprite_accessory/ears/mutant/akula
	recommended_species = list(SPECIES_HUMAN)

/datum/sprite_accessory/ears/mutant/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/bat
	name = "Bat"
	icon_state = "bat"

/datum/sprite_accessory/ears/mutant/bear
	name = "Bear"
	icon_state = "bear"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"

/datum/sprite_accessory/ears/mutant/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/mutant/bigwolfdark //alphabetical sort ignored here for ease-of-use
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"

/datum/sprite_accessory/ears/mutant/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/mutant/bunny
	name = "Bunny"
	icon_state = "bunny"

/datum/sprite_accessory/ears/mutant/tajaran/catbig
	name = "Cat, Big"
	icon_state = "catbig"

/datum/sprite_accessory/ears/mutant/tajaran/catnormal
	name = "Cat, normal"
	icon_state = "catnormal"

/datum/sprite_accessory/ears/mutant/deer
	name = "Deer (Antler)"
	icon_state = "deer"
	color_src = USE_ONE_COLOR
	default_color = DEFAULT_TERTIARY

/datum/sprite_accessory/ears/mutant/vulpkanin/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/ears/mutant/husky
	name = "Husky"
	icon_state = "wolf"

/datum/sprite_accessory/ears/mutant/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	color_src = HAIR

/datum/sprite_accessory/ears/mutant/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"

/datum/sprite_accessory/ears/mutant/lab
	name = "Dog, Long"
	icon_state = "lab"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/ears/mutant/vulpkanin/otie
	name = "Otusian"
	icon_state = "otie"

/datum/sprite_accessory/ears/mutant/vulpkanin/wolf
	name = "Wolf"
	icon_state = "wolf"

/datum/sprite_accessory/ears/mutant/vulpkanin/perky
	name = "Perky"
	icon_state = "perky"

/datum/sprite_accessory/ears/mutant/antenna_simple1
	name = "Insect antenna (coloring 2)"
	icon_state = "antenna_simple1"

/datum/sprite_accessory/ears/mutant/antenna_simple1_v2
	name = "Insect antenna (coloring 3)"
	icon_state = "antenna_simple1v2"

/datum/sprite_accessory/ears/mutant/antenna_simple2
	name = "Insect antenna 2 (coloring 2)"
	icon_state = "antenna_simple2"

/datum/sprite_accessory/ears/mutant/antenna_simple2_v2
	name = "Insect antenna 2 (coloring 3)"
	icon_state = "antenna_simple2v2"

/datum/sprite_accessory/ears/mutant/antenna_fuzzball
	name = "Fuzzball antenna (coloring 2+3)"
	icon_state = "antenna_fuzzball"

/datum/sprite_accessory/ears/mutant/antenna_fuzzball_v2
	name = "Fuzzball antenna (coloring 3+1)"
	icon_state = "antenna_fuzzballv2"

/datum/sprite_accessory/ears/mutant/cobrahood
	name = "Cobra Hood"
	icon_state = "cobrahood"

/datum/sprite_accessory/ears/mutant/cobrahoodears
	name = "Cobra Hood (Ears)"
	icon_state = "cobraears"

/datum/sprite_accessory/ears/mutant/miqote
	name = "Miqo'te"
	icon_state = "miqote"

/datum/sprite_accessory/ears/mutant/hare
	name = "Hare"
	icon_state = "rabbitalt"

/datum/sprite_accessory/ears/mutant/bunnyalt
	name = "Curved Rabbit Ears"
	icon_state = "bunnyalt"

/datum/sprite_accessory/ears/mutant/deerear
	name = "Deer (ear)"
	icon_state = "deerear"

/datum/sprite_accessory/ears/mutant/teshari

/datum/sprite_accessory/ears/mutant/teshari/regular
	name = "Teshari Regular"
	icon_state = "teshari_regular"

/datum/sprite_accessory/ears/mutant/teshari/feathers_bushy
	name = "Teshari Feathers Bushy"
	icon_state = "teshari_feathers_bushy"

/datum/sprite_accessory/ears/mutant/teshari/feathers_mohawk
	name = "Teshari Feathers Mohawk"
	icon_state = "teshari_feathers_mohawk"

/datum/sprite_accessory/ears/mutant/teshari/feathers_spiky
	name = "Teshari Feathers Spiky"
	icon_state = "teshari_feathers_spiky"

/datum/sprite_accessory/ears/mutant/teshari/feathers_pointy
	name = "Teshari Feathers Pointy"
	icon_state = "teshari_feathers_pointy"

/datum/sprite_accessory/ears/mutant/teshari/feathers_upright
	name = "Teshari Feathers Upright"
	icon_state = "teshari_feathers_upright"

/datum/sprite_accessory/ears/mutant/teshari/feathers_mane
	name = "Teshari Feathers Mane"
	icon_state = "teshari_feathers_mane"

/datum/sprite_accessory/ears/mutant/teshari/feathers_droopy
	name = "Teshari Feathers Droopy"
	icon_state = "teshari_feathers_droopy"

/datum/sprite_accessory/ears/mutant/teshari/feathers_longway
	name = "Teshari Feathers Longway"
	icon_state = "teshari_feathers_longway"

/datum/sprite_accessory/ears/mutant/teshari/feathers_tree
	name = "Teshari Feathers Tree"
	icon_state = "teshari_feathers_tree"

/datum/sprite_accessory/ears/mutant/teshari/feathers_mushroom
	name = "Teshari Feathers Mushroom"
	icon_state = "teshari_feathers_mushroom"
	color_src = USE_ONE_COLOR
	// Converting each one of these to rbg matrixed is like a 20+ minute process per sprite to make it look good
	// and this one looks kinda meh anyway so I cba, it stays greyscale

/datum/sprite_accessory/ears/mutant/teshari/feathers_backstrafe
	name = "Teshari Feathers Backstrafe"
	icon_state = "teshari_feathers_backstrafe"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/teshari/feathers_thinmohawk
	name = "Teshari Feathers Thin Mohawk"
	icon_state = "teshari_feathers_thinmohawk"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/teshari/feathers_thinmane
	name = "Teshari Feathers Thin Mane"
	icon_state = "teshari_feathers_thinmane"
	color_src = USE_ONE_COLOR

/datum/sprite_accessory/ears/mutant/deer2
	name = "Deer 2"
	icon_state = "deer2"
	color_src = USE_ONE_COLOR
