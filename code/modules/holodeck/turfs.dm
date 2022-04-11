/turf/simulated/open/floor/holofloor
	icon_state = "floor"
	holodeck_compatible = TRUE
	thermal_conductivity = 0
	flags_1 = NONE
	var/direction = SOUTH

/turf/simulated/open/floor/holofloor/attackby(obj/item/I, mob/living/user)
	return // HOLOFLOOR DOES NOT GIVE A FUCK

/turf/simulated/open/floor/holofloor/tool_act(mob/living/user, obj/item/I, tool_type)
	return

/turf/simulated/open/floor/holofloor/burn_tile()
	return //you can't burn a hologram!

/turf/simulated/open/floor/holofloor/break_tile()
	return //you can't break a hologram!

/turf/simulated/open/floor/holofloor/plating
	name = "holodeck projector floor"
	icon_state = "engine"

/turf/simulated/open/floor/holofloor/chapel
	name = "chapel floor"
	icon_state = "chapel"

/turf/simulated/open/floor/holofloor/chapel/bottom_left
	direction = WEST

/turf/simulated/open/floor/holofloor/chapel/top_right
	direction = EAST

/turf/simulated/open/floor/holofloor/chapel/bottom_right

/turf/simulated/open/floor/holofloor/chapel/top_left
	direction = NORTH

/turf/simulated/open/floor/holofloor/chapel/Initialize(mapload)
	. = ..()
	if (direction != SOUTH)
		setDir(direction)

/turf/simulated/open/floor/holofloor/white
	name = "white floor"
	icon_state = "white"

/turf/simulated/open/floor/holofloor/plating/burnmix
	name = "burn-mix floor"
	initial_gas_mix = BURNMIX_ATMOS

/turf/simulated/open/floor/holofloor/grass
	gender = PLURAL
	name = "lush grass"
	icon_state = "grass0"
	bullet_bounce_sound = null
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/grass/Initialize(mapload)
	. = ..()
	icon_state = "grass[rand(0,3)]"

/turf/simulated/open/floor/holofloor/beach
	gender = PLURAL
	name = "sand"
	icon = 'icons/misc/beach.dmi'
	icon_state = "sand"
	bullet_bounce_sound = null
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/beach/coast_t
	gender = NEUTER
	name = "coastline"
	icon_state = "sandwater_t"

/turf/simulated/open/floor/holofloor/beach/coast_b
	gender = NEUTER
	name = "coastline"
	icon_state = "sandwater_b"

/turf/simulated/open/floor/holofloor/beach/water
	name = "water"
	icon_state = "water"
	bullet_sizzle = TRUE

/turf/simulated/open/floor/holofloor/asteroid
	gender = PLURAL
	name = "asteroid sand"
	icon_state = "asteroid"
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/asteroid/Initialize(mapload)
	icon_state = "asteroid[rand(0, 12)]"
	. = ..()

/turf/simulated/open/floor/holofloor/basalt
	gender = PLURAL
	name = "basalt"
	icon_state = "basalt0"
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/basalt/Initialize(mapload)
	. = ..()
	if(prob(15))
		icon_state = "basalt[rand(0, 12)]"
		set_basalt_light(src)

/turf/simulated/open/floor/holofloor/space
	name = "\proper space"
	icon = 'icons/turf/space.dmi'
	icon_state = "0"

/turf/simulated/open/floor/holofloor/space/Initialize(mapload)
	icon_state = SPACE_ICON_STATE // so realistic
	. = ..()

/turf/simulated/open/floor/holofloor/hyperspace
	name = "\proper hyperspace"
	icon = 'icons/turf/space.dmi'
	icon_state = "speedspace_ns_1"
	bullet_bounce_sound = null
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/hyperspace/Initialize(mapload)
	icon_state = "speedspace_ns_[(x + 5*y + (y%2+1)*7)%15+1]"
	. = ..()

/turf/simulated/open/floor/holofloor/hyperspace/ns/Initialize(mapload)
	. = ..()
	icon_state = "speedspace_ns_[(x + 5*y + (y%2+1)*7)%15+1]"

/turf/simulated/open/floor/holofloor/carpet
	name = "carpet"
	desc = "Electrically inviting."
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet-255"
	base_icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_CARPET)
	canSmoothWith = list(SMOOTH_GROUP_CARPET)
	bullet_bounce_sound = null
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/carpet/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_appearance), 1)

/turf/simulated/open/floor/holofloor/carpet/update_icon(updates=ALL)
	. = ..()
	if((updates & UPDATE_SMOOTHING) && overfloor_placed && smoothing_flags & (SMOOTH_CORNERS|SMOOTH_BITMASK))
		QUEUE_SMOOTH(src)

/turf/simulated/open/floor/holofloor/wood
	icon_state = "wood"
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/snow
	gender = PLURAL
	name = "snow"
	desc = "Looks cold."
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
	slowdown = 2
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	tiled_dirt = FALSE

/turf/simulated/open/floor/holofloor/snow/cold
	initial_gas_mix = "nob=7500;TEMP=2.7"

/turf/simulated/open/floor/holofloor/dark
	icon_state = "darkfull"
