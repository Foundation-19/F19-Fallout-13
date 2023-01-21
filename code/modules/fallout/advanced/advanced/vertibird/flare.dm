/obj/item/vertibird_flare
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flareblue"
	name = "Vertibird emergency flare"
	desc = "REQUESTING MED-EVAC!"
	w_class = 1

/obj/item/vertibird_flare/proc/callDeathSquad()
	spawn(300)
		qdel(src)

	if(!vertibird)
		return

	if(src.z != 1)
		src.visible_message("A vertibird can't land here!")
		return

	var/turf/turf = locs[1]

	if(!isarea(turf.loc))
		src.visible_message("Your location isn't visible on GPS!")
		return

	if(!istype(turf.loc, /area/f13/wasteland))
		src.visible_message("Unable to land, find a clear LZ!")
		return

	vertibird:fly(src.x, src.y)

/obj/item/vertibird_flare/attack_self(mob/user)
	icon_state = "[icon_state]-on"
	user.drop_item(src)
	src.anchored = 1
	callDeathSquad()
