//Fallout 13 base of Wasteland economics

/obj/item/stack/caps
	name = "caps"
	desc = "Currency used in certain regions of the wasteland."
	singular_name = "cap"
	icon = 'icons/fallout/objects/bottlecaps.dmi'
	icon_state = "1"
	amount = 1
	max_amount = 30000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = 1

/obj/item/stack/caps/New()
	..()
	update_icon()

/obj/item/stack/caps/update_icon()
	if(amount >= 20)
		icon_state = "20"
	else
		icon_state = "[amount]"

/obj/item/stack/caps/random/New()
	amount = rand(5,30)
	..()

/obj/item/stack/caps/minerpayment
	name = "caps"
	desc = "Currency used in certain regions of the wasteland."
	singular_name = "cap"
	icon = 'icons/fallout/objects/bottlecaps.dmi'
	icon_state = "1"
	amount = 800
	max_amount = 30000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = 1


/obj/item/stack/caps/officerswalletstart
	name = "caps"
	desc = "Currency used in certain regions of the wasteland."
	singular_name = "cap"
	icon = 'icons/fallout/objects/bottlecaps.dmi'
	icon_state = "1"
	amount = 5000
	max_amount = 30000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = 1
