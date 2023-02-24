/////// MISC HELPERS ////////
/// Is this atom reflectable with ""standardized"" reflection methods like you know eshields and deswords and similar
/proc/is_energy_reflectable_projectile(atom/A)
	var/obj/projectile/P = A
	return istype(P) && P.is_reflectable

//Check armor penetration
/proc/check_armor_penetration(atom/A)
	var/obj/projectile/P = A
	return istype(P) && P.armour_penetration
