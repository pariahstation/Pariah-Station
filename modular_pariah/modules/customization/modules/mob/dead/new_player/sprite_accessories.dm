/*datum/sprite_accessory //We might need this later? If not remind me to delete this, ask Kapu for advice. //Octus
	///Unique key of an accessroy. All tails should have "tail", ears "ears" etc.
	var/key = null
	///If an accessory is special, it wont get included in the normal accessory lists
	var/special = FALSE
	var/list/recommended_species
	///Which color we default to on acquisition of the accessory (such as switching species, default color for character customization etc)
	///You can also put down a a HEX color, to be used instead as the default
	var/default_color
	///Set this to a name, then the accessory will be shown in preferences, if a species can have it. Most accessories have this
	///Notable things that have it set to FALSE are things that need special setup, such as genitals
	var/generic

	color_src = USE_ONE_COLOR

	///Which layers does this accessory affect (BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	var/relevent_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)

	///This is used to determine whether an accessory gets added to someone. This is important for accessories that are "None", which should have this set to false
	var/factual = TRUE

	///Use this as a type path to an organ that this sprite_accessory will be associated. Make sure the organ has 'mutantpart_info' set properly.
	var/organ_type

	///Set this to true to make an accessory appear as color customizable in preferences despite advanced color settings being off, will also prevent the accessory from being reset
	var/always_color_customizable
	///Whether the accessory can have a special icon_state to render, i.e. wagging tails
	var/special_render_case
	///Special case of whether the accessory should be shifted in the X dimension, check taur genitals for example
	var/special_x_dimension
	///Special case of whether the accessory should have a different icon, check taur genitals for example
	var/special_icon_case
	///Special case of applying a different color, like MODsuit tails
	var/special_colorize
	///Whether it has any extras to render, and their appropriate color sources
	var/extra = FALSE
	var/extra_color_src
	var/extra2 = FALSE
	var/extra2_color_src
	///If defined, the accessory will be only available to ckeys inside the list. ITS ASSOCIATIVE, ie. ("ckey" = TRUE). For speed
	var/list/ckey_whitelist
	///Whether this feature is genetic, and thus modifiable by DNA consoles
	var/genetic = FALSE
	var/uses_emissives = FALSE
	var/color_layer_names

/datum/sprite_accessory/proc/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/BP)
	return FALSE

/datum/sprite_accessory/proc/get_special_render_state(mob/living/carbon/human/H)
	return null

/datum/sprite_accessory/proc/get_special_render_colour(mob/living/carbon/human/H, passed_state)
	return null

/datum/sprite_accessory/proc/get_special_icon(mob/living/carbon/human/H, passed_state)
	return null

/datum/sprite_accessory/proc/get_special_x_dimension(mob/living/carbon/human/H, passed_state)
	return 0

/datum/sprite_accessory/proc/get_default_color(var/list/features, var/datum/species/pref_species) //Needs features for the color information
	var/list/colors
	switch(default_color)
		if(DEFAULT_PRIMARY)
			colors = list(features["mcolor"])
		if(DEFAULT_SECONDARY)
			colors = list(features["mcolor2"])
		if(DEFAULT_TERTIARY)
			colors = list(features["mcolor3"])
		if(DEFAULT_MATRIXED)
			colors = list(features["mcolor"], features["mcolor2"], features["mcolor3"])
		if(DEFAULT_SKIN_OR_PRIMARY)
			if(pref_species && pref_species.use_skintones)
				colors = list(features["skin_color"])
			else
				colors = list(features["mcolor"])
		else
			colors = list(default_color)

	return colors*/

/datum/sprite_accessory/teshari_ears
	icon = "modular_pariah/master_files/icons/mob/ears.dmi"
	em_block = TRUE

/datum/sprite_accessory/teshari_ears/regular
	name = "Teshari Regular"
	icon_state = "teshari_regular"

/datum/sprite_accessory/teshari_ears/feathers_bushy
	name = "Teshari Feathers Bushy"
	icon_state = "teshari_feathers_bushy"

/datum/sprite_accessory/teshari_ears/feathers_mohawk
	name = "Teshari Feathers Mohawk"
	icon_state = "teshari_feathers_mohawk"

/datum/sprite_accessory/teshari_ears/feathers_spiky
	name = "Teshari Feathers Spiky"
	icon_state = "teshari_feathers_spiky"

/datum/sprite_accessory/teshari_ears/feathers_pointy
	name = "Teshari Feathers Pointy"
	icon_state = "teshari_feathers_pointy"

/datum/sprite_accessory/teshari_ears/feathers_upright
	name = "Teshari Feathers Upright"
	icon_state = "teshari_feathers_upright"

/datum/sprite_accessory/teshari_ears/feathers_mane
	name = "Teshari Feathers Mane"
	icon_state = "teshari_feathers_mane"

/datum/sprite_accessory/teshari_ears/feathers_droopy
	name = "Teshari Feathers Droopy"
	icon_state = "teshari_feathers_droopy"

/datum/sprite_accessory/teshari_ears/feathers_longway
	name = "Teshari Feathers Longway"
	icon_state = "teshari_feathers_longway"

/datum/sprite_accessory/teshari_ears/feathers_tree
	name = "Teshari Feathers Tree"
	icon_state = "teshari_feathers_tree"

/datum/sprite_accessory/teshari_ears/feathers_mushroom
	name = "Teshari Feathers Mushroom"
	icon_state = "teshari_feathers_mushroom"
	color_src = HAIR
	// Converting each one of these to rbg matrixed is like a 20+ minute process per sprite to make it look good
	// and this one looks kinda meh anyway so I cba, it stays greyscale

/datum/sprite_accessory/teshari_ears/feathers_backstrafe
	name = "Teshari Feathers Backstrafe"
	icon_state = "teshari_feathers_backstrafe"
	color_src = HAIR

/datum/sprite_accessory/teshari_ears/feathers_thinmohawk
	name = "Teshari Feathers Thin Mohawk"
	icon_state = "teshari_feathers_thinmohawk"
	color_src = HAIR

/datum/sprite_accessory/teshari_ears/feathers_thinmane
	name = "Teshari Feathers Thin Mane"
	icon_state = "teshari_feathers_thinmane"
	color_src = HAIR

/datum/sprite_accessory/tails
	icon = 'modular_pariah/master_files/icons/mob/tails.dmi'
	em_block = TRUE

/datum/sprite_accessory/tails/teshari/default
	name = "Teshari Default Tail"
	icon_state = "teshari_default"

/datum/sprite_accessory/tails/teshari/fluffy
	name = "Teshari Fluffy Tail"
	icon_state = "teshari_fluffy"
/datum/sprite_accessory/tails/teshari/thin
	name = "Teshari Thin Tail"
	icon_state = "teshari_thin"
