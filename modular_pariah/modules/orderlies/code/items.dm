// Code taken selectively from Skyrat's goofsec departmental batons
/obj/item/melee/baton/security/loaded/orderly
	name = "medical stun baton"
	desc = "A stun baton that doesn't operate outside of the Medical department, based off the station's blueprint layout. Can be used outside of Medical up to three times before needing to return!"
	icon_state = "medical_baton"
	icon = 'modular_pariah/modules/orderlies/icons/baton.dmi'
	var/list/valid_areas = list(/area/medical, /area/maintenance/department/medical, /area/shuttle/escape)
	var/emagged = FALSE
	var/non_departmental_uses_left = 4

/obj/item/melee/baton/security/loaded/orderly/baton_attack(mob/living/target, mob/living/user, modifiers)
	if(!active || emagged || cooldown_check > world.time || is_type_in_list(get_area(user), valid_areas))
		return ..()

	if(non_departmental_uses_left)
		non_departmental_uses_left--
		if(non_departmental_uses_left)
			say("[non_departmental_uses_left] non-departmental uses left!")
		else
			say("[src] is out of non-departmental uses! Return to your department and reactivate the baton to refresh it!")
	else
		target.visible_message(span_warning("[user] prods [target] with [src]. Luckily, it shut off due to being in the wrong area."), \
			span_warning("[user] prods you with [src]. Luckily, it shut off due to being in the wrong area."))
		active = FALSE
		balloon_alert(user, "wrong department")
		playsound(src, SFX_SPARKS, 75, TRUE, -1)
		update_appearance()
		return BATON_ATTACK_DONE

/obj/item/melee/baton/security/loaded/orderly/attack_self(mob/user)
	. = ..()
	if(active) // just turned on
		var/area/current_area = get_area(user)
		if(!is_type_in_list(current_area, valid_areas))
			return
		if(non_departmental_uses_left < 4)
			say("Non-departmental uses refreshed!")
			non_departmental_uses_left = 4

/obj/item/melee/baton/security/loaded/orderly/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(emagged)
		return
	if(user)
		user.visible_message(span_warning("Sparks fly from [src]!"),
			span_warning("You scramble [src]'s departmental lock, allowing it to be used freely!"),
			span_hear("You hear a faint electrical spark."))
	balloon_alert(user, "emagged")
	playsound(src, SFX_SPARKS, 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	emagged = TRUE
