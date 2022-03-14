/datum/id_trim/syndicom/pariah
	trim_icon = 'modular_pariah/master_files/icons/obj/card.dmi'

/datum/id_trim/syndicom/pariah/crew
	assignment = "Syndicate Operative"
	trim_state = "trim_syndicateoperative"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/pariah/captain
	assignment = "Syndicate Ship Captain"
	trim_state = "trim_syndicateshipcaptain"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS)

///DS-2

/datum/id_trim/syndicom/pariah/assault
	assignment = "DS-2 Operative"
	trim_state = "trim_syndicateoperative"

/datum/id_trim/syndicom/pariah/assault/assistant
	assignment = "Operative"
	trim_state = "trim_syndicateassistant"

/datum/id_trim/syndicom/pariah/assault/syndicatestaff
	assignment = "Syndicate Staff"
	trim_state = "trim_syndicatestaff"

/datum/id_trim/syndicom/pariah/assault/researcher
	assignment = "Researcher"
	trim_state = "trim_researcher"

/datum/id_trim/syndicom/pariah/assault/stationmedicalofficer
	assignment = "Station Medical Officer"
	trim_state = "trim_stationmedicalofficer"

/datum/id_trim/syndicom/pariah/assault/masteratarms
	assignment = "Master At Arms"
	trim_state = "trim_masteratarms"
	access = list(ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

/datum/id_trim/syndicom/pariah/assault/brigofficer
	assignment = "Brig Officer"
	trim_state = "trim_brigofficer"
	access = list(ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

/datum/id_trim/syndicom/pariah/assault/chiefmasteratarms
	assignment = "Chief Master At Arms"
	trim_state = "trim_chiefmasteratarms"
	access = list(ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

/datum/id_trim/syndicom/pariah/assault/chiefresearchofficer
	assignment = "Chief Research Officer"
	trim_state = "trim_chiefresearchofficer"
	access = list(ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

/datum/id_trim/syndicom/pariah/assault/chiefengineeringofficer
	assignment = "Chief Engineering Officer"
	trim_state = "trim_chiefengineeringofficer"
	access = list(ACCESS_ENGINE_EQUIP,ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

/datum/id_trim/syndicom/pariah/assault/stationadmiral
	assignment = "Station Admiral"
	trim_state = "trim_stationadmiral"
	access = list(ACCESS_ENGINE_EQUIP,ACCESS_SYNDICATE,ACCESS_ROBOTICS,ACCESS_SYNDICATE_LEADER)

///Interdyne

/datum/id_trim/syndicom/pariah/interdyne
	assignment = "Interdyne Operative"
	trim_state = "trim_syndicateoperative"

/datum/id_trim/syndicom/pariah/interdyne/commsofficer
	assignment = "Comms Officer"
	trim_state = "trim_commsofficer"

/datum/id_trim/syndicom/pariah/interdyne/deckofficer
	assignment = "Deck Officer"
	trim_state = "trim_deckofficer"

///Misc

/datum/id_trim/syndicom/pariah/misc
	assignment = "Nuclear Tech Support" //Hello? Yes? Nanotrasen? This is Gorlex, uhh. There seems to be an issue.. is your self-destruct running?

/datum/id_trim/syndicom/pariah/misc/corporateliasion //Syndicate HoP
	assignment = "Corporate Liaison"
	trim_state = "trim_corporateliaison"

/datum/id_trim/syndicom/pariah/misc/investigativeofficer
	assignment = "Investigative Officer"
	trim_state = "trim_investigativeofficer"

/datum/id_trim/syndicom/pariah/misc/corporatelawyer
	assignment = "Corporate Lawyer"
	trim_state = "trim_corporatelawyer"

/datum/id_trim/syndicom/pariah/misc/geneticsresearcher
	assignment = "Genetics Researcher"
	trim_state = "trim_geneticsresearcher"

/datum/id_trim/syndicom/pariah/misc/chef
	assignment = "Chef"
	trim_state = "trim_chef"

/datum/id_trim/syndicom/pariah/misc/counsel
	assignment = "Counsel"
	trim_state = "trim_counsel"

/datum/id_trim/syndicom/pariah/misc/sanitationtechnician
	assignment = "Sanitation Technician"
	trim_state = "trim_sanitationtechnician"

/datum/id_trim/syndicom/pariah/misc/deckcrewman //Finally, an excuse to emag the supply console.
	assignment = "Deck Crewman"
	trim_state = "trim_deckcrewman"

///No Custom Icon
/datum/id_trim/syndicom/pariahnoicon/roboticstechnician
	assignment = "Robotics Technician"
	trim_state = "trim_roboticist"

/datum/id_trim/syndicom/pariahnoicon/enginetechnician
	assignment = "Engine Technician"
	trim_state = "trim_stationengineer"
