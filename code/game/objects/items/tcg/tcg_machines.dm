#define STAT_Y -23
#define POWER_X -14
#define RESOLVE_X 12
#define DEFAULT_POWER_COLOR "#af2323"
#define DEFAULT_RESOLVE_COLOR "#3492d0"

/obj/machinery/trading_card_holder
	name = "card slot"
	desc = "a slot for placing Tactical Game Cards."
	icon = 'icons/obj/toys/tcgmisc.dmi'
	icon_state = "card_holder_inactive"
	use_power = NO_POWER_USE

	///Card thats currently inside the holder
	var/obj/item/tcgcard/current_card
	///Holds all the details such as stats for the card.
	var/datum/card/card_template
	///Reference to holographic currently active holographic summon
	var/obj/structure/trading_card_summon/current_summon

	var/summon_offset_x = 0
	var/summon_offset_y = 1
	var/summon_type = /obj/structure/trading_card_summon

/obj/machinery/trading_card_holder/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/tcgcard) && current_card == null)
		current_card = I
		card_template = current_card.extract_datum()
		if(card_template.cardtype == "Creature")
			if(!user.transferItemToLoc(current_card, src))
				return
			to_chat(user, span_notice("You put the [current_card] card in [src]."))
			icon_state = "card_holder_active"
			update_appearance()
			current_summon = new summon_type(locate(x + summon_offset_x, y + summon_offset_y, z))
			current_summon.template = card_template
			current_summon.load_model(current_card)
		else
			to_chat(user, span_notice("The [src] smartly rejects the non-creature card."))
			current_card = null
			return..()
	else
		return..()

GLOBAL_LIST_EMPTY(tcgcard_machine_radial_choices)

/obj/machinery/trading_card_holder/attack_hand(mob/user)
	if(current_card)
		var/list/choices = GLOB.tcgcard_machine_radial_choices
		if(!length(choices))
			choices = GLOB.tcgcard_machine_radial_choices = list(
			"Pickup" = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_pickup"),
			"Tap" = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_tap"),
			"Modify" = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_modify"),
			)
		var/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE, tooltips = TRUE)
		if(!check_menu(user))
			return
		switch(choice)
			if("Tap")
				current_summon.update_tapped(current_card)
			if("Pickup")
				user.put_in_hands(current_card)
				to_chat(user, span_notice("You take the [current_card] card out of [src]."))
				current_card = null
				card_template = null
				icon_state = "card_holder_inactive"
				update_appearance()
				if(current_summon)
					qdel(current_summon)
			if("Modify")
				current_summon.modify_stats(user)
			if(null)
				return
	else
		to_chat(user, span_warning("[src] is empty!"))
	add_fingerprint(user)
	return..()

/obj/machinery/trading_card_holder/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/machinery/trading_card_holder/Destroy()
	if(current_summon)
		qdel(current_summon)
	. = ..()
	
/obj/machinery/trading_card_holder/examine(mob/user)
	. = ..()
	if(card_template)
		. += span_notice("There is currently a [card_template.name] card inserted.")
	else
		. += span_notice("There is no card currently inserted.")

/obj/machinery/trading_card_holder/red
	summon_offset_y = -1
	summon_type = /obj/structure/trading_card_summon/red

/obj/structure/trading_card_summon
	name = "coder"
	icon = 'icons/obj/toys/tcgsummons.dmi'
	icon_state = "hologram"
	anchored = TRUE

	///Holds all the default details of the card.
	var/datum/card/template

	///Power statistics for the hologram, stored seperately to the template as they can be modified.
	var/summon_power
	///Resolve statistics for the hologram, stored seperately to the template as they can be modified.
	var/summon_resolve
	///Is the card tapped (rotated) or not.
	var/tapped = FALSE

	///Reference to the hologram object itself.
	var/obj/effect/overlay/card_summon/hologram
	///Reference to the text overlay for power.
	var/obj/effect/overlay/status_display_text/power_overlay
	///Reference to the text overlay for resolve.
	var/obj/effect/overlay/status_display_text/resolve_overlay
	///Color of the power stat.
	var/power_color = DEFAULT_POWER_COLOR
	///Color of the resolve stat.
	var/resolve_color = DEFAULT_RESOLVE_COLOR
	///Color that stats become if they've been changed from their default.
	var/modified_color = "#1db327"
	///Color of the holograms produced.
	var/team_color = "#77abff"

/obj/structure/trading_card_summon/proc/load_model(obj/item/tcgcard/current_card)

	hologram = new(loc)

	hologram.icon = file(template.summon_icon_file)
	hologram.icon_state = template.summon_icon_state
	hologram.name = name
	hologram.alpha = 170
	hologram.add_atom_colour(team_color, FIXED_COLOUR_PRIORITY)
	name = template.name
	desc = template.desc
	summon_power = template.power
	summon_resolve = template.resolve
	update_overlays()


/obj/structure/trading_card_summon/get_name_chaser(mob/user, list/name_chaser = list())

	name_chaser += "Faction: [template.faction]"
	name_chaser += "Cost: [template.summoncost]"
	name_chaser += "Type: [template.cardtype] - [template.cardsubtype]"
	name_chaser += "Power/Resolve: [summon_power]/[summon_resolve]"
	if(template.rules) //This can sometimes be empty
		name_chaser += "Ruleset: [template.rules]"
	return name_chaser

/obj/structure/trading_card_summon/update_overlays()
	. = ..()

	var/overlay = update_stats(power_overlay, STAT_Y, summon_power, power_color, x_offset = POWER_X)

	if(overlay)
		power_overlay = overlay
	overlay = update_stats(resolve_overlay, STAT_Y, summon_resolve, resolve_color, x_offset = RESOLVE_X)
	if(overlay)
		resolve_overlay = overlay

/obj/structure/trading_card_summon/proc/update_stats(obj/effect/overlay/status_display_text/overlay, pos_y, stats, text_color, x_offset)
	if(overlay && stats == overlay.message)
		return null

	if(overlay)
		qdel(overlay)

	var/obj/effect/overlay/status_display_text/stats_display = new(src, pos_y, stats, text_color, text_color, x_offset)

	stats_display.pixel_y = -32
	stats_display.pixel_z = 32
	vis_contents += stats_display
	return stats_display

/obj/structure/trading_card_summon/proc/update_tapped(obj/item/tcgcard/current_card)
	if(tapped)
		hologram.transform = turn(hologram.transform, 90)
	else
		hologram.transform = turn(hologram.transform, -90)
	tapped = !tapped

/obj/structure/trading_card_summon/proc/modify_stats(mob/living/user)
	summon_power = num2text(tgui_input_number(user, "Please input power value", "Stat Modification", text2num(template.power), 25))
	if(summon_power == template.power)
		power_color = DEFAULT_POWER_COLOR
	else
		power_color = modified_color
	summon_resolve = num2text(tgui_input_number(user, "Please input resolve value", "Stat Modification", text2num(template.resolve), 25))
	if(summon_resolve == template.resolve)
		resolve_color = DEFAULT_RESOLVE_COLOR
	else
		resolve_color = modified_color
	update_overlays()

/obj/structure/trading_card_summon/Destroy()
	if(hologram)
		qdel(hologram)
	return ..()

/obj/structure/trading_card_summon/red
	team_color = "#ff7777"

#undef STAT_Y
#undef POWER_X
#undef RESOLVE_X
#undef DEFAULT_POWER_COLOR
#undef DEFAULT_RESOLVE_COLOR

/obj/effect/overlay/card_summon
	mouse_opacity = 0
