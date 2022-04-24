/proc/generate_tajaran_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/tajaran = icon('modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi', "tajaran_head", EAST)
	var/icon/eyes = icon('icons/mob/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	tajaran.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		tajaran.Blend(icon('icons/mob/mutant_bodyparts.dmi', "m_snout_tajaran_ADJ", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(tajaran)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)

		values[name] = final_icon

	return values

/datum/preference/choiced/tajaran_body_markings
	savefile_key = "feature_tajaran_body_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Body markings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "body_markings_tajaran"

/datum/preference/choiced/tajaran_body_markings/init_possible_values()
	var/list/values = list()

	var/icon/tajaran = icon('modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi', "tajaran_chest_m")

	for (var/name in GLOB.body_markings_list_tajaran)
		var/datum/sprite_accessory/sprite_accessory = GLOB.body_markings_list_tajaran[name]

		var/icon/final_icon = icon(tajaran)

		if (sprite_accessory.icon_state != "none")
			var/icon/body_markings_icon = icon(
				'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi',
				"m_body_markings_[sprite_accessory.icon_state]_ADJ",
			)

			final_icon.Blend(body_markings_icon, ICON_OVERLAY)

		final_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		final_icon.Crop(10, 8, 22, 23)
		final_icon.Scale(26, 32)
		final_icon.Crop(-2, 1, 29, 32)

		values[name] = final_icon

	return values

/datum/preference/choiced/tajaran_body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["body_markings_tajaran"] = value

/datum/preference/choiced/tajaran_legs
	savefile_key = "feature_tajaran_legs"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "legs"

/datum/preference/choiced/tajaran_legs/init_possible_values()
	return assoc_to_keys(GLOB.legs_list)

/datum/preference/choiced/tajaran_legs/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["legs"] = value

/datum/preference/choiced/tajaran_snout
	savefile_key = "feature_tajaran_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE

/datum/preference/choiced/tajaran_snout/init_possible_values()
	return generate_tajaran_side_shots(GLOB.snouts_list_tajaran, "snout_tajaran", include_snout = FALSE)

/datum/preference/choiced/tajaran_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_tajaran"] = value

/datum/preference/choiced/tajaran_tail
	savefile_key = "feature_tajaran_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "tail_tajaran"

/datum/preference/choiced/tajaran_tail/init_possible_values()
	return assoc_to_keys(GLOB.tails_list_tajaran)

/datum/preference/choiced/tajaran_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_tajaran"] = value
