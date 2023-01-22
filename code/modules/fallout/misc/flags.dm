/obj/flag
	icon = 'icons/fallout/advanced/flags.dmi'
	icon_state = "city"
	pixel_x = 10
	anchored = 1
	layer = 10

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/flagpole
	name = "Flagpole"
	icon = 'icons/fallout/advanced/flagpole_2.dmi'
	icon_state = "flag_stock"
	anchored = 1
	density = 1
	layer = 11

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

	var/flag_location = "dummy"
	var/flag_faction = "none"
	var/flag_tickets = 100
	var/flag_nextFire = 0
	var/obj/flag


/obj/flagpole/New()
	..()
	flag = new /obj/flag(loc)
	flag.icon_state = flag_faction
	SSflag.processing += src

/obj/flagpole/proc/onCaptured(var/faction)

	flag_faction = faction
	flag.icon_state = faction

	var/datum/f13_faction/faction_datum = get_faction_datum(faction)
	var/faction_name = faction_datum.name
	to_chat(world, "<font size='4' color='red'>[flag_location] was captured by the [faction_name]!</font>")

/obj/flagpole/proc/onLoosing()
	to_chat(world, "<font size='3' color='blue'>Panicked radio traffic indicates that someone is attempting to capture [flag_location]!</font>")

/obj/flagpole/proc/onUpdate()
	flag.pixel_y = 10 + flag_tickets

/obj/flagfakencr
	icon = 'icons/fallout/advanced/flags.dmi'
	icon_state = "ncr"
	pixel_x = 10
	anchored = 1
	layer = 10

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/flagpolefakencr
	name = "Flagpole"
	icon = 'icons/fallout/advanced/flagpole_2.dmi'
	icon_state = "flag_stock"
	anchored = 1
	density = 1
	layer = 11

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

	var/flag_location = "NCR Outpost Gallant"
	var/obj/flag

/obj/flagpolefakencr/New()
	..()
	flag = new /obj/flag(loc)


/obj/flagfakelegion
	icon = 'icons/fallout/advanced/flags.dmi'
	icon_state = "legion"
	pixel_x = 10
	anchored = 1
	layer = 10

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/flagpolefakelegion
	name = "Flagpole"
	icon = 'icons/fallout/advanced/flagpole_2.dmi'
	icon_state = "flag_stock"
	anchored = 1
	density = 1
	layer = 11

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

	var/flag_location = "Legion Camp Minerva"
	var/obj/flag

/obj/flagpolefakelegion/New()
	..()
	flag = new /obj/flagfakelegion(loc)






//////////////////////////
//////////Flags//////////
/////////////////////////
/obj/item/flagstructure
	name = "empty flag"
	desc = "you could put some leather there."
	density = 1
	anchored = 1
	w_class = 4

	layer = 4.1
	icon = 'icons/fallout/advanced/flags2.dmi'
	icon_state = "emptyflag"
	item_state = "emptyflag"
	var/faction = null

/obj/item/flagstructure/ncr
	name = "NCR flag"
	desc = "A flag with a two headed bear, the symbol of the New California Republic."
	icon_state = "ncrflag"
	item_state = "ncrflag"
	faction = "ncr"

/obj/item/flagstructure/legion
	name = "Legion flag"
	desc = " A flag with a golden bull, the symbol of Ceasar's Legion."
	icon_state = "legionflag"
	item_state = "legionflag"
	faction = "legion"


//defining the code so you can add new flags ontop of empty ones

/obj/item/flagstructure/attackby(obj/item/I, mob/living/carbon/human/player, params)
	if(istype(I, /obj/item/stack/sheet/leather) && item_state == "emptyflag")
		var/flag = player.social_faction
		if(flag)
			visible_message("<span class='notice'>[player] begin to make a flag.</span>")
			if(do_after(player,20, target = src))
				var/obj/item/stack/sheet/leather/H = I
				if(H.use(1))
					switch(flag)
						if("ncr")
							name = "NCR flag"
							desc = "A flag with a two headed bear, the symbol of the New California Republic."
							icon_state = "ncrflag"
							item_state = "ncrflag"
							faction = "ncr"
						if("legion")
							name = "Legion flag"
							desc = " A flag with a golden bull, the symbol of Ceasar's Legion."
							icon_state = "legionflag"
							item_state = "legionflag"
							faction = "legion"
					update_icon()
	else
		attack_hand(player)

/obj/item/flagstructure/attack_hand(mob/living/carbon/human/player)
	if(item_state != "emptyflag" && faction != player.social_faction)
		visible_message("<span class='notice'>[player] begin to remove a flag.</span>")
		if(do_after(player,20, target = src) && faction)
			new /obj/item/stack/sheet/leather(loc)
			name = "empty flag"
			icon_state = "emptyflag"
			item_state = "emptyflag"
			faction = null
			update_icon()
	else
		anchored = 0
		..()
/obj/item/flagstructure/dropped(mob/living/carbon/human/player)
	..()
	anchored = 1
/obj/item/flagstructure/throw_at(atom/target, range, speed, mob/thrower, spin=1)
	dropped(thrower)
