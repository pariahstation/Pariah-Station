/datum/preference/toggle/allow_mismatched_parts
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "allow_mismatched_parts_toggle"
	default_value = FALSE

/datum/preference/toggle/allow_mismatched_parts/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything
