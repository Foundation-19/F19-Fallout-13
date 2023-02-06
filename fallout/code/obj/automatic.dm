/obj/item/gun/ballistic/automatic/smg/greasegun
	name = "m3a1 greasegun"
	desc = "This submachine gun filled National Guard arsenals after the Army replaced it with newer weapons."
	icon_state = "grease_gun"
	inhand_icon_state = "smg9mm"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/greasegun
	init_mag_type = /obj/item/ammo_box/magazine/greasegun

	slowdown = GUN_SLOWDOWN_SMG_LIGHT
	force = GUN_MELEE_FORCE_PISTOL_HEAVY
	weapon_weight = GUN_ONE_HAND_ONLY
	draw_time = GUN_DRAW_LONG
	damage_multiplier = GUN_LESS_DAMAGE_T3
	init_firemodes = list(
		FULL_AUTO_200,
		SEMI_AUTO_SMG
	)

	suppressor_state = "uzi_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 19
	fire_sound = 'fallout/sound/f13weapons/greasegun.ogg'
	gun_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_MEDIUM_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_MEDIUM_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_MEDIUM_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_MEDIUM_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_MEDIUM_RANGE_DISTANT)
	)

/* * * * * * * * * * *
 * Uzi 9mm SMG
 * Light 9mm SMG
 * 9mm
 * Very Fast Firing Rate
 * Less damage
 * Common
 * * * * * * * * * * */

/obj/item/gun/ballistic/automatic/smg/mini_uzi
	name = "Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "uzi"
	inhand_icon_state = "uzi"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	init_mag_type = /obj/item/ammo_box/magazine/uzim9mm

	slowdown = GUN_SLOWDOWN_SMG_LIGHT
	force = GUN_MELEE_FORCE_PISTOL_LIGHT
	weapon_weight = GUN_TWO_HAND_ONLY
	draw_time = GUN_DRAW_LONG
	damage_multiplier = GUN_LESS_DAMAGE_T2
	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_SMG
	)

	can_suppress = TRUE
	suppressor_state = "uzi_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 16
	gun_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_LIGHT_RANGE_DISTANT)
	)

/* * * * * * * * * * *
 * Type 17 Semi-Auto
 * Cheap Medium pistol
 * 10mm
 * Less accurate
 * Less damage
 * Common
 * * * * * * * * * * */
/obj/item/gun/ballistic/automatic/pistol/type17
	name = "Type 17"
	desc = "Chinese military sidearm at the time of the Great War. The ones around are old and worn, but somewhat popular due to the long barrel and rechambered in 10mm after the original ammo ran dry decades ago."
	icon_state = "chinapistol"
	w_class = WEIGHT_CLASS_NORMAL

	force = GUN_MELEE_FORCE_PISTOL_LIGHT
	weapon_weight = GUN_ONE_HAND_AKIMBO
	draw_time = GUN_DRAW_NORMAL
	damage_multiplier = GUN_LESS_DAMAGE_T1
	init_recoil = HANDGUN_RECOIL(0.6)

	can_suppress = FALSE
	fire_sound = 'fallout/sound/f13weapons/10mm_fire_02.ogg'
	gun_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_MEDIUM_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_MEDIUM_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_MEDIUM_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_MEDIUM_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_MEDIUM_RANGE_DISTANT)
	)
/* * * * * * * * * * *
 * Worn Type 93 assault rifle
 * Chinese 5.56mm autorifle
 * .223 / 5.56mm
 * Less damage
 * Less accuracy
 * Slower to shoot
 * Uncommon
 * * * * * * * * * * */

/obj/item/gun/ballistic/automatic/type93/worn //28dmg
	name = "\improper Worn Type 93"
	desc = "This Type 93 Chinese assault rifle looks like it has been made in a garage. The bore is shot to hell, the threading is destroyed, but atleast it works."
	icon = 'fallout/icons/objects/guns/ballistic.dmi'
	icon_state = "type93"
	inhand_icon_state = "handmade_rifle"

	slowdown = GUN_SLOWDOWN_RIFLE_LIGHT_AUTO
	force = GUN_MELEE_FORCE_RIFLE_HEAVY
	draw_time = GUN_DRAW_LONG
	damage_multiplier = GUN_LESS_DAMAGE_T1
	init_recoil = RIFLE_RECOIL(1.25)
	init_firemodes = list(
		BURST_8_ROUND
	)

	can_suppress = FALSE