#define USE_BODY_SIZE "Use body_size"

/datum/preference/choiced/body_type
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "body_type"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/body_type/init_possible_values()
	return list(USE_BODY_SIZE, BODY_SIZE_SHORT, BODY_SIZE_TALL)

/datum/preference/choiced/body_type/create_default_value()
	return USE_BODY_SIZE

/datum/preference/choiced/body_type/apply_to_human(mob/living/carbon/human/target, value)
	if (value == USE_BODY_SIZE)
		target.body_size = value

/datum/preference/choiced/body_type/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	return initial(species.default_features)

#undef USE_BODY_SIZE
