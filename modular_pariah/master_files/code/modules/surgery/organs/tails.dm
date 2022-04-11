/obj/item/organ/tail/teshari_tails
	name = "teshari tail"
	desc = "A severed teshari tail. Makes a funny looking feather duster."
	tail_type = "Teshari Default Tail"

/obj/item/organ/tail/teshari/Insert(mob/living/carbon/human/tail_owner, special = FALSE, drop_if_replaced = TRUE)
	..()
	if(istype(tail_owner))
		var/default_part = tail_owner.dna.species.mutant_bodyparts["tail_teshari"]
		if(!default_part || default_part == "None")
			if(tail_type)
				tail_owner.dna.features["tail_teshari"] = tail_owner.dna.species.mutant_bodyparts["tail_teshari"] = tail_type
				tail_owner.dna.update_uf_block(DNA_TESHARI_TAIL_BLOCK)
			else
				tail_owner.dna.species.mutant_bodyparts["tail_teshari"] = tail_owner.dna.features["tail_teshari"]
			tail_owner.update_body()

/obj/item/organ/tail/teshari/Remove(mob/living/carbon/human/tail_owner, special = FALSE)
	..()
	if(istype(tail_owner))
		tail_owner.dna.species.mutant_bodyparts -= "tail_teshari"
		color = tail_owner.hair_color
		tail_owner.update_body()
