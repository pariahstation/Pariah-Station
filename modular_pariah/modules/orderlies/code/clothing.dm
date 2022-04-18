/datum/outfit/job/orderly
	name = "Orderly"
	jobtype = /datum/job/orderly

	head = /obj/item/clothing/head/helmet/blueshirt/orderly
	ears = /obj/item/radio/headset/headset_med
	suit = /obj/item/clothing/suit/armor/vest/blueshirt/orderly
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt/orderly
	belt = /obj/item/pda/medical
	shoes = /obj/item/clothing/shoes/sneakers/white

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	box = /obj/item/storage/box/survival/medical

	id_trim = /datum/id_trim/job/orderly


/obj/item/clothing/under/rank/security/officer/blueshirt/orderly
	name = "orderly uniform"
	icon_state = "orderly_uniform"
	icon = 'modular_pariah/master_files/icons/obj/clothing/under/medical.dmi'
	worn_icon = 'modular_pariah/master_files/icons/mob/clothing/under/medical.dmi'

/obj/item/clothing/suit/armor/vest/blueshirt/orderly
	name = "armored orderly coat"
	desc = "An armored coat, to keep you safe from unruly patients."
	icon_state = "medical_coat"
	icon = 'modular_pariah/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_pariah/master_files/icons/mob/clothing/suit.dmi'

/obj/item/clothing/head/helmet/blueshirt/orderly
	icon_state = "orderly_helm"
	icon = 'modular_pariah/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_pariah/master_files/icons/mob/clothing/head.dmi'
