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
