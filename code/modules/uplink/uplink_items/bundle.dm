//All bundles and telecrystals
/datum/uplink_category/bundle
	name = "Bundles"
	weight = 10

/datum/uplink_item/bundles_tc
	category = /datum/uplink_category/bundle
	surplus = 0
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/random
	name = "Random Item"
	desc = "Picking this will purchase a random item. Useful if you have some TC to spare or if you haven't decided on a strategy yet."
	item = /obj/effect/gibspawner/generic // non-tangible item because techwebs use this path to determine illegal tech
	cost = 0
	cost_override_string = "Varies"

/datum/uplink_item/bundles_tc/random/purchase(mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/list/possible_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/uplink_item = SStraitor.uplink_items_by_type[item_path]
		if(src == uplink_item || !uplink_item.item)
			continue
		if(!handler.can_purchase_item(user, uplink_item))
			continue
		possible_items += uplink_item

	if(possible_items.len)
		var/datum/uplink_item/uplink_item = pick(possible_items)
		log_uplink("[key_name(user)] purchased a random uplink item from [handler.owner]'s uplink with [handler.telecrystals] telecrystals remaining")
		SSblackbox.record_feedback("tally", "traitor_random_uplink_items_gotten", 1, initial(uplink_item.name))
		handler.purchase_item(user, uplink_item)

/datum/uplink_item/bundles_tc/telecrystal
	name = "1 Raw Telecrystal"
	desc = "A telecrystal in its rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal
	cost = 1
	// Don't add telecrystals to the purchase_log since
	// it's just used to buy more items (including itself!)
	purchase_log_vis = FALSE

/datum/uplink_item/bundles_tc/telecrystal/five
	name = "5 Raw Telecrystals"
	desc = "Five telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/five
	cost = 5

/datum/uplink_item/bundles_tc/telecrystal/twenty
	name = "20 Raw Telecrystals"
	desc = "Twenty telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/twenty
	cost = 20

/datum/uplink_item/bundles_tc/contractor
	name = "Contractor Bundle"
	desc = "A box containing everything you need to take contracts from the Syndicate. Kidnap people and drop them off at specified locations for rewards in the form of Telecrystals (Usable in the provided uplink) and Contractor Points."
	item = /obj/item/storage/box/syndicate/contract_kit
	progression_minimum = 90 MINUTES
	cost = 20
	
/datum/uplink_item/bundles_tc/progression
	name = "Challenge Mode"
	desc = "An alternative challenge for traitors who are interested in serving their employers. When purchased, \
	        your uplink will gain access to a large variety of objectives that reward telecrystals on completion, \
			and become more difficult to complete as the shift progreses. However, your telecrystals will be reset \
			to zero and several uplink items will be locked behind their reputation level. Your current objectives will also be replaced."
	item = /obj/effect/gibspawner/generic
	limited_stock = 1
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	surplus = 0
	restricted = TRUE
	cost = 20
	
/datum/uplink_item/bundles_tc/progression/purchase(mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/datum/antagonist/traitor/traitor = user.mind.has_antag_datum(/datum/antagonist/traitor)
	var/datum/component/uplink/hidden_uplink = user.mind.find_syndicate_uplink()
	if(!hidden_uplink)
		return FALSE
	handler.has_progression = TRUE
	handler.can_take_objectives = TRUE
	handler.has_objectives = TRUE
	handler.generate_objectives()
	SStgui.close_uis(hidden_uplink)
	if(traitor)
		traitor.forge_progression_objectives()
		traitor.owner.announce_objectives()
	return TRUE