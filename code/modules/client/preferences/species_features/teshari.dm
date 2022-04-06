/datum/preference/choiced/teshari_feathers
	savefile_key = "feature_teshari_feathers"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Feathers"
	should_generate_icons = TRUE

/datum/preference/choiced/teshari_feathers/init_possible_values()
	var/list/values = list()

	var/icon/teshari_head = icon('modular_pariah/master_files/icons/mob/teshari_feathers.dmi', "teshari_feathers_m")
	teshari_head.Blend(icon('icons/mob/human_face.dmi', "tesharieyes"), ICON_OVERLAY)

	for(var/feather_style in GLOB.teshari_feathers_list)
		var/datum/sprite_accessory/teshari_feathers = GLOB.teshari_feathers_list[feather_style]

		var/icon/icon_with_hair = new(teshari_head)
		var/icon/icon_adj = icon(teshari_feathers.icon, "m_teshari_feathers_[teshari_feathers.icon_state]_ADJ")
		var/icon/icon_front = icon(teshari_feathers.icon, "m_teshari_feathers_[teshari_feathers.icon_state]_FRONT")
		icon_adj.Blend(icon_front, ICON_OVERLAY)
		icon_with_hair.Blend(icon_adj, ICON_OVERLAY)
		icon_with_hair.Scale(64, 64)
		icon_with_hair.Crop(15, 64, 15 + 31, 64 - 31)

		values[teshari_feathers.name] = icon_with_hair

	return values

/datum/preference/choiced/teshari_feathers/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["teshari_feathers"] = value
