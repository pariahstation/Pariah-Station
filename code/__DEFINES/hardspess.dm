///Contains all defines regarding to the HARDSPESS project by Gonenoculer5. Refer to the Hardspess module under /modules/hardspess for more information.
///Be warned that touching these numbers can and WILL lead to funkyness, and adjusting them without a good concept as to what they do can cause bad juju.
///You've been warned.

///Can't be used to salvage something. Intended for anything that isn't a tool but falls under /obj/item/.
#define SALVAGE_POWER_NONE 0

///Gives barely any salvage when used for salvaging structures. Intended for T1 tools on-station.
#define SALVAGE_POWER_AWFUL 1

///Gives a small amount of salvage when used for salvaging structures. Intended for T2 tools on-station, and borg tools.
#define SALVAGE_POWER_LOW 2

///Gives up to tier 3 salvage. Intended for T1 salvage kit tools and abductor tools.
#define SALVAGE_POWER_MEDIUM 3

///Gives up to tier 4 salvage. Intended for T2 salvage kit tools.
#define SALVAGE_POWER_HIGH 4

///Gives up to tier 5 salvage. Intended for T3 salvage kit tools.
#define SALVAGE_POWER_MAX 5

///SALVAGE STEPS
#define UNHARVESTED 0 //base state
#define CUT 1 //prep to salvage
#define HARVEST1 2 //first harvest
#define HARVEST2 3 //second harvest
#define HARVEST3 4 //third harvest
#define EMPTY 5 //empty, no more salvage
