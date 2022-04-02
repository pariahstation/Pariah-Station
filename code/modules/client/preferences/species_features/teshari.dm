/datum/preference/choiced/teshari_feathers
	savefile_key = "feature_teshari_feathers"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/choiced/teshari_feathers/init_possible_values()
	return assoc_to_keys(GLOB.teshari_feathers_list["teshari_feathers"])

/datum/preference/choiced/teshari_feathers/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["teshari_feathers"] = value
