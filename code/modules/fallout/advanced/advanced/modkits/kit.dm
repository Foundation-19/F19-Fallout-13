/obj/item/kit
	name = "Modification Kit"
	desc = "This one is useless and probably shouldn't have spawned. Yell at an admin.."
	icon = 'icons/fallout/advanced/modkits.dmi'
	icon_state = "wmk"
	var/type_deserved = /obj/item/weapon/gun
	var/sufix
	var/prefix

/obj/item/kit/proc/install(var/obj/item/I)
	if(type in I:modifications)
		to_chat(usr, "You install the weapon modification kit.")
		return

	if(!istype(I, type_deserved))
		to_chat(usr, "This weapon modification kit is not compatible with this item.")
		return

	if(!do_mob(usr, usr, 30))
		return

	I:modifications += type
	I:modificationsNames += name

	if(type_deserved == /obj/item/weapon/gun)
		weaponUpgrade(I)
	else
		armorUpgrade(I)

/obj/item/kit/proc/weaponUpgrade(var/obj/item/I)
	var/obj/item/weapon/gun/W = I

	if(istype(src, /obj/item/kit/recoil))
		I:recoil = 0

	if(istype(src, /obj/item/kit/burst))
		I:burst_size = 2
		I:fire_delay = 3

	if(istype(src, /obj/item/kit/bayonet))
		I:force *= 3

	if(istype(src, /obj/item/kit/scope))
		W.zoomable = TRUE
		W.zoom_amt = 6
		W.scopetype = /obj/screen/fullscreen/scope/short
		W.azoom = new()
		W.azoom.gun = W

	onInstalled(I)

/obj/item/kit/proc/armorUpgrade(var/obj/item/I)
	onInstalled(I)

/obj/item/kit/proc/onInstalled(var/obj/item/I)
	if(!I:name_original)
		I:name_original = I.name

	if(prefix)
		I.name = "[prefix] [I.name]"

	if(sufix)
		I.name = "[I.name] [sufix]"

	to_chat(usr, "<font color='blue'>installed [name] on [I.name].</font>")

	qdel(src)
