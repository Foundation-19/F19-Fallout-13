/obj/item/ammo_box/magazine/greasegun
	name = "Grease gun magazine (.45ACP)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "grease"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = list(CALIBER_45ACP)
	max_ammo = 30
	multiple_sprites = 2
	custom_materials = list(/datum/material/iron = MATS_SMG)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_box/magazine/greasegun/empty
	start_empty = 1