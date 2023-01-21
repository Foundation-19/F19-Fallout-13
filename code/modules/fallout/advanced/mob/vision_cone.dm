/////////////VISION CONE///////////////
//Vision cone code by Matt and Honkertron. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson. More info on that here:
//http://www.byond.com/forum/?post=195138
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker



//Defines.

#define OPPOSITE_DIR(D) turn(D, 180)

/mob
	var/obj/screen/fov = null//The screen object because I can't figure out how the hell TG does their screen objects so I'm just using legacy code.

client/
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()



//Procs
atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)
	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

mob/dead/InCone(mob/center = usr, dir = NORTH)//So ghosts aren't calculated.
	return

/*//TG doesn't have the grab item. But if you're porting it and you do then uncomment this.
mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/weapon/grab/G in center)
		if(src == G.affecting)
			return 0
		else
			return .
*/
// Commenting this - Sansaur
/*
proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/A in list)
		if(!A.InCone(center, dir))
			list -= A
	return list
*/

mob/proc/update_vision_cone()
	return

//Updating fov position on screen depends from client.pixel_x/y values
mob/proc/update_fov_position()

mob/living/carbon/human/update_fov_position()
	if(!client || !fov)
		return
	fov.screen_loc = "1:[-client.pixel_x],1:[-client.pixel_y]"

mob/living/carbon/human/update_vision_cone()
	// This did the opposite of what it was supposed to - Sansaur
	//CHECK_TICK
	if(src.client)
		var/image/I = null
		for(I in src.client.hidden_atoms)
			I.override = 0
			qdel(I)
		rest_cone_act()
		src.client.hidden_atoms = list()
		src.client.hidden_mobs = list()
		src.fov.dir = src.dir

	else
		return

mob/proc/rest_cone_act()//For showing and hiding the cone when you rest or lie down.
	if(resting || lying)
		hide_cone()
	else
		show_cone()

//Making these generic procs so you can call them anywhere.
mob/proc/show_cone()
	if(src.fov)
		src.fov.alpha = 0

mob/proc/hide_cone()
	if(src.fov)
		src.fov.alpha = 0

/mob/living/carbon/human/Move(atom/newloc, direct)
	. = ..()
	for(var/mob/living/carbon/human/M in oview(src))
		M.update_vision_cone()

	update_vision_cone()

// RECALLS

/mob/living/carbon/human/westface()
	. = ..()
	if(.)
		update_vision_cone()
/mob/living/carbon/human/eastface()
	. = ..()
	if(.)
		update_vision_cone()
/mob/living/carbon/human/northface()
	. = ..()
	if(.)
		update_vision_cone()
/mob/living/carbon/human/southface()
	. = ..()
	if(.)
		update_vision_cone()