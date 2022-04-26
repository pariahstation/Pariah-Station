/obj/item/organ/external/headtails
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HEADTAILS
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	dna_block = DNA_HEADTAILS_BLOCK
	feature_key = "headtails"
	preference = "feature_headtails"

/obj/item/organ/external/headtails/can_draw_on_bodypart(mob/living/carbon/human/human)
	. = TRUE
	if(human.head && (human.head.flags_inv & HIDEHAIR))
		return FALSE
	if(human.wear_mask && (human.wear_mask.flags_inv & HIDEHAIR))
		return FALSE

/obj/item/organ/external/headtails/get_global_feature_list()
	return GLOB.headtails_list
