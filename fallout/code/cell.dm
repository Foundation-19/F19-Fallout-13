////////////////////////
// FALLOUT POWERCELLS //
////////////////////////

// Ammo cell template
/obj/item/stock_parts/cell/ammo
	name = "ammo cell"
	desc = "You shouldn't be holding this."
	cancharge = 1
	w_class = WEIGHT_CLASS_TINY

/obj/item/stock_parts/cell/ammo/update_icon()
	if(charge > 1)
		name = "[initial(name)]"
	else
		name = "used [initial(name)]"
	. = ..()

/obj/item/stock_parts/cell/ammo/New()
	..()
	return

// Microfusion cell - large energy weapons
/obj/item/stock_parts/cell/ammo/mfc
	name = "microfusion cell"
	desc = "A microfusion cell, typically used as ammunition for large energy weapons."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "mfc-full"
	maxcharge = 2000

/obj/item/stock_parts/cell/ammo/mfc/update_icon()
	switch(charge)
		if (1001 to 2000)
			icon_state = "mfc-full"
		if (51 to 1000)
			icon_state = "mfc-half"
		if (0 to 50)
			icon_state = "mfc-empty"
	. = ..()

/obj/item/stock_parts/cell/ammo/ultracite
	name = "ultracite cell"
	desc = "An advanced ultracite cell, used as ammunition for special energy weapons."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "ultracite"
	maxcharge = 2000

// Energy cell - small energy weapons
/obj/item/stock_parts/cell/ammo/ec
	name = "energy cell"
	desc = "An energy cell, typically used as ammunition for small-arms energy weapons."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "ec-full"
	maxcharge = 1600

//for self-recharging weapons, should not be removeable from the gun
/obj/item/stock_parts/cell/ammo/breeder
	name = "microfusion breeder"
	desc = "A miniature microfusion reactor connected to capacitor banks. This is not a removable part, you messed up."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "ec-full"
	maxcharge = 1400

/obj/item/stock_parts/cell/ammo/breeder/rifle
	desc = "An older first-generation miniature microfusion reactor connected to capacitor banks. This is not a removable part, you messed up."
	maxcharge = 1200

/obj/item/stock_parts/cell/ammo/ec/update_icon()
	switch(charge)
		if (1101 to 1600)
			icon_state = "ec-full"
		if (551 to 1100)
			icon_state = "ec-twothirds"
		if (51 to 550)
			icon_state = "ec-onethirds"
		if (0 to 50)
			icon_state = "ec-empty"
	. = ..()

// Electron charge pack - rapid fire energy
/obj/item/stock_parts/cell/ammo/ecp
	name = "electron charge pack"
	desc = "An electron charge pack, typically used as ammunition for rapidly-firing energy weapons."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "ecp-full"
	maxcharge = 2400

/obj/item/stock_parts/cell/ammo/ecp/update_icon()
	switch(charge)
		if (1501 to 2400)
			icon_state = "ecp-full"
		if (101 to 1500)
			icon_state = "ecp-half"
		if (0 to 100)
			icon_state = "ecp-empty"
	. = ..()

// Alien power cell
/obj/item/stock_parts/cell/ammo/alien
	name = "alien weapon cell"
	desc = "A weapon cell that glows and thrums with unearthly energies. You're not sure you'd be able to recharge it, but it seems very powerful."
	icon = 'fallout/icons/objects/powercells.dmi'
	icon_state = "aliencell"
	ratingdesc = FALSE
	maxcharge = 4000
	cancharge = 0
