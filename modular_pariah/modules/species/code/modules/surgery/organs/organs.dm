///Guess what part of the cat this is?
/obj/item/organ/external/snout/tajaran
	preference = "feature_tajaran_snout"
	dna_block = DNA_TAJARAN_SNOUT_BLOCK

/obj/item/organ/external/snout/tajaran/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/obj/item/organ/external/snout/tajaran/get_global_feature_list()
	return GLOB.snouts_list

/obj/item/organ/ears/tajaran
	name = "tajaran ears"
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "kitty"
	visual = TRUE
	damage_multiplier = 2

/obj/item/organ/ears/tajaran/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		ear_owner.dna.features["ears"] = ear_owner.dna.species.mutant_bodyparts["ears"] = "Tajaran"
		ear_owner.dna.update_uf_block(DNA_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/ears/tajaran/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
		ear_owner.dna.species.mutant_bodyparts -= "ears"
		ear_owner.update_body()

/obj/item/organ/tail/tajaran
	name = "tajaran tail"
	desc = "A severed tajaran tail. Poor kitty!"
	color = "#4B4B4B"
	tail_type = "Tajaran"

/obj/item/organ/tail/tajaran/Initialize(mapload)
	. = ..()
	color = "#"+ random_color()

/obj/item/organ/tail/tajaran/Insert(mob/living/carbon/human/tail_owner, special = FALSE, drop_if_replaced = TRUE)
	..()
	if(istype(tail_owner))
		var/default_part = tail_owner.dna.species.mutant_bodyparts["tail_tajaran"]
		if(!default_part || default_part == "None")
			if(tail_type)
				tail_owner.dna.features["tail_tajaran"] = tail_owner.dna.species.mutant_bodyparts["tail_tajaran"] = tail_type
				tail_owner.dna.update_uf_block(DNA_TAJARAN_TAIL_BLOCK)
			else
				tail_owner.dna.species.mutant_bodyparts["tail_tajaran"] = tail_owner.dna.features["tail_tajaran"]
		tail_owner.update_body()

/obj/item/organ/tail/tajaran/Remove(mob/living/carbon/human/tail_owner, special = FALSE)
	..()
	if(istype(tail_owner))
		tail_owner.dna.species.mutant_bodyparts -= "tail_tajaran"
		color = tail_owner.dna.features["mcolor"]
		tail_type = tail_owner.dna.features["tail_tajaran"]
		tail_owner.update_body()

/obj/item/organ/tail/tajaran/before_organ_replacement(obj/item/organ/replacement)
	. = ..()
	var/obj/item/organ/tail/tajaran/new_tail = replacement

	if(!istype(new_tail))
		return

	new_tail.tail_type = tail_type
