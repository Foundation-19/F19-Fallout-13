//Fallout 13 floor plating directory

/turf/open/floor/plating/wooden
	name = "house base"
	icon_state = "housebase"
	icon = 'fallout/icons/turfs/ground.dmi'
//	step_sounds = list("human" = "woodfootsteps")

/turf/open/floor/plating/wooden/make_plating()
	return src

/turf/open/floor/plating/wooden/broken_states()
	return list("[initial(icon_state)][rand(1,4)]-broken")

/turf/open/floor/plating/tunnel
	name = "metal floor"
	icon_state = "tunneldirty"
	icon = 'fallout/icons/turfs/ground.dmi'
	baseturfs = /turf/open/indestructible/ground/inside/mountain
