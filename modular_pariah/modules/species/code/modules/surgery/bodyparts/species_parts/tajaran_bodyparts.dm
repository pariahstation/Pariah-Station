/obj/item/bodypart/head/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	is_dimorphic = FALSE
	uses_mutcolor = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_SNOUTED

/obj/item/bodypart/chest/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE
	is_dimorphic = TRUE

/obj/item/bodypart/l_arm/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE

/obj/item/bodypart/r_arm/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE

/obj/item/bodypart/l_leg/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE

/obj/item/bodypart/r_leg/tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE

/obj/item/bodypart/l_leg/digitigrade_tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = "digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/l_leg/digitigrade_tajaran/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = "digitigrade_tajaran"

		else
			limb_id = "tajaran"

/obj/item/bodypart/r_leg/digitigrade_tajaran
	icon_greyscale = 'modular_pariah/modules/species/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = "digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/r_leg/digitigrade_tajaran/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = "digitigrade_tajaran"

		else
			limb_id = "tajaran"
