
/turf/simulated/open/floor/plating/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/simulated/open/floor/plating/lowpressure
	initial_gas_mix = OPENTURF_LOW_PRESSURE
	baseturfs = /turf/simulated/open/floor/plating/lowpressure

/turf/simulated/open/floor/plating/icemoon
	icon_state = "plating"
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/simulated/open/floor/plating/abductor
	name = "alien floor"
	icon_state = "alienpod1"
	base_icon_state = "alienpod1"
	tiled_dirt = FALSE

/turf/simulated/open/floor/plating/abductor/setup_broken_states()
	return list("alienpod1")

/turf/simulated/open/floor/plating/abductor/Initialize(mapload)
	. = ..()
	icon_state = "alienpod[rand(1,9)]"

/turf/simulated/open/floor/plating/abductor2
	name = "alien plating"
	icon_state = "alienplating"
	base_icon_state = "alienplating"
	tiled_dirt = FALSE

/turf/simulated/open/floor/plating/abductor2/break_tile()
	return //unbreakable

/turf/simulated/open/floor/plating/abductor2/burn_tile()
	return //unburnable

/turf/simulated/open/floor/plating/abductor2/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/simulated/open/floor/plating/snowed
	name = "snowed-over plating"
	desc = "A section of heated plating, helps keep the snow from stacking up too high."
	icon = 'icons/turf/snow.dmi'
	icon_state = "snowplating"
	base_icon_state = "snowplating"
	initial_gas_mix = FROZEN_ATMOS
	temperature = 180
	attachment_holes = FALSE
	planetary_atmos = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/open/floor/plating/snowed/cavern
	initial_gas_mix = "n2=82;plasma=24;TEMP=120"

/turf/simulated/open/floor/plating/snowed/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/simulated/open/floor/plating/snowed/smoothed
	icon = 'icons/turf/floors/snow_turf.dmi'
	icon_state = "snow_turf-0"
	base_icon_state = "snow_turf"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FLOOR_SNOWED)
	canSmoothWith = list(SMOOTH_GROUP_FLOOR_SNOWED)
	planetary_atmos = TRUE

/turf/simulated/open/floor/plating/snowed/temperatre
	temperature = 255.37

//Used in SnowCabin.dm
/turf/simulated/open/floor/plating/snowed/snow_cabin
	temperature = 180

/turf/simulated/open/floor/plating/snowed/smoothed/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/simulated/open/floor/plating/lavaland_atmos
	planetary_atmos = TRUE
	baseturfs = /turf/simulated/open/lava/smooth/lava_land_surface
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/simulated/open/floor/plating/elevatorshaft
	name = "elevator shaft"
	icon_state = "elevatorshaft"
	base_icon_state = "elevatorshaft"
