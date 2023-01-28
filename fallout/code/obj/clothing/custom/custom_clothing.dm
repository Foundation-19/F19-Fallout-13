// In this document: Custom clothing for patreons and others as of august 2021 on Fortune 13. Items must be labeled with the name of the person they
// are intended for and have the correct icon path included.


// WHISKEY //

/obj/item/clothing/suit/armor/medium/combat/desert_ranger/whiskey
	name = "weathered ranger combat armor"
	desc = "An original suit of pre-war combat armor used by elite military units, passed down through generations to where it is today. Though it's not lined with kevlar, this suit's still lightweight and easy to move around in."
	icon = 'fallout/icons/clothing/custom/custom.dmi'
	worn_icon = 'fallout/icons/onmob/clothes/custom/custom.dmi'
	icon_state = "desert_ranger"
	inhand_icon_state = "desert_ranger"

/* /obj/item/clothing/suit/armor/medium/combat/desert_ranger/whiskey/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)
 */
/* New system version replace when switch
/obj/item/clothing/suit/armor/light/whiskey_desert
	name = "weathered ranger combat armor"
	desc = "A original suit of pre-war combat armor used by elite military units, passed down through generations to where it is today. Though it's not lined with kevlar, this suit's still lightweight and easy to move around in."
	icon_state = "desert_ranger"
	inhand_icon_state = "desert_ranger"
	armor = lis t("melee" = 20, "bullet" = 30, "laser" = 10, "energy" = 20, "bomb" = 30, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
*/

// YEEHAWGYVNAH/"Trinity Kemble" //
/obj/item/clothing/suit/armor/trailranger/kemble
	name = "riot vest"
	desc = "An armored chestplate ripped out of old riot gear."
	icon_state = "kemble"
	inhand_icon_state = "kemble"
	armor = ARMOR_VALUE_MEDIUM
	slowdown = ARMOR_SLOWDOWN_MEDIUM * ARMOR_SLOWDOWN_LESS_T1 * ARMOR_SLOWDOWN_GLOBAL_MULT
	armor_tokens = list(ARMOR_MODIFIER_UP_BULLET_T1, ARMOR_MODIFIER_UP_LASER_T1, ARMOR_MODIFIER_UP_ENV_T1, ARMOR_MODIFIER_UP_DT_T2)

/obj/item/clothing/head/f13/trailranger/kemble
	name = "ranger's slouch hat"
	desc = "A comfortable slouch hat, reinforced with ballistic fibres. Although it has the remnants of a pair of night vision goggles still strapped to it, they're non-functional..."
	icon_state = "kemble"
	inhand_icon_state = "kemble"
	actions_types = list(/datum/action/item_action/toggle)
	armor = ARMOR_VALUE_MEDIUM
	armor_tokens = list(ARMOR_MODIFIER_UP_BULLET_T1, ARMOR_MODIFIER_UP_LASER_T1, ARMOR_MODIFIER_UP_ENV_T1, ARMOR_MODIFIER_UP_DT_T2)

/obj/item/clothing/head/f13/trailranger/kemble/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "kembleup"
	inhand_icon_state = "kembleup"

/obj/item/storage/belt/holster/kemble
	name = "ranger overcoat"
	desc = "An insulated coat taken from a set of riot gear. This one is apparently reversible (alt-click to toggle colours)."
	icon_state = "kemblecoat_green"
	inhand_icon_state = "kemblecoat_green"
	alternate_worn_layer = HAIR_LAYER-1

/obj/item/storage/belt/holster/kemble/AltClick(mob/user)
	..()
	if(icon_state == "kemblecoat_green")
		icon_state = "kemblecoat_tan"
		inhand_icon_state = "kemblecoat_tan"
		to_chat(user, "You reverse the coat to show the tan side.")
	else
		icon_state = "kemblecoat_green"
		inhand_icon_state = "kemblecoat_green"
		to_chat(user, "You reverse the coat to show the green side.")
