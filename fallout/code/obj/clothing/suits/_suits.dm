/obj/item/clothing/suit
	icon = 'fallout/icons/obj/clothing/suits.dmi'
	name = "suit"
	block_priority = BLOCK_PRIORITY_WEAR_SUIT
	slot_flags = ITEM_SLOT_OCLOTHING
	body_parts_covered = CHEST|GROIN|LEGS|ARMS //I don't care if some armors only visibly covers the chest, they're going to offer protection to limbs too because game design.
	var/togglename = null
	var/suittoggled = FALSE
	var/armor_tier_desc = ARMOR_CLOTHING_DESC
	armor = ARMOR_VALUE_CLOTHES
	limb_integrity = 0 // disabled for most exo-suits
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/armor
	var/obj/item/clothing/armoraccessory/attached_accessory
	var/mutable_appearance/accessory_overlay
	var/dummy_thick = FALSE // is able to hold accessories on its item
	var/deflection_chance = null //Chance for the armor to redirect a blocked projectile
	var/armor_block_chance = null //Chance for the armor to block a low penetration projectile
	var/list/protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

/obj/item/clothing/suit/update_clothes_damaged_state()
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()

//Suit/armor accessories

/obj/item/clothing/suit/attackby(obj/item/I, mob/user, params)
	if(!attach_accessory(I, user))
		return ..()

/obj/item/clothing/suit/equipped(mob/user, slot)
	..()

	if(attached_accessory && slot != HANDS && ishuman(user))
		var/mob/living/carbon/human/H = user
		attached_accessory.on_suit_equip(src, user)
		if(attached_accessory.above_suit)
			H.update_inv_wear_suit()

/obj/item/clothing/suit/dropped(mob/user)
	if(attached_accessory)
		attached_accessory.on_suit_dropped(src, user)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(attached_accessory.above_suit)
				H.update_inv_wear_suit()

	..()

/obj/item/clothing/suit/proc/attach_accessory(obj/item/I, mob/user, notifyAttach = 1)
	. = FALSE
	if(istype(I, /obj/item/clothing/armoraccessory))
		var/obj/item/clothing/armoraccessory/A = I
		if(attached_accessory)
			if(user)
				to_chat(user, span_warning("[src] already has an accessory."))
			return
		if(dummy_thick)
			if(user)
				to_chat(user, span_warning("[src] is too bulky and cannot have accessories attached to it!"))
			return

		else
			if(user && !user.temporarilyRemoveItemFromInventory(I))
				return
			if(!A.attach(src, user))
				return

			if(user && notifyAttach)
				to_chat(user, span_notice("You attach [I] to [src]."))

			if((flags_inv) || (A.flags_inv))
				return TRUE

			accessory_overlay = mutable_appearance('icons/mob/clothing/accessories.dmi', attached_accessory.icon_state)
			accessory_overlay.alpha = attached_accessory.alpha
			accessory_overlay.color = attached_accessory.color

			if(ishuman(loc))
				var/mob/living/carbon/human/H = loc
				H.update_inv_w_uniform()
				H.update_inv_wear_suit()

			return TRUE

/obj/item/clothing/suit/proc/remove_accessory(mob/user)
	if(!isliving(user))
		return
	if(!can_use(user))
		return

	if(attached_accessory)
		var/obj/item/clothing/armoraccessory/A = attached_accessory
		attached_accessory.detach(src, user)
		if(user.put_in_hands(A))
			to_chat(user, span_notice("You detach [A] from [src]."))
		else
			to_chat(user, span_notice("You detach [A] from [src] and it falls on the floor."))

		if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			H.update_inv_w_uniform()
			H.update_inv_wear_suit()

/obj/item/clothing/suit/examine(mob/user)
	. = ..()
	if(attached_accessory)
		. += "\A [attached_accessory] is attached to it."


/obj/item/clothing/suit/AltClick(mob/user)
	. = ..()
	if(attached_accessory)
		remove_accessory(user)
