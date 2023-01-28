/obj/item/gun

	var/list/gun_tags = list() //Attributes of the gun, used to see if an upgrade can be applied to this weapon.
	var/list/gun_sound_properties = list(
		SP_VARY(TRUE),
		SP_VOLUME(50),
		SP_VOLUME_SILENCED(20),
		SP_NORMAL_RANGE(SOUND_RANGE + 5),
		SP_NORMAL_RANGE_SILENCED(SOUND_RANGE - 15),
		SP_IGNORE_WALLS(TRUE)
	)

	var/draw_time = GUN_DRAW_NORMAL
	var/worn_out = FALSE	//If true adds overlay with suffix _worn, and a slight malus to stats
	var/dryfire_sound = "gun_dry_fire"
	var/dryfire_text = "*click*"
	var/list/init_firemodes = list()
	var/list/init_recoil = list(0, 0, 0) // For updating weapon mods
	var/suppressor_state = null
	var/damage_multiplier = 1 //Multiplies damage of projectiles fired from this gun