/obj/screen/craft
	name = "crafting menu"
	icon = 'fallout/icons/UI/screen_fallout2.dmi'
	icon_state = "craft"
	screen_loc = ui_crafting

/obj/screen/inventory/hand
	var/mutable_appearance/handcuff_overlay
	var/static/mutable_appearance/blocked_overlay = mutable_appearance('icons/mob/screen_gen.dmi', "blocked")
	var/held_index = 0

/obj/screen/inventory/hand/update_overlays()
	. = ..()

	if(!handcuff_overlay)
		var/state = (!(held_index % 2)) ? "markus" : "gabrielle"
		handcuff_overlay = mutable_appearance('icons/mob/screen_gen.dmi', state)

	if(!hud?.mymob)
		return

	if(iscarbon(hud.mymob))
		var/mob/living/carbon/C = hud.mymob
		if(C.handcuffed)
			. += handcuff_overlay

		if(held_index)
			if(!C.has_hand_for_held_index(held_index))
				. += blocked_overlay

	if(held_index == hud.mymob.active_hand_index)
		. += "hand_active"


/obj/screen/inventory/hand/Click(location, control, params)
	if(hud?.mymob && (hud.mymob != usr))
		return
	var/mob/user = hud.mymob
	// just redirect clicks

	if(user.active_hand_index == held_index)
		var/obj/item/I = user.get_active_held_item()
		if(I)
			I.Click(location, control, params)
	else
		var/obj/item/I = user.get_inactive_held_item()
		if(I)
			I.Click(location, control, params)
		else
			user.swap_hand(held_index)
	return TRUE

/obj/screen/mood
	name = "mood"
	icon_state = "mood5"
	screen_loc = ui_mood