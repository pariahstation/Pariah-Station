/obj/structure/low_wall
	name = "low wall"
	desc = "A low wall, with space to mount windows or grilles on top of it."
	icon = 'icons/obj/smooth_structures/low_wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	color = "#57575c" //To display in mapping softwares
	density = TRUE
	anchored = TRUE
	pass_flags_self = PASSTABLE | LETPASSTHROW
	layer = LOW_WALL_LAYER
	max_integrity = 150
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_LOW_WALL)
	canSmoothWith = list(SMOOTH_GROUP_LOW_WALL, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)
	armor = list(MELEE = 20, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 25, BIO = 100, RAD = 100, FIRE = 80, ACID = 100)
	/// Material used in construction
	var/plating_material = /datum/material/iron
	/// Paint color of our wall
	var/wall_paint
	/// Paint colour of our stripe
	var/stripe_paint
	/// Typecache of airlocks to apply a neighboring stripe overlay to
	var/static/list/airlock_typecache

/obj/structure/low_wall/examine(mob/user)
	. = ..()
	. += span_notice("You could <b>weld</b> it down.")
	if(wall_paint)
		. += span_notice("It's coated with a <font color=[wall_paint]>layer of paint</font>.")
	if(stripe_paint)
		. += span_notice("It has a <font color=[stripe_paint]>painted stripe</font> around its base.")

/obj/structure/low_wall/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/climbable)
	set_material(plating_material)
	if(wall_paint)
		set_wall_paint(wall_paint)
	if(stripe_paint)
		set_stripe_paint(stripe_paint)
	QUEUE_SMOOTH(src)
	QUEUE_SMOOTH_NEIGHBORS(src)

/obj/structure/low_wall/update_overlays()
	overlays.Cut()
	var/datum/material/plating_mat_ref = GET_MATERIAL_REF(plating_material)
	var/mutable_appearance/smoothed_stripe = mutable_appearance(plating_mat_ref.wall_stripe_icon, icon_state, layer = LOW_WALL_STRIPE_LAYER, appearance_flags = RESET_COLOR)
	if(stripe_paint)
		smoothed_stripe.color = stripe_paint
	else
		smoothed_stripe.color = color
	overlays += smoothed_stripe

	if(!airlock_typecache)
		airlock_typecache = typecacheof(/obj/machinery/door/airlock)
	var/neighbor_stripe = NONE
	for(var/cardinal in GLOB.cardinals)
		var/turf/step_turf = get_step(src, cardinal)
		for(var/atom/movable/movable_thing as anything in step_turf)
			if(airlock_typecache[movable_thing.type])
				neighbor_stripe ^= cardinal
				break
	if(neighbor_stripe)
		var/mutable_appearance/neighb_stripe_appearace = mutable_appearance('icons/turf/walls/neighbor_stripe.dmi', "[neighbor_stripe]", layer = LOW_WALL_STRIPE_LAYER, appearance_flags = RESET_COLOR)
		if(stripe_paint)
			neighb_stripe_appearace.color = stripe_paint
		else
			neighb_stripe_appearace.color = color
		overlays += neighb_stripe_appearace
	return ..()

/obj/structure/low_wall/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(.)
		return
	if(mover.throwing)
		return TRUE
	if(locate(/obj/structure/low_wall) in get_turf(mover))
		return TRUE

/obj/structure/low_wall/attackby(obj/item/weapon, mob/living/user, params)
	if(is_top_obstructed())
		return TRUE
	if(!(flags_1 & NODECONSTRUCT_1))
		if(weapon.tool_behaviour == TOOL_WELDER)
			if(weapon.tool_start_check(user, amount = 0))
				to_chat(user, span_notice("You start cutting \the [src]..."))
				if (weapon.use_tool(src, user, 50, volume = 50))
					to_chat(user, span_notice("You cut \the [src] down."))
					deconstruct(TRUE)
			return TRUE
	return ..()

/obj/structure/low_wall/deconstruct(disassembled = TRUE, wrench_disassembly = 0)
	var/datum/material/plating_mat_ref = GET_MATERIAL_REF(plating_material)
	new plating_mat_ref.sheet_type(loc, 2)
	qdel(src)

/obj/structure/low_wall/proc/set_wall_paint(new_paint)
	wall_paint = new_paint
	if(wall_paint)
		color = wall_paint
	else
		var/datum/material/plating_mat_ref = GET_MATERIAL_REF(plating_material)
		color = plating_mat_ref.wall_color
	update_appearance()

/obj/structure/low_wall/proc/set_stripe_paint(new_paint)
	stripe_paint = new_paint
	update_appearance()

/obj/structure/low_wall/proc/set_material(new_material_type)
	plating_material = new_material_type
	if(!wall_paint)
		var/datum/material/plating_mat_ref = GET_MATERIAL_REF(plating_material)
		color = plating_mat_ref.wall_color

/// Whether the top of the low wall is obstructed by an installed grille or a window
/obj/structure/low_wall/proc/is_top_obstructed()
	var/obj/structure/window/window = locate() in loc
	if(window && window.anchored)
		return TRUE
	var/obj/structure/grille/grille = locate() in loc
	if(grille && grille.anchored)
		return TRUE
	return FALSE

/obj/structure/low_wall/titanium
	plating_material = /datum/material/titanium

/obj/structure/low_wall/plastitanium
	plating_material = /datum/material/alloy/plastitanium

/obj/structure/low_wall/wood
	plating_material = /datum/material/wood
