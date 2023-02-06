/obj/item/gun
	name = "gun"
	desc = "It's a gun. It's pretty terrible, though."
	icon_state = "detective"
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	custom_materials = list(/datum/material/iron=2000)
	w_class = WEIGHT_CLASS_NORMAL
	var/icon_prefix = null
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	force = 5
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	var/fire_sound = "gunshot"
	/// Time it takes between drawing the gun and shooting the gun
	var/draw_time = GUN_DRAW_NORMAL

	var/clumsy_check = TRUE
	var/obj/item/ammo_casing/chambered = null
	trigger_guard = TRIGGER_GUARD_NORMAL	//trigger guard on the weapon, hulks can't fire them with their big meaty fingers

	slowdown = GUN_SLOWDOWN_NONE

	var/damage_multiplier = 1 //Multiplies damage of projectiles fired from this gun
	var/penetration_multiplier = 1 //Multiplies armor penetration of projectiles fired from this gun

	/// can we be put into a turret
	var/can_turret = TRUE
	/// can we be put in a circuit
	var/can_circuit = TRUE
	/// can we be put in an emitter
	var/can_emitter = TRUE
	//delay after shooting before the gun can be used again
	var/burst_shot_delay = GUN_BURSTFIRE_DELAY_BASE
	/// Last world.time this was fired
	var/last_fire = 0
	/// Currently firing, whether or not it's a burst or not.
	var/firing = FALSE
	/// Used in gun-in-mouth execution/suicide and similar, while TRUE nothing should work on this like firing or modification and so on and so forth.
	var/busy_action = FALSE
	/// used for inaccuracy and wielding requirements/penalties
	/// Adds this speed to the bullet, in pixels per second
	var/extra_speed = 0

	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'

	var/obj/item/firing_pin/pin = /obj/item/firing_pin //standard firing pin for most guns
	var/no_pin_required = FALSE //whether the gun can be fired without a pin

	var/can_flashlight = FALSE //if a flashlight can be added or removed if it already has one.
	var/obj/item/flashlight/seclite/gun_light
	var/datum/action/item_action/toggle_gunlight/alight
	var/gunlight_state = "flight"
	var/mutable_appearance/knife_overlay
	var/bayonet_state = "bayonetstraight"

	var/can_scope = FALSE
	var/mutable_appearance/scope_overlay
	var/scope_state = "scope"

	var/mutable_appearance/flashlight_overlay
	var/mutable_appearance/suppressor_overlay
	var/suppressor_state = null
	var/flight_x_offset = 0
	var/flight_y_offset = 0
	var/scope_x_offset = 0
	var/scope_y_offset = 0
	var/suppressor_x_offset = 0
	var/suppressor_y_offset = 0

	var/equipsound = 'fallout/sound/f13weapons/equipsounds/pistolequip.ogg'

	//Zooming
	var/zoomable = FALSE //whether the gun generates a Zoom action on creation
	var/zoomed = FALSE //Zoom toggle
	var/zoom_amt = 3 //Distance in TURFs to move the user's screen forward (the "zoom" effect)
	var/zoom_out_amt = 0

	var/dualwield_spread_mult = 2		//dualwield spread multiplier

	var/worn_out = FALSE	//If true adds overlay with suffix _worn, and a slight malus to stats
	var/dryfire_sound = "gun_dry_fire"
	var/dryfire_text = "*click*"

	var/automatic = 0 // Does the gun fire when the clicker's held down?

	var/init_offset = 0
	var/datum/recoil/recoil_dat // Reference to the recoil datum in datum/recoil.dm
	var/list/init_recoil = list(0, 0, 0) // For updating weapon mods
	var/braced = FALSE
	var/braceable = 1 //can the gun be used for gun_brace proc, modifies recoil. If the gun has foregrip mod installed, it's not braceable. Bipod mod increases value by 1.

	var/safety = FALSE
	var/restrict_safety = FALSE //To restrict the users ability to toggle the safety

	var/sel_mode = 1 //index of the currently selected mode
	var/list/firemodes = list()
	var/list/init_firemodes = list()

	var/list/gun_tags = list() //Attributes of the gun, used to see if an upgrade can be applied to this weapon.
	var/gilded = FALSE
	/*	SILENCER HANDLING */
	var/silenced = FALSE
	var/fire_sound_silenced = 'modular_coyote/eris/sound/Gunshot_silenced.wav' //Firing sound used when silenced
	var/zoom_factor = 0 //How much to scope in when using weapons
	var/rigged = FALSE
	var/vision_flags = 0
	var/projectile_speed_multiplier = 1
	/// How should this gun prefer to weight what limbs they hit
	var/gun_accuracy_zone_type = ZONE_WEIGHT_SEMI_AUTO
	/// What kind of traits should this gun be affected by
	var/gun_skill_check
	/// What kind of temporary refire delay modifiers do we have?
	var/cooldown_delay_mods
	var/list/gun_sound_properties = list(
		SP_VARY(TRUE),
		SP_VOLUME(50),
		SP_VOLUME_SILENCED(20),
		SP_NORMAL_RANGE(SOUND_RANGE + 5),
		SP_NORMAL_RANGE_SILENCED(SOUND_RANGE - 15),
		SP_IGNORE_WALLS(TRUE)
	)

/obj/item/gun/refresh_upgrades()
	//First of all, lets reset any var that could possibly be altered by an upgrade
	damage_multiplier = initial(damage_multiplier)
	penetration_multiplier = initial(penetration_multiplier)
	//pierce_multiplier = initial(pierce_multiplier)
	//ricochet_multiplier = initial(ricochet_multiplier)
	projectile_speed_multiplier = initial(projectile_speed_multiplier)
	//proj_agony_multiplier = initial(proj_agony_multiplier)
	fire_delay = initial(fire_delay)
	burst_shot_delay = initial(burst_shot_delay)
	//move_delay = initial(move_delay)
	//muzzle_flash = initial(muzzle_flash)
	silenced = initial(silenced)
	restrict_safety = initial(restrict_safety)
	init_offset = initial(init_offset)
	//proj_damage_adjust = list()
	//fire_sound = initial(fire_sound)
	restrict_safety = initial(restrict_safety)
	rigged = initial(rigged)
	zoom_factor = initial(zoom_factor)
	//darkness_view = initial(darkness_view)
	vision_flags = initial(vision_flags)
	force = initial(force)
	armour_penetration = initial(armour_penetration)
	sharpness = initial(sharpness)
	braced = initial(braced)
	recoil_dat = getRecoil(init_recoil[1], init_recoil[2], init_recoil[3])

	//attack_verb = list()

	//Now lets have each upgrade reapply its modifications
	SEND_SIGNAL(src, COMSIG_UPGRADE_ADDVAL, src)
	SEND_SIGNAL(src, COMSIG_UPGRADE_APPVAL, src)



	update_icon()
	//then update any UIs with the new stats
