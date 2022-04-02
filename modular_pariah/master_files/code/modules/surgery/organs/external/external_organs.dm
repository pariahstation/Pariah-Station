/obj/item/organ/external/teshari_feathers
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_POD_HAIR
	layers = EXTERNAL_FRONT|EXTERNAL_ADJACENT

	feature_key = "teshari_feathers"

	dna_block = DNA_TESHARI_FEATHERS

/obj/item/organ/external/teshari_feathers/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return TRUE
	return FALSE

/obj/item/organ/external/teshari_feathers/get_global_feature_list()
	return GLOB.teshari_feathers_list
