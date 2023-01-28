/atom/movable
	var/can_be_z_moved = TRUE

/atom/movable/proc/get_locs()
	. = locs //locs is a special list, so this is the same as locs.Copy(), but internally cheaper
	for(var/atom/place as anything in locs)
		// We pass the list by reference, and if something has something to add they'll do so here.
		SEND_SIGNAL(place, COMSIG_ATOM_GET_LOCS, .)