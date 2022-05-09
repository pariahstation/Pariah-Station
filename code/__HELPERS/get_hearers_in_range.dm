/proc/get_hearers_in_range(range_radius, atom/source)
	var/turf/center_turf = get_turf(source)
	if(!center_turf)
		return
