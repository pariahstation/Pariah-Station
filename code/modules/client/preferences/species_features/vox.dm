/proc/generate_vox_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/vox = icon('icons/mob/species/vox/bodyparts.dmi', "vox_head", EAST)
	var/icon/eyes = icon('icons/mob/species/vox/eyes.dmi', "eyes", EAST)

	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	vox.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		vox.Blend(icon('icons/mob/vox_snouts.dmi', "m_snout_vox_ADJ", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(vox)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)

		values[name] = final_icon

	return values

/datum/preference/choiced/vox_snout
	savefile_key = "feature_vox_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE

/datum/preference/choiced/vox_snout/init_possible_values()
	return generate_vox_side_shots(GLOB.vox_snouts_list, "snout", include_snout = FALSE)

/datum/preference/choiced/vox_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["vox_snout"] = value

/datum/preference/choiced/vox_spines
	savefile_key = "feature_vox_spines"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "spines_vox"

/datum/preference/choiced/vox_spines/init_possible_values()
	return assoc_to_keys(GLOB.spines_list_vox)

/datum/preference/choiced/vox_spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["vox_spines"] = value

/datum/preference/choiced/vox_tail
	savefile_key = "feature_vox_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "tail_vox"

/datum/preference/choiced/vox_tail/init_possible_values()
	return assoc_to_keys(GLOB.tails_list_vox)

/datum/preference/choiced/vox_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_vox"] = value

/datum/preference/choiced/vox_hair
	savefile_key = "feature_vox_hair"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	relevant_mutant_bodypart = "hair_vox"

/datum/preference/choiced/vox_hair/init_possible_values()
	return assoc_to_keys(GLOB.vox_hair_list)

/datum/preference/choiced/vox_hair/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["hair_vox"] = value

/datum/preference/choiced/vox_facial_hair
	savefile_key = "feature_vox_facial_hair"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	relevant_mutant_bodypart = "facial_hair_vox"

/datum/preference/choiced/vox_facial_hair/init_possible_values()
	return assoc_to_keys(GLOB.vox_facial_hair_list)

/datum/preference/choiced/vox_facial_hair/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["facial_hair_vox"] = value

