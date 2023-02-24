/obj/item

	/// In tiles, how far this weapon can reach.
	var/max_reach = 1
	/// Minimum distance needed in tiles for the target be reachable by this weapon.
	var/min_reach = 0

	var/total_mass //Total mass in arbitrary pound-like values. If there's no balance reasons for an item to have otherwise, this var should be the item's weight in pounds.
	var/stiffness = 0 // How much recoil is caused by moving
	var/damage_threshold_penetration = 0 // How much DT this thing ignores. Negative values increase the target's effective DT. Cant reduce DT below zero

/obj/item/proc/refresh_upgrades()
	return
