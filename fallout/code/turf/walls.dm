//Fallout 13 general destructible walls directory

/turf/closed/wall/f13/
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'fallout/icons/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/wall/f13/ReplaceWithLattice()
	ChangeTurf(baseturfs)

/turf/closed/wall/f13/ruins
	name = "ruins"
	desc = "All what has left from the good old days."
	icon = 'fallout/icons/turfs/f13composite.dmi'
	icon_state = "ruins"
	base_icon_state = "ruins"
	hardness = 70
	explosive_resistance = 2
	smoothing_flags = SMOOTH_TRUE
	//	disasemblable = 0
	girder_type = 0
	baseturfs = /turf/open/indestructible/ground/outside/ruins
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/ruins, /turf/closed/wall)
	unbreakable = 0


/turf/closed/wall/f13/wood
	name = "wooden wall"
	desc = "A traditional wooden wall."
	icon = 'fallout/icons/turfs/walls/wood.dmi'
	icon_state = "wood0"
	base_icon_state = "wood"
	hardness = 60
	smoothing_flags = SMOOTH_OLD
	unbreakable = 0
	baseturfs = /turf/open/floor/plating/wooden
	sheet_type = /obj/item/stack/sheet/mineral/wood
	sheet_amount = 2
	girder_type = 0
	canSmoothWith = list(/turf/closed/wall/f13/wood, /turf/closed/wall)

/turf/closed/wall/f13/wood/house
	name = "house wall"
	desc = "A weathered pre-War house wall."
	icon = 'fallout/icons/turfs/walls/house.dmi'
	icon_state = "house0"
	base_icon_state = "house"
	hardness = 50
	var/broken = 0
	canSmoothWith = list(/turf/closed/wall/f13/wood/house, /turf/closed/wall/f13/wood/house/broken, /turf/closed/wall, /turf/closed/wall/f13/wood/house/clean)

/turf/closed/wall/f13/wood/house/broken
	broken = 1
	damage = 21
	icon_state = "house0-broken"

/turf/closed/wall/f13/wood/house/broken/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/I = W
		if(I.amount < 2)
			return
		if(!do_after(user, 5 SECONDS, FALSE, src))
			to_chat(user, span_warning("You must stand still to fix the wall!"))
			return
		W.use(2)
		ChangeTurf(/turf/closed/wall/f13/wood/house)
	. = ..()


/turf/closed/wall/f13/wood/house/take_damage(dam)
	if(damage + dam > hardness/2)
		broken = 1
	..()

/turf/closed/wall/f13/wood/house/update_icon()
	if(broken)
		set_opacity(0)
	..()

/turf/closed/wall/f13/wood/house/update_damage_overlay()
	if(broken)
		return
	..()

/turf/closed/wall/f13/wood/house/clean
	icon_state = "house0-clean"

/turf/closed/wall/f13/wood/interior
	name = "interior wall"
	desc = "Interesting, what kind of material they have used - these wallpapers still look good after all the centuries..."
	icon = 'fallout/icons/turfs/walls/interior.dmi'
	icon_state = "interior0"
	base_icon_state = "interior"
	hardness = 10
	smoothing_flags = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/wood/interior, /turf/closed/wall)

/turf/closed/wall/f13/store
	name = "store wall"
	desc = "A pre-War store wall made of solid concrete."
	icon = 'fallout/icons/turfs/f13store.dmi'
	icon_state = "store"
	base_icon_state = "store"
	hardness = 80
	smoothing_flags = SMOOTH_TRUE
	//	disasemblable = 0
	baseturfs = /turf/open/indestructible/ground/outside/ruins
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/store, /turf/closed/wall/f13/store/constructed, /turf/closed/wall,)

/turf/closed/wall/f13/tentwall
	name = "tent wall"
	desc = "The walls of a portable tent."
	icon = 'fallout/icons/turfs/walls/tent.dmi'
	icon_state = "tent0"
	base_icon_state = "tent"
	hardness = 10
	unbreakable = 0
	smoothing_flags = SMOOTH_OLD
	//	disasemblable = 0
	baseturfs = /turf/open/indestructible/ground/outside/ruins
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/tentwall, /turf/closed/wall)

/turf/closed/wall/f13/scrap
	name = "scrap wall"
	desc = "A wall held together by corrugated metal and prayers."
	icon = 'fallout/icons/turfs/walls/scrap.dmi'
	icon_state = "scrap0"
	base_icon_state = "scrap"
	hardness = 80
	smoothing_flags = SMOOTH_OLD
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall)

/turf/closed/wall/f13/scrap/red
	icon = 'fallout/icons/turfs/walls/scrap_red.dmi'
	icon_state = "scrapr0"
	base_icon_state = "scrapr"

/turf/closed/wall/f13/scrap/blue
	icon = 'fallout/icons/turfs/walls/scrap_blue.dmi'
	icon_state = "scrapb0"
	base_icon_state = "scrapb"

/turf/closed/wall/f13/scrap/white
	icon = 'fallout/icons/turfs/walls/scrap_white.dmi'
	icon_state = "scrapw0"
	base_icon_state = "scrapw"

/turf/closed/wall/f13/scrap/junk
	name = "junk wall"
	desc = "More a pile of debris and rust than a wall, but it'll hold for now."
	icon = 'fallout/icons/turfs/walls/scrap_rough.dmi'
	icon_state = "scrapro0"
	base_icon_state = "scrapro"

/turf/closed/wall/f13/supermart
	name = "supermart wall"
	desc = "A pre-War supermart wall made of reinforced concrete."
	icon = 'fallout/icons/turfs/f13superstore.dmi'
	icon_state = "supermart"
	base_icon_state = "supermart"
	hardness = 90
	explosive_resistance = 2
	smoothing_flags = SMOOTH_TRUE
	baseturfs = /turf/open/indestructible/ground/outside/ruins
	//	disasemblable = 0
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/supermart, /turf/closed/wall/mineral/concrete, /turf/closed/wall,)

/turf/closed/wall/f13/tunnel
	name = "utility tunnel wall"
	desc = "A sturdy metal wall with various pipes and wiring set inside a special groove."
	icon = 'fallout/icons/turfs/walls/tunnel.dmi'
	icon_state = "tunnel0"
	base_icon_state = "tunnel"
	hardness = 100
	smoothing_flags = SMOOTH_OLD
	//	disasemblable = 0
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/tunnel, /turf/closed/wall)

/turf/closed/wall/f13/vault
	name = "vault wall"
	desc = "A sturdy and cold metal wall."
	icon = 'fallout/icons/turfs/walls/vault.dmi'
	icon_state = "vault0"
	base_icon_state = "vault"
	hardness = 130
	explosive_resistance = 5
	smoothing_flags = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/vault, /turf/closed/wall/r_wall/f13/vault, /turf/closed/wall)

/turf/closed/wall/r_wall/f13
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'fallout/icons/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/wall/r_wall/f13/vault
	name = "vault reinforced wall"
	desc = "A wall built to withstand an atomic explosion."
	icon = 'fallout/icons/turfs/walls/vault_reinforced.dmi'
	icon_state = "vaultrwall0"
	base_icon_state = "vaultrwall"
	hardness = 230
	explosive_resistance = 5
	smoothing_flags = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/vault, /turf/closed/wall/r_wall/f13/vault, /turf/closed/wall)

//Sunset custom walls

/turf/closed/wall/f13/sunset/brick_small
	name = "brick wall"
	desc = "A wall made out of solid brick."
	icon = 'fallout/code/modular_sunset/icons/turfs/walls/brick_small.dmi'
	icon_state = "brick0"
	base_icon_state = "brick"
	hardness = 80
	smoothing_flags = SMOOTH_OLD
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall)

/turf/closed/wall/f13/sunset/brick_small_dark
	name = "brick wall"
	desc = "A wall made out of solid brick."
	icon = 'fallout/code/modular_sunset/icons/turfs/walls/brick_small_dark.dmi'
	icon_state = "brick0"
	base_icon_state = "brick"
	hardness = 80
	smoothing_flags = SMOOTH_OLD
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall)

/turf/closed/wall/f13/sunset/brick_small_light
	name = "brick wall"
	desc = "A wall made out of solid brick."
	icon = 'fallout/code/modular_sunset/icons/turfs/walls/brick_small_light.dmi'
	icon_state = "brick0"
	base_icon_state = "brick"
	hardness = 80
	smoothing_flags = SMOOTH_OLD
	girder_type = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall)

//Fallout 13 indestructible walls

/turf/closed/indestructible/f13
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'fallout/icons/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/indestructible/f13/subway
	name = "tunnel wall"
	desc = "This wall is made of reinforced concrete.<br>Pre-War engineers knew how to build reliable things."
	icon = 'fallout/icons/turfs/walls/subway.dmi'
	icon_state = "subwaytop"

/turf/closed/indestructible/f13/matrix //The Chosen One from Arroyo!
	name = "matrix"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Digital simulation ends here.</font>"
	icon_state = "matrix"
	var/in_use = FALSE

/turf/closed/indestructible/f13/matrix/MouseDrop_T(atom/dropping, mob/user)
	. = ..()
	if(!isliving(user) || user.incapacitated())
		return //No ghosts or incapacitated folk allowed to do this.
	if(!ishuman(dropping))
		return //Only humans have job slots to be freed.
	if(in_use) // Someone's already going in.
		return
	var/mob/living/carbon/human/departing_mob = dropping
	if(departing_mob != user && departing_mob.client)
		to_chat(user, span_warning("This one retains their free will. It's their choice if they want to depart or not."))
		return
	if(alert("Are you sure you want to [departing_mob == user ? "depart the area for good (you" : "send this person away (they"] will be removed from the current round, the job slot freed)?", "Departing the area", "Confirm", "Cancel") != "Confirm")
		return
	if(user.incapacitated() || QDELETED(departing_mob) || (departing_mob != user && departing_mob.client) || get_dist(src, dropping) > 2 || get_dist(src, user) > 2)
		return //Things have changed since the alert happened.
	if(departing_mob.logout_time && departing_mob.logout_time + 2 MINUTES > world.time)
		to_chat(user, span_warning("This mind has only recently departed. Wait at most two minutes before sending this character out of the round."))
		return
	user.visible_message(span_warning("[user] [departing_mob == user ? "is trying to leave the area!" : "is trying to send [departing_mob] away!"]"), span_notice("You [departing_mob == user ? "are trying to leave the area." : "are trying to send [departing_mob] away."]"))
	icon_state = "matrix_going" // ALERT, WEE WOO
	update_icon()
	in_use = TRUE
	if(!do_after(user, 50, target = src))
		icon_state = initial(icon_state)
		in_use = FALSE
		return
	icon_state = initial(icon_state)
	in_use = FALSE
	update_icon()
	var/dat = "[key_name(user)] has despawned [departing_mob == user ? "themselves" : departing_mob], job [departing_mob.job], at [AREACOORD(src)]. Contents despawned along:"
	if(!length(departing_mob.contents))
		dat += " none."
	else
		var/atom/movable/content = departing_mob.contents[1]
		dat += " [content.name]"
		for(var/i in 2 to length(departing_mob.contents))
			content = departing_mob.contents[i]
			dat += ", [content.name]"
		dat += "."
	message_admins(dat)
	log_admin(dat)
	if(departing_mob.stat == DEAD)
		departing_mob.visible_message(span_notice("[user] pushes the body of [departing_mob] over the border. They're someone else's problem now."))
	else
		departing_mob.visible_message(span_notice("[departing_mob == user ? "Out of their own volition, " : "Ushered by [user], "][departing_mob] crosses the border and departs the area."))
	departing_mob.despawn()


/turf/closed/indestructible/f13/obsidian //Just like that one game studio that worked on the original game, or that block in Minecraft!
	name = "obsidian"
	desc = "No matter what you do with this rock, there's not even a scratch left on its surface.<br><font color='#7e0707'>You shall not pass!!!</font>"
	icon = 'fallout/icons/turfs/mining.dmi'
	icon_state = "rock1"

/turf/closed/indestructible/f13/obsidian/New()
	..()
	icon_state = "rock[rand(1,6)]"

//Splashscreen
/*
/turf/closed/indestructible/f13/splashscreen
	var/tickerPeriod = 300 //in deciseconds
	var/go/fullDark

/turf/closed/indestructible/f13/splashscreen/New()
	.=..()
	name = "Fallout 13"
	desc = "The wasteland is calling!"
	icon = 'fallout/icons/icons/misc/lobby.dmi'
	icon_state = "title[rand(1,13)]"
	layer = 60
	plane = 1
	src.fullDark = new/go{
		icon = 'fallout/icons/icons/misc/lobby.dmi' //Replace with actual icon
		icon_state = "transition" //Replace with actual darkness state
		layer = 61;
		alpha = 0;
		}(src)
	src.fullDark.plane = 1
	spawn() src.ticker()
	return

/turf/closed/indestructible/f13/splashscreen/proc/ticker()
	while(src && istype(src,/turf/closed/indestructible/f13/splashscreen))
		src.swapImage()
		sleep(src.tickerPeriod)
	to_chat(world, "Badmins spawn shit and the title screen was deleted.<br>You know... I'm out of here!")
	return

//Change the time to determine how short/long the fading animation is.
//Change the easing to determine what interpolation it uses to change the value on a curve: good ones to try are CUBIC, BOUNCE, and ELASTIC as well as CIRCULAR. BOUNCE and ELASTIC both "bounce" or "flicker" a little bit at the end instead of just finishing straight at black.

/turf/closed/indestructible/f13/splashscreen/proc/swapImage()
	animate(src.fullDark,alpha=255,time=10,easing=CUBIC_EASING)
	sleep(12) //buffer of about 1/5 of the time of the animation, since they are not synchronized: the sleep happens on the server, but the animation is played for each client using directX. It's good to leave a buffer, but most of the time the directX will be much faster than the server anyway so you probably wont have any problems.
	src.icon_state = "title[rand(1,13)]"
	animate(src.fullDark,alpha=0,time=10,easing=CUBIC_EASING)
	return
*/
