https://github.com/pariahstation/Pariah-Station/pull/491

## Title: Department guard outfits

MODULE ID: DEP_GUARD_OUTFITS

### Description:

Steals the Departmental Guard outfits from https://github.com/Skyrat-SS13/Skyrat-tg/pull/8524 and adds them to the lockers inside each department's security post.
Also changes `update_inv_w_uniform()` so that it checks for the `worn_icon_digitigrade` variable on uniforms.

### TG Proc/File Changes:

- code\game\objects\structures\crates_lockers\closets\secure\security.dm >
	/obj/structure/closet/secure_closet/security/cargo
	/obj/structure/closet/secure_closet/security/engine
	/obj/structure/closet/secure_closet/security/science
	/obj/structure/closet/secure_closet/security/med
	\> Changed the name, icon state, and contents of the department guard lockers.

- code\modules\mob\living\carbon\human\human_update_icons.dm > /mob/living/carbon/human/update_inv_w_uniform() > Added support for the `worn_icon_digitigrade` variable on uniforms.

### Defines:

- N/A

### Master file additions

- N/A

### Included files that are not contained in this module:

- N/A

### Credits:

SabreML (Pariah PR), Iamgoofball (Sprites, Skyrat PR)
