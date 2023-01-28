//Fallout 13 general destructible floor directory

/turf/open/floor/f13
	name = "floor"
	planetary_atmos = 1
	icon_state = "floor"
	base_icon_state = "plating"
	icon = 'fallout/icons/turfs/floors.dmi'

/turf/open/floor/f13/ReplaceWithLattice()
	ChangeTurf(baseturfs)

/turf/open/floor/f13/wood
	icon_state = "housewood1"
	icon = 'fallout/icons/turfs/ground.dmi'
	floor_tile = /obj/item/stack/tile/wood
	base_icon_state = "housebase"
//	step_sounds = list("human" = "woodfootsteps")

/turf/open/floor/f13/wood/New()
	..()

/turf/open/floor/f13/broken_states()
	return list("[initial(icon_state)]-broken[rand(1,4)]")


/turf/open/floor/f13/wood/make_plating()
	return ChangeTurf(/turf/open/floor/plating/wooden)

/turf/open/floor/f13/wood/attackby(obj/item/C, mob/user, params)
	if(..())
		return
	if(istype(C, /obj/item/screwdriver))
		if(broken || burnt)
			new /obj/item/stack/sheet/mineral/wood(src)
		else
			new floor_tile(src)
		to_chat(user, span_danger("You unscrew the planks."))
		make_plating()
		playsound(src, C.usesound, 80, 1)
		return
