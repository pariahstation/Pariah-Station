//Convenience function for atoms to update turfs they occupy
/atom/movable/proc/update_nearby_tiles(need_rebuild)
	//for(var/turf/simulated/turf in locs) ZASTURF
	for(var/turf/turf in locs)
		if(!turf.simulated)
			continue
		SSzas.mark_for_update(turf)

	return 1


//Returns:
// 0 - Not blocked
// AIR_BLOCKED - Blocked
// ZONE_BLOCKED - Not blocked, but zone boundaries will not cross.
// BLOCKED - Blocked, zone boundaries will not cross even if opened.
///Checks whether or not ZAS can occupy this atom's turf. Invoked by the ATMOS_CANPASS_TURF macro.
/atom/proc/zas_canpass(turf/other)
	#ifdef ZASDBG
	ASSERT(isturf(other))
	#endif
	if(can_atmos_pass == CANPASS_PROC)
		CRASH("Atmos pass assigned proc when proc doesn't exist.")
	else
		CRASH("FUCK. zas_canpass() invoked when the atom doesn't even use it")

// This is a legacy proc only here for compatibility - you probably should just use ATMOS_CANPASS_TURF directly.
/turf/zas_canpass(turf/other)
	#ifdef ZASDBG
	ASSERT(isturf(other))
	#endif

	. = 0
	ATMOS_CANPASS_TURF(., src, other)

/atom/proc/zas_mark_update()
	var/turf/local_turf = get_turf(loc)
	if(!local_turf)
		return
	SSzas.mark_for_update(local_turf)

/atom
	var/simulated = TRUE
	var/can_atmos_pass = CANPASS_ALWAYS
#ifdef ZASDBG
	var/verbose = FALSE
#endif
