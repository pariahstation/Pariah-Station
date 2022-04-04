////////////////
//Tail Wagging//
////////////////

/datum/species/proc/can_wag_tail(mob/living/carbon/human/H)
	if(!H) //Somewhere in the core code we're getting those procs with H being null
		return FALSE
	var/obj/item/organ/tail/T = H.getorganslot(ORGAN_SLOT_TAIL)
	if(!T)
		return FALSE
	if(T.can_wag)
		return TRUE
	return FALSE

/datum/species/proc/is_wagging_tail(mob/living/carbon/human/H)
	if(!H) //Somewhere in the core code we're getting those procs with H being null
		return FALSE
	var/obj/item/organ/tail/T = H.getorganslot(ORGAN_SLOT_TAIL)
	if(!T)
		return FALSE
	return T.wagging

/datum/species/proc/start_wagging_tail(mob/living/carbon/human/H)
	if(!H) //Somewhere in the core code we're getting those procs with H being null
		return
	var/obj/item/organ/tail/T = H.getorganslot(ORGAN_SLOT_TAIL)
	if(!T)
		return FALSE
	T.wagging = TRUE
	H.update_body()

/datum/species/proc/stop_wagging_tail(mob/living/carbon/human/H)
	if(!H) //Somewhere in the core code we're getting those procs with H being null
		return
	var/obj/item/organ/tail/T = H.getorganslot(ORGAN_SLOT_TAIL)
	if(!T)
		return
	T.wagging = FALSE
	H.update_body()

/datum/species/proc/on_tail_lost(mob/living/carbon/human/tail_owner, obj/item/organ/tail/lost_tail, on_species_init = FALSE)
	SEND_SIGNAL(tail_owner, COMSIG_CLEAR_MOOD_EVENT, "right_tail_regained")
	SEND_SIGNAL(tail_owner, COMSIG_CLEAR_MOOD_EVENT, "wrong_tail_regained")
	stop_wagging_tail(tail_owner)

	// If it's initializing the species, don't add moodlets
	if(on_species_init)
		return
	// If we don't have a set tail, don't bother adding moodlets
	if(!mutant_organs.len)
		return

	SEND_SIGNAL(tail_owner, COMSIG_ADD_MOOD_EVENT, "tail_lost", /datum/mood_event/tail_lost)
	SEND_SIGNAL(tail_owner, COMSIG_ADD_MOOD_EVENT, "tail_balance_lost", /datum/mood_event/tail_balance_lost)

/*
 * This proc is called when a mob gains a tail.
 *
 * tail_owner - the owner of the tail (who holds our species datum)
 * lost_tail - the tail that was added
 * on_species_init - whether or not this was called when the species was initialized, or if it was called due to an ingame means (like surgery)
 */
/datum/species/proc/on_tail_regain(mob/living/carbon/human/tail_owner, obj/item/organ/tail/found_tail, on_species_init = FALSE)
	SEND_SIGNAL(tail_owner, COMSIG_CLEAR_MOOD_EVENT, "tail_lost")
	SEND_SIGNAL(tail_owner, COMSIG_CLEAR_MOOD_EVENT, "tail_balance_lost")

	// If it's initializing the species, don't add moodlets
	if(on_species_init)
		return
	// If we don't have a set tail, don't add moodlets
	if(!mutant_organs.len)
		return

	if(found_tail.type in mutant_organs)
		SEND_SIGNAL(tail_owner, COMSIG_ADD_MOOD_EVENT, "right_tail_regained", /datum/mood_event/tail_regained_right)
	else
		SEND_SIGNAL(tail_owner, COMSIG_ADD_MOOD_EVENT, "wrong_tail_regained", /datum/mood_event/tail_regained_wrong)

/datum/species/proc/clear_tail_moodlets(mob/living/carbon/human/former_tail_owner)
	SEND_SIGNAL(former_tail_owner, COMSIG_CLEAR_MOOD_EVENT, "tail_lost")
	SEND_SIGNAL(former_tail_owner, COMSIG_CLEAR_MOOD_EVENT, "tail_balance_lost")
	SEND_SIGNAL(former_tail_owner, COMSIG_CLEAR_MOOD_EVENT, "right_tail_regained")
	SEND_SIGNAL(former_tail_owner, COMSIG_CLEAR_MOOD_EVENT, "wrong_tail_regained")
	stop_wagging_tail(former_tail_owner)
