/datum/job/orderly
	title = JOB_ORDERLY
	alt_titles = list("Orderly", "Medical Guard")
	description = "Defend the medical department, hold down idiots who refuse the vaccine, flex your muscles at people who fuck with medical."
	department_head = list(JOB_CHIEF_MEDICAL_OFFICER)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer, <b>NOT SECURITY</b>"
	selection_color = "#ffeeee" // This isn't actually being used for anything but may as well
	exp_granted_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/orderly
	plasmaman_outfit = /datum/outfit/plasmaman/medical

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_MED

	display_order = JOB_DISPLAY_ORDER_ORDERLY
	bounty_types = CIV_JOB_MED
	departments_list = list(
		/datum/job_department/medical
	)

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law, /obj/item/clothing/head/beret/sec)

	mail_goodies = list(
		/obj/item/food/donut/caramel = 10,
		/obj/item/food/donut/matcha = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/clothing/mask/whistle = 5,
		/obj/item/melee/baton/security/boomerang/loaded = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/id_trim/job/orderly
	assignment = "Orderly"
	trim_icon = 'modular_pariah/modules/orderlies/icons/items.dmi'
	trim_state = "trim_orderly"
	sechud_icon_state = SECHUD_ORDERLY
	extra_access = list(ACCESS_BRIG_ENTRANCE, ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_PHARMACY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_BRIG_ENTRANCE, ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_PHARMACY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	config_job = "orderly"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/orderly
