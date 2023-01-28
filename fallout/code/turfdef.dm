/turf/open
	var/depth = 0

/mob/living/carbon/human/update_water()
	if(QDESTROYING(src))
		return
	var/depth = check_submerged()
	if(!depth)
		return