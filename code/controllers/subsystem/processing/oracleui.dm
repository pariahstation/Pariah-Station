PROCESSING_SUBSYSTEM_DEF(oracleui)
	name = "OracleUI"
	wait = 1 SECONDS
	flags = SS_NO_INIT
	priority = FIRE_PRIORITY_ORACLEUI

///Transfers oracle UIs to the new mob. Stolen from SStgui. Get fucked.
/datum/controller/subsystem/processing/oracleui/proc/transfer_uis(mob/source, mob/target)
	if(length(source?.open_oracle_uis) == 0)
		return FALSE
	if(isnull(target.open_oracle_uis) || !istype(target.tgui_open_uis, /list))
		target.open_oracle_uis = list()
	// Transfer all the UIs.
	for(var/datum/oracle_ui/ui in source.open_oracle_uis)
		// Inform the UIs of their new owner.
		ui.close(source)
		ui.viewers -= source
	// Clear the old list.
	source.open_oracle_uis.Cut()
	return TRUE
