//DO NOT CHANGE THOSE LISTS UNLESS YOU KNOW WHAT YOURE DOING (will mess savefiles)

/*GLOBAL_LIST_INIT(bitflag_to_marking_zones, list(HEAD = "Head",
											CHEST = "Chest",
											LEG_LEFT = "Left Leg",
											LEG_RIGHT = "Right Leg",
											ARM_LEFT = "Left Arm",
											ARM_RIGHT = "Right Arm",
											HAND_LEFT = "Left Hand",
											HAND_RIGHT = "Right Hand"
											))*/

GLOBAL_LIST_INIT(marking_zone_to_bitflag, list(BODY_ZONE_HEAD = HEAD,
										BODY_ZONE_CHEST = CHEST,
										BODY_ZONE_L_LEG = LEG_LEFT,
										BODY_ZONE_R_LEG = LEG_RIGHT,
										BODY_ZONE_L_ARM = ARM_LEFT,
										BODY_ZONE_R_ARM = ARM_RIGHT,
										BODY_ZONE_PRECISE_L_HAND = HAND_LEFT,
										BODY_ZONE_PRECISE_R_HAND = HAND_RIGHT
										))

//GLOBAL_LIST_INIT(marking_zones, list("Head","Chest","Left Leg","Right Leg","Left Arm","Right Arm","Left Hand","Right Hand"))

GLOBAL_LIST_INIT(marking_zones, list(BODY_ZONE_HEAD,BODY_ZONE_CHEST,BODY_ZONE_L_LEG,BODY_ZONE_R_LEG,BODY_ZONE_L_ARM,BODY_ZONE_R_ARM,BODY_ZONE_PRECISE_L_HAND,BODY_ZONE_PRECISE_R_HAND))



