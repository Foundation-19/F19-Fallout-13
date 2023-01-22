//Fallout 13 object and item weight simulation

/atom/movable
	var/contents_weight = 0
	var/self_weight = 0

/atom/movable/Initialize()
	..()
	if(self_weight == null && isitem(src))
		var/obj/item/I = src
		switch(I.w_class) //switching this up as the idea really should be to punish gear hoarders, not to make everyone slow. initial one is slow so that there is disparity between no gear and gear, but other than that it only focuses on excessive gear
			if(0)
				self_weight = 0
			if(1)
				self_weight = 15.000
			if(2)
				self_weight = 25.000
			if(3)
				self_weight = 80.000
			if(4)
				self_weight = 90.000
			if(5)
				self_weight = 95.000
			if(6)
				self_weight = 100.000
	if(istype(loc, /atom/movable))
		var/atom/movable/L = loc
		L.update_carry_weight(self_weight)

/atom/movable/proc/update_carry_weight(var/weight)
	if(istype(loc, /atom/movable))
		var/atom/movable/L = loc
		L.update_carry_weight(weight)
	contents_weight = max(0, contents_weight + weight)

/atom/movable/Entered(atom/movable/A, atom/oldloc)
	. = ..()
	update_carry_weight(A.self_weight + A.contents_weight)

/atom/movable/Exited(atom/movable/A, atom/newloc)
	. = ..()
	update_carry_weight( -(A.self_weight + A.contents_weight))

/mob/living/carbon/Move(n, direct)
	. = ..()
	if(!.)
		return .
	if(contents_weight > LIMIT_WEIGHT && prob(5))
		Knockdown (1)
