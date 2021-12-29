/* Code by Tienn */
/* Sprites by Moonmandoom*/

#define STATE_IDLE 0
#define STATE_SERVICE 1
#define STATE_VEND 2
#define STATE_LOCKOPEN 3

#define CASH_CAP_VENDOR 1

/* exchange rates X * CAP*/
#define CASH_AUR_VENDOR 100 /* 100 caps to 1 AUR */
#define CASH_DEN_VENDOR 4 /* 4 caps to 1 DEN */
#define CASH_NCR_VENDOR 0.4 /* $100 to 40 caps */

// Total number of caps value spent in the Trading Protectrons Vendors
GLOBAL_VAR_INIT(vendor_cash, 0)

/obj/machinery/trading_machine
	name = "Wasteland Vending Machine"
	desc = "Wasteland Vending Machine! Unlock with a key, load your goods, and profit!"

	icon = 'icons/WVM/machines.dmi'
	icon_state = "custom_idle"
	obj_flags = UNIQUE_RENAME
	var/idle_icon_state = "custom_idle"
	var/service_icon_state = "custom_service"
	var/lock_icon_state = "custom_lock"

	anchored = 1
	density = 1
	layer = 2.9
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	obj_integrity = 300
	max_integrity = 300
	integrity_failure = 100
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)
	use_power = 0

	var/stored_item_type = list(/obj/item)
	var/content[0]		// store items
	var/stored_caps = 0	// store caps
	var/obj/item/lock_part/lock = null
	var/machine_state = STATE_IDLE // 0 - working, 1 - on service, 2 - on vending, 3 - open lock
	var/id = 0
	var/create_lock = TRUE
	var/create_key = TRUE
	var/create_description = FALSE
	var/basic_price = 20
	var/expected_price = 0
	var/obj/item/vending_item
	var/item_not_acceptable_message = "Something is wrong... Can't insert an item."
	var/free_wares = FALSE

/* Weapon Vending Machine*/
/obj/machinery/trading_machine/weapon
	name = "Weapon Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	idle_icon_state = "weapon_idle"
	service_icon_state = "weapon_service"
	lock_icon_state = "weapon_lock"

/* Ammo Vending Machine*/
/obj/machinery/trading_machine/ammo
	name = "Ammo Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "ammo_idle"
	idle_icon_state = "ammo_idle"
	service_icon_state = "ammo_service"
	lock_icon_state = "ammo_lock"

/* Armor Vending Machine*/
/obj/machinery/trading_machine/armor
	name = "Armor Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "armor_idle"
	idle_icon_state = "armor_idle"
	service_icon_state = "armor_service"
	lock_icon_state = "armor_lock"

/* Medical Vending Machine*/
/obj/machinery/trading_machine/medical
	name = "Medicine Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "med_idle"
	idle_icon_state = "med_idle"
	service_icon_state = "med_service"
	lock_icon_state = "med_lock"

/* Initialization */
/obj/machinery/trading_machine/Initialize()
	. = ..()
	if(create_lock)
		lock = new /obj/item/lock_part()
		lock.forceMove(src)
	if(create_key)
		var/obj/item/key/vending/K = new /obj/item/key/vending()
		K.name = "[src.name] key"
		K.forceMove(src.loc)
		if(lock)
			lock.is_secured = 0
			lock.store_key(K)
			lock.is_secured = 1
	if(create_description)
		var/obj/item/paper/P = new /obj/item/paper
		P.info = get_paper_description_data()
		P.update_icon()
		P.forceMove(src.loc)

/* Adding item to machine and spawn Set Price dialog */
/obj/machinery/trading_machine/proc/add_item(obj/item/Itm, mob/living/carbon/human/user)
	if(machine_state != STATE_SERVICE)
		return

	if(is_available_category(Itm) && is_acceptable_item_state(Itm))
		var/price = input(usr, "Enter price for " + Itm.name + ".", "Setup Price", basic_price) as null|text
		if(!price)
			return

		content[Itm] = price

		if(istype(Itm.loc, /mob))
			var/mob/M = Itm.loc
			if(!M.dropItemToGround(Itm))
				to_chat(usr, "<span class='warning'>\the [Itm] is stuck to your hand, you cannot put it in \the [src]!</span>")
				return

		Itm.forceMove(src)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You loaded [Itm.name] to vending machine. New price - [content[Itm]] caps..")
		src.ui_interact(usr)
	else
		if(!is_available_category(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, "*beep* ..wrong item.")
		else if (!is_acceptable_item_state(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, item_not_acceptable_message)

/* Check item type and compare it with stored_item_type */
/obj/machinery/trading_machine/proc/is_available_category(obj/item/Itm)
	for(var/item_type in stored_item_type)
		if(istype(Itm, item_type))
			return 1
	return 0

/* Hook for check item parameters */
/obj/machinery/trading_machine/proc/is_acceptable_item_state(obj/item/Itm)
	return 1

/* Remove item from machine. */
/obj/machinery/trading_machine/proc/remove_item(obj/item/ItemToRemove)
	if(content.Remove(ItemToRemove))
		ItemToRemove.forceMove(src.loc)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		src.ui_interact(usr)

/* Adding a caps to caps storage and release vending item. */
/obj/machinery/trading_machine/proc/add_caps(obj/item/I)
	if(machine_state != STATE_VEND)
		return

	if(istype(I, /obj/item/stack/f13Cash/bottle_cap))
		if(I.use(expected_price))
			stored_caps += expected_price
			playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
			to_chat(usr, "You put [expected_price] caps to a vending machine. [vending_item.name] is vended out of it. ")
			remove_item(vending_item)
			set_state(STATE_IDLE)
			onclose(usr, "vending")
		else
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, "Not enough caps.")

/* Spawn all caps on world and clear caps storage */
/obj/machinery/trading_machine/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/f13Cash/bottle_cap/C = new /obj/item/stack/f13Cash/bottle_cap
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ui_interact(usr)

/* Storing item and price and switch machine to vending mode*/
/obj/machinery/trading_machine/proc/vend(obj/item/Itm)
	if(content.Find(Itm))
		vending_item = Itm
		expected_price = text2num(content[Itm])
		set_state(STATE_VEND)
		src.attack_hand(usr)

/* Remove lock from machine */
/obj/machinery/trading_machine/proc/drop_lock()
	if(!lock)
		to_chat(usr, "No lock here.")
		return

	lock.forceMove(loc)
	lock = null
	playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
	src.ui_interact(usr)

/* Assign lock to this machine */
/obj/machinery/trading_machine/proc/set_lock(obj/item/lock_part/newLock)
	if(lock)
		playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
		to_chat(usr, "This machine is already have a lock")
		return
	else
		lock = newLock
		if(usr.dropItemToGround(lock))
			lock.forceMove(src)
			playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
			to_chat(usr, "Lock installed.")
	src.ui_interact(usr)

/* Switch machine to service mode */
/obj/machinery/trading_machine/proc/set_service(var/newMode)
	switch(machine_state)
		if(0)
			if(newMode)
				set_state(STATE_SERVICE)
		if(1)
			if(!newMode)
				set_state(STATE_IDLE)

	if(machine_state == STATE_SERVICE)
		to_chat(usr, "Vending Machine now on service")
	else
		to_chat(usr, "Vending Machine now working")
	src.ui_interact(usr)

/* Update icon depends on machine_state */
/obj/machinery/trading_machine/proc/updateIcon()
	switch(machine_state)
		if(STATE_IDLE)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_SERVICE)
			cut_overlays()
			icon_state = service_icon_state
		if(STATE_VEND)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_LOCKOPEN)
			cut_overlays()
			icon_state = lock_icon_state
			add_overlay(image(icon, "[initial(icon_state)]-panel"))

/* Seting machine state and update icon */
/obj/machinery/trading_machine/proc/set_state(var/new_state)
	if(machine_state == new_state)
		return

	if(new_state == STATE_IDLE && !lock)
		return

	if(!anchored)
		return

	machine_state = new_state
	updateIcon()

/* Attack By */
/obj/machinery/trading_machine/attackby(obj/item/OtherItem, mob/living/carbon/human/user, parameters)
	switch(machine_state)
		if(STATE_IDLE) // working

			/* Vending Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					if(lock.check_key(OtherItem))
						set_service(STATE_SERVICE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock here")

			/* Other */
			else
				attack_hand(user)

		if(STATE_SERVICE) // service

			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_LOCKOPEN)
				playsound(src, 'sound/items/Screwdriver.ogg', 60, 1)

			/* Locker */
			if(istype(OtherItem, /obj/item/lock_part))
				set_lock(OtherItem)
				playsound(src, 'sound/items/Crowbar.ogg', 60, 1)

			/* Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					var/obj/item/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem) || id == used_key.id)
						set_state(STATE_IDLE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock")


			else if(is_available_category(OtherItem))
				add_item(OtherItem, user)

			else
				attack_hand(user)

		if(STATE_VEND) // vending
			// Caps
			if(istype(OtherItem, /obj/item/stack/f13Cash/bottle_cap))
				add_caps(OtherItem)
			else
				attack_hand(user)

		if(STATE_LOCKOPEN)
			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_SERVICE)
				playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)


			/* Wrench */
			else if(istype(OtherItem, /obj/item/wrench))
				if(src.can_be_unfasten_wrench(user))
					var/prev_anchor = anchored
					src.default_unfasten_wrench(user, OtherItem)
					if(anchored != prev_anchor)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)

			/* Crowbar */
			else if(istype(OtherItem, /obj/item/crowbar))
				drop_lock()

			else if(istype(OtherItem, /obj/item/lock_part))
				var/obj/item/lock_part/P = OtherItem
				if(P.is_secured)
					set_lock(OtherItem)
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "You need to secure lock first. Use screwdriver.")

	src.ui_interact(user)

/* Spawn input dialog and set item price */
/obj/machinery/trading_machine/proc/set_price_by_input(obj/item/Itm, mob/user)
	if(machine_state != STATE_SERVICE)
		return

	var/new_price = input(user, "Enter price for " + Itm.name + ".", "Setup Price", content[Itm]) as null|text
	if(new_price)
		content[Itm] = new_price
		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 60, 1)
		src.ui_interact(user)

/* Find item by name and price in content and return type */
/obj/machinery/trading_machine/proc/find_item(var/item_name, var/item_price)
	for(var/obj/item/Itm in content)
		if(content[Itm] == item_price && sanitize(Itm.name) == sanitize(item_name))
			return Itm

/* Attack Hand */
/obj/machinery/trading_machine/attack_hand(mob/user)
	ui_interact(user)

/* Design UI here */
/obj/machinery/trading_machine/ui_interact(mob/user)
	. = ..()
	var/datum/browser/popup = new(user, "vending", (name), 400, 500)
	popup.set_content(get_ui_content(machine_state))
	popup.open()

/obj/machinery/trading_machine/proc/get_ui_content(var/state)
	var/dat = ""
	switch(state)
		// --- Work
		if(STATE_IDLE)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<a href='byond://?src=\ref[src];vend=[item_name];current_price=[price]'>[Itm.name] | [price] caps</a> "
					dat += "<a href='byond://?src=\ref[src];examine=[item_name];current_price=[price]'>Examine</a><br> "

		//--- Service
		if(STATE_SERVICE)
			dat += "<h3>Machine setup menu</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color='green'>Caps stored - [stored_caps]</font>"
			dat += "<a href='?src=\ref[src];removecaps=1'>Unload</a>"
			dat += "<h4> Items </h4> "

			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<b>[Itm.name]</b> - [content[Itm]] caps"
					dat += "<a href='?src=\ref[src];setprice=[item_name];current_price=[price]'>Set price</a> "
					dat += "<a href='?src=\ref[src];remove=[item_name];current_price=[price]'>Remove</a> <br>"

		// --- Vend
		if(STATE_VEND)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color = 'red'>Waiting for [expected_price] caps!</font>"
			dat += "<a href='?src=\ref[src];back=1'> Back</a> "

		// --- Lock Open
		if(STATE_LOCKOPEN)
			dat += ""

	return dat

/obj/machinery/trading_machine/proc/get_paper_description_data()
	var/data
	data += "<h1> Wasteland Wending Machines </h1>"
	data += "Wasteland Trading Company guide."
	return data

/* TOPIC */
/obj/machinery/trading_machine/Topic(href, href_list)
	if(..())
		return

	if(href_list["vend"])
		var/vend_item_name = href_list["vend"]
		var/actual_price = href_list["current_price"]
		to_chat(usr, "Vending [vend_item_name]...")
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			vend(I)

	if(href_list["back"])
		to_chat(usr, "Machine is working")
		src.set_state(STATE_IDLE)
		ui_interact(usr)

	if(href_list["setprice"])
		to_chat(usr, "Set new price...")
		var/vend_item_name = href_list["setprice"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			set_price_by_input(I, usr)

	if(href_list["remove"])
		var/vend_item_name = href_list["remove"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			to_chat(usr, "Unloading item [href_list["unload"]]")
			remove_item(I)

	if(href_list["removecaps"])
		remove_all_caps()

	if(href_list["examine"])
		var/item_name = href_list["examine"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(item_name, actual_price)
		I.examine(usr)

	ui_interact()

/**********************Trading Protectron Vendors**************************/

/obj/machinery/mineral/wasteland_vendor
	name = "Wasteland Vending Machine"
	desc = "Wasteland Vending Machine manned by old reprogrammed RobCo trading protectrons."
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"

	density = TRUE
	use_power = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	can_be_unanchored = FALSE
	layer = 2.9

	var/stored_caps = 0	// store caps
	var/expected_price = 0
	var/list/prize_list = list()  //if you add something to this, please, for the love of god, sort it by price/type. use tabs and not spaces.


/datum/data/wasteland_equipment
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0

/datum/data/wasteland_equipment/New(name, path, cost)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost

/obj/machinery/mineral/wasteland_vendor/ui_interact(mob/user)
	. = ..()
	var/dat
	dat +="<div class='statusDisplay'>"
	dat += "<b>Bottle caps stored:</b> [stored_caps]. <A href='?src=[REF(src)];choice=eject'>Eject caps</A><br>"
	dat += "</div>"
	dat += "<br>"
	dat +="<div class='statusDisplay'>"
	dat += "<b>Currency conversion rates:</b><br>"
	dat += "1 Bottle cap = [CASH_CAP_VENDOR] bottle caps value <br>"
	dat += "1 NCR dollar = [CASH_NCR_VENDOR] bottle caps value <br>"
	dat += "1 Denarius = [CASH_DEN_VENDOR] bottle caps value <br>"
	dat += "1 Aureus = [CASH_AUR_VENDOR] bottle caps value <br>"
	dat += "</div>"
	dat += "<br>"
	dat +="<div class='statusDisplay'>"
	dat += "<b>Vendor goods:</b><BR><table border='0' width='300'>"
	for(var/datum/data/wasteland_equipment/prize in prize_list)
		dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=[REF(src)];purchase=[REF(prize)]'>Purchase</A></td></tr>"
	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup = new(user, "tradingvendor", "Wasteland Vending Machine", 400, 500)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/mineral/wasteland_vendor/Topic(href, href_list)
	if(..())
		return
	if(href_list["choice"] == "eject")
		remove_all_caps()
	if(href_list["purchase"])
		var/datum/data/wasteland_equipment/prize = locate(href_list["purchase"])
		if (!prize || !(prize in prize_list))
			to_chat(usr, "<span class='warning'>Error: Invalid choice!</span>")
			return
		if(prize.cost > stored_caps)
			to_chat(usr, "<span class='warning'>Error: Insufficent bottle caps value for [prize.equipment_name]!</span>")
		else
			stored_caps -= prize.cost
			GLOB.vendor_cash += prize.cost
			to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
			new prize.equipment_path(src.loc)
			SSblackbox.record_feedback("nested tally", "wasteland_equipment_bought", 1, list("[type]", "[prize.equipment_path]"))
	updateUsrDialog()
	return

/obj/machinery/mineral/wasteland_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/f13Cash))
		add_caps(I)
	else
		attack_hand(user)

/* Adding a caps to caps storage and release vending item. */
/obj/machinery/mineral/wasteland_vendor/proc/add_caps(obj/item/I)
	if(istype(I, /obj/item/stack/f13Cash/bottle_cap))
		var/obj/item/stack/f13Cash/bottle_cap/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_CAP_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/ncr))
		var/obj/item/stack/f13Cash/ncr/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_NCR_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/denarius))
		var/obj/item/stack/f13Cash/denarius/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_DEN_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/aureus))
		var/obj/item/stack/f13Cash/aureus/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_AUR_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else
		to_chat(usr, "Invalid currency!")
		return

/* Spawn all caps on world and clear caps storage */
/obj/machinery/mineral/wasteland_vendor/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/f13Cash/bottle_cap/C = new /obj/item/stack/f13Cash/bottle_cap
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ui_interact(usr)


/obj/machinery/mineral/wasteland_vendor/medical
	name = "Med-Tek Vending Machine"
	desc = "A battered prewar vending machine, somehow still stocked with Med-Tek medical supplies."
	icon_state = "med_idle"
	prize_list = list(
//		new /datum/data/wasteland_equipment("Syringe",						/obj/item/reagent_containers/syringe,								10),
		new /datum/data/wasteland_equipment("Empty pill bottle",				/obj/item/storage/pill_bottle,									5),
		new /datum/data/wasteland_equipment("Rad-X pill",					/obj/item/reagent_containers/pill/radx,								15),
		new /datum/data/wasteland_equipment("Bottle of Charcoal",			/obj/item/storage/pill_bottle/charcoal,								50),
		new /datum/data/wasteland_equipment("Super Stimpak",				/obj/item/reagent_containers/hypospray/medipen/stimpak/super,		100),
		new /datum/data/wasteland_equipment("Chemistry for Wastelanders",	/obj/item/book/granter/trait/chemistry,								600)
		)
/obj/machinery/mineral/wasteland_vendor/medical/shitty
	name = "Arktos Pharma Vending Machine"
	desc = "A battered prewar vending machine, filled with off-brand medical junk. Most of it's probably got tetanus."
	icon_state = "custom_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Flask of water",				/obj/item/reagent_containers/food/drinks/flask,						5),
		new /datum/data/wasteland_equipment("Meal Ready to Eat",			/obj/item/reagent_containers/food/snacks/f13/mre,					15),
		new /datum/data/wasteland_equipment("RadAway",						/obj/item/reagent_containers/blood/radaway,							30),
		new /datum/data/wasteland_equipment("Stimpak",						/obj/item/reagent_containers/hypospray/medipen/stimpak,				50),
		new /datum/data/wasteland_equipment("Styptic Powder Spray",			/obj/item/reagent_containers/medspray/styptic,						70),
		new /datum/data/wasteland_equipment("Tin of Mentats",				/obj/item/storage/pill_bottle/chem_tin/mentats,						90)
		)

/obj/machinery/mineral/wasteland_vendor/weapons
	name = "Gun Runners Muniti-fab Mark II"
	desc = "An ancient matter printer, jury-rigged by the Gun Runners to print guns and ammo and accept caps in exchange. This one has the letters 'MKII' spray-painted on the side in red lettering."
	icon_state = "weapon_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("pipe rifle",					/obj/item/gun/ballistic/revolver/pipe_rifle, 						20),
		new /datum/data/wasteland_equipment("varmint rifle",				/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint, 	100),
		new /datum/data/wasteland_equipment("service rifle",				/obj/item/gun/ballistic/automatic/marksman/servicerifle, 			200),
		new /datum/data/wasteland_equipment("single shotgun",				/obj/item/gun/ballistic/revolver/single_shotgun,					50),
		new /datum/data/wasteland_equipment("caravan shotgun",				/obj/item/gun/ballistic/revolver/caravan_shotgun,					80),
		new /datum/data/wasteland_equipment("9mm handgun",					/obj/item/gun/ballistic/automatic/pistol/ninemil,					50),
		new /datum/data/wasteland_equipment(".45 handgun",					/obj/item/gun/ballistic/automatic/pistol/m1911,						75),
		new /datum/data/wasteland_equipment("10mm handgun",					/obj/item/gun/ballistic/automatic/pistol/n99,						125),
		new /datum/data/wasteland_equipment("10mm speedloader",				/obj/item/ammo_box/l10mm,											5),
		new /datum/data/wasteland_equipment("10mm handgun magazine",		/obj/item/ammo_box/magazine/m10mm_adv,								20),
		new /datum/data/wasteland_equipment("12ga junk shell",				/obj/item/ammo_casing/shotgun/improvised,							2),
		new /datum/data/wasteland_equipment("12ga buckshot shell",			/obj/item/ammo_casing/shotgun/buckshot,								10),
		new /datum/data/wasteland_equipment("9mm handgun magazine",			/obj/item/ammo_box/magazine/m9mm,									10),
		new /datum/data/wasteland_equipment(".45 handgun magazine",			/obj/item/ammo_box/magazine/m45,									20),
		new /datum/data/wasteland_equipment("small 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle/small,						20),
		new /datum/data/wasteland_equipment("standard 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle,							50)
		)

/obj/machinery/mineral/wasteland_vendor/weapons/shitty
	name = "Gun Runners Muniti-fab Mark I"
	desc = "An ancient matter printer, jury-rigged by the Gun Runners to print guns and ammo and accept caps in exchange. This one has the letters 'MKI' spray-painted on the side in black lettering."
	icon_state = "weapon_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("pipe rifle",					/obj/item/gun/ballistic/revolver/pipe_rifle, 						20),
		new /datum/data/wasteland_equipment("single shotgun",				/obj/item/gun/ballistic/revolver/single_shotgun,					50),
		new /datum/data/wasteland_equipment("9mm handgun",					/obj/item/gun/ballistic/automatic/pistol/ninemil,					50),
		new /datum/data/wasteland_equipment("10mm speedloader",				/obj/item/ammo_box/l10mm,											5),
		new /datum/data/wasteland_equipment("12ga junk shell",				/obj/item/ammo_casing/shotgun/improvised,							2),
		new /datum/data/wasteland_equipment("12ga buckshot shell",			/obj/item/ammo_casing/shotgun/buckshot,								10),
		new /datum/data/wasteland_equipment("9mm handgun magazine",			/obj/item/ammo_box/magazine/m9mm,									10)
		)

/obj/machinery/mineral/wasteland_vendor/ammo
	name = "Gun Runners Bullet-synth"
	desc = "An ancient matter printer, jury-rigged by the Gun Runners to print ammo in bulk in exchange for caps. This one has a green bullet spray-painted on the side."
	icon_state = "ammo_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment(".45 handgun magazine",			/obj/item/ammo_box/magazine/m45,									10),
		new /datum/data/wasteland_equipment("9mm handgun magazine)",		/obj/item/ammo_box/magazine/m9mm,									5),
		new /datum/data/wasteland_equipment("10mm handgun magazine",		/obj/item/ammo_box/magazine/m10mm_adv,								10),
		new /datum/data/wasteland_equipment("10mm speedloader",				/obj/item/ammo_box/l10mm,											2),
		new /datum/data/wasteland_equipment(".357 speedloader",				/obj/item/ammo_box/a357,											5),
		new /datum/data/wasteland_equipment(".44 speedloader",				/obj/item/ammo_box/m44,												10),
		new /datum/data/wasteland_equipment(".38 speedloader",				/obj/item/ammo_box/c38,												2),
		new /datum/data/wasteland_equipment("small 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle/small,						10),
		new /datum/data/wasteland_equipment("standard 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle,							25),
		new /datum/data/wasteland_equipment("box of .45 ammunition",		/obj/item/ammo_box/c45,													20),
		new /datum/data/wasteland_equipment("box of 9mm ammunition",		/obj/item/ammo_box/c9mm,												10),
		new /datum/data/wasteland_equipment("box of 10mm ammunition",		/obj/item/ammo_box/c10mm,												15),
		new /datum/data/wasteland_equipment("box of .357 ammunition",		/obj/item/ammo_box/a357box,												30),
		new /datum/data/wasteland_equipment("box of 5.56mm ammunition",		/obj/item/ammo_box/a556,												30)
		)

/obj/machinery/mineral/wasteland_vendor/clothing
	name = "Lady Frumperton's Fashion Vending Machine"
	desc = "A rusty vending machine labeled with the faded logo of an obscure, low-cost prewar clothing company."
	icon_state = "armor_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Waistcoat",					/obj/item/clothing/accessory/waistcoat,								5),
		new /datum/data/wasteland_equipment("Bandage dress",				/obj/item/clothing/under/f13/erpdress,								8),
		new /datum/data/wasteland_equipment("Classy dress",					/obj/item/clothing/under/f13/classdress,							12),
		new /datum/data/wasteland_equipment("White Dress",					/obj/item/clothing/suit/whitedress,									15),
		new /datum/data/wasteland_equipment("Loanshark outfit",				/obj/item/clothing/under/f13/sleazeball,							18),
		new /datum/data/wasteland_equipment("Bowler Hat",					/obj/item/clothing/head/bowler,										20),
		new /datum/data/wasteland_equipment("Psychologist's turtleneck",	/obj/item/clothing/under/f13/psychologist,							24),
		new /datum/data/wasteland_equipment("Kitty headband",				/obj/item/clothing/head/simplekitty,								25),
		new /datum/data/wasteland_equipment("Armor kit",					/obj/item/clothing/suit/armor/f13/punk,								25),
		new /datum/data/wasteland_equipment("Dusty garb",					/obj/item/clothing/under/f13/ranger,								40),
		new /datum/data/wasteland_equipment("Officer's uniform",			/obj/item/clothing/under/f13/navyofficer,							120),
		new /datum/data/wasteland_equipment("Desert Battle Uniform",		/obj/item/clothing/under/f13/dbdu,									240),
		new /datum/data/wasteland_equipment("Bodyguard's outfit",			/obj/item/clothing/under/f13/bodyguard,								300),
		new /datum/data/wasteland_equipment("Advanced Armor and You",		/obj/item/book/granter/trait/pa_wear,								600),
		new /datum/data/wasteland_equipment("Gunsmithing for dummies",			/obj/item/book/granter/trait/gunsmith,							600),
		)

/obj/machinery/mineral/wasteland_vendor/general
	name = "Wasteland Vending Machine"
	desc = "A crappy vending machine filled with junk. Who even put this here?"
	icon_state = "trade_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Drinking glass",				/obj/item/reagent_containers/food/drinks/drinkingglass,				5),
		new /datum/data/wasteland_equipment("Zippo",						/obj/item/lighter,													20),
		new /datum/data/wasteland_equipment("Explorer satchel",				/obj/item/storage/backpack/satchel/explorer,						25),
		new /datum/data/wasteland_equipment("Spray bottle",					/obj/item/reagent_containers/spray,									35),
		new /datum/data/wasteland_equipment("Bottle of E-Z-Nutrient",		/obj/item/reagent_containers/glass/bottle/nutrient/ez,				40),
		new /datum/data/wasteland_equipment("Craftsmanship Monthly",		/obj/item/book/granter/trait/techno,								600),
		)

/obj/machinery/mineral/wasteland_vendor/camp
	name = "Vault-Tec Camp-O-Vend (tm)"
	desc = "Compressed matter in pill-form. Do not swallow!"
	icon_state = "generic_idle"
	prize_list = list(
//		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Expanded Edition",		/obj/item/survivalcapsule/quad,							150),
//		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Farm-N-Go Edition",		/obj/item/survivalcapsule/farm,							200),
//		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Occult Edition",		/obj/item/survivalcapsule/fortuneteller,				125),
//		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Ultra-Deluxe Edition",	/obj/item/survivalcapsule/super_deluxe,					600),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Basic Edition",			/obj/item/survivalcapsule,								50),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Premium Edition",		/obj/item/survivalcapsule/premium,						250),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Merchant Edition",		/obj/item/survivalcapsule/merchant,						300),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Smithery Edition",		/obj/item/survivalcapsule/blacksmith,					400),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Party-Tent Edition",	/obj/item/survivalcapsule/party,						450),
		new /datum/data/wasteland_equipment("Vault-Tec C.A.M.P. Mess-Hall Edition",		/obj/item/survivalcapsule/kitchen,						450),
		new /datum/data/wasteland_equipment("Keep your C.A.M.P. Clean: Trashbag",		/obj/item/storage/bag/trash,							30),
		new /datum/data/wasteland_equipment("Keep your C.A.M.P. Clean: Soap",			/obj/item/soap/homemade,								25)
		)
/obj/machinery/mineral/wasteland_vendor/pipboy
	name = "Wasteland Pip-N-Walk"
	desc = "A prewar vending machine tightly stocked with possibly millions of Pip-boys. How do they all get in there? Nobody knows."
	icon_state = "generic_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Pip-boy 3000",			/obj/item/pda,																150),
		new /datum/data/wasteland_equipment("Reprogrammable ID",	/obj/item/card/id/selfassign,												100),
		new /datum/data/wasteland_equipment("E.N.H.A.N.C.E. Your Pip-boy: Reagent Scanner",	/obj/item/cartridge/chemistry,						50),
		new /datum/data/wasteland_equipment("E.N.H.A.N.C.E. Your Pip-boy: Health Scanner",	/obj/item/cartridge/medical,						50),
		new /datum/data/wasteland_equipment("E.N.H.A.N.C.E. Your Pip-boy: Signaler",	/obj/item/cartridge/signal,								50),
		)

/obj/machinery/mineral/wasteland_vendor/special
	name = "Ticknor & Fields Publishing Vendor"
	desc = "Apparently, at some point in time books were popular enough to be kept in vending machines. This one's labeled with a local publisher."
	icon_state = "liberationstation_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Ranger's Guide to the Wasteland",	/obj/item/book/granter/trait/trekking,							400),
		new /datum/data/wasteland_equipment("Guns and Bullets, Part 4",			/obj/item/book/granter/trait/gunsmith_four, 					400),
		new /datum/data/wasteland_equipment("Craftsmanship Monthly",			/obj/item/book/granter/trait/techno,							600),
		new /datum/data/wasteland_equipment("Gunsmithing for dummies",			/obj/item/book/granter/trait/gunsmith,							600),
		new /datum/data/wasteland_equipment("Advanced Armor and You",			/obj/item/book/granter/trait/pa_wear,							600),
		)

/obj/machinery/mineral/wasteland_vendor/advcomponents
	name = "ArmCo Components Vending Machine"
	desc = "A vending machine filled with parts for crafting various things, labeled with a faded prewar ArmCo logo."
	icon_state = "components_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Advanced Modular Receiver",		/obj/item/advanced_crafting_components/receiver,					150),
		new /datum/data/wasteland_equipment("Weapon Assembly",					/obj/item/advanced_crafting_components/assembly,					150),
		new /datum/data/wasteland_equipment("Superconductor Coils",				/obj/item/advanced_crafting_components/conductors/super,					150),
		new /datum/data/wasteland_equipment("Focused crystal lenses",			/obj/item/advanced_crafting_components/lenses,						150),
		new /datum/data/wasteland_equipment("Flux capacitator",					/obj/item/advanced_crafting_components/capacitor/flux,						150),
		new /datum/data/wasteland_equipment("Light Alloys",				/obj/item/advanced_crafting_components/alloys,						150),
		new /datum/data/wasteland_equipment("Energy Rifle Frame",				/obj/item/prefabs/complex/energy/frame/rifle, 						100),
		new /datum/data/wasteland_equipment("Energy Pistol Frame",				/obj/item/prefabs/complex/energy/frame/pistol,						100),
		new /datum/data/wasteland_equipment("Barrel",							/obj/item/prefabs/complex/barrel, 									25),
		new /datum/data/wasteland_equipment("Short Barrel",						/obj/item/prefabs/complex/barrel/short, 							50),
		new /datum/data/wasteland_equipment("Medium Barrel",					/obj/item/prefabs/complex/barrel/medium, 							100),
		new /datum/data/wasteland_equipment("Long Barrel",						/obj/item/prefabs/complex/barrel/long, 								200),
		new /datum/data/wasteland_equipment("Dual Barrel",						/obj/item/prefabs/complex/barrel/dual, 								300),
		new /datum/data/wasteland_equipment("Simple Action",					/obj/item/prefabs/complex/action/simple, 							50),
		new /datum/data/wasteland_equipment("Automatic Action",					/obj/item/prefabs/complex/action/auto, 								100),
		new /datum/data/wasteland_equipment("Automatic Burst Action",			/obj/item/prefabs/complex/action/autoburst, 						200),
		new /datum/data/wasteland_equipment("Rapid Blowback Action",			/obj/item/prefabs/complex/action/rapid, 							300),
		new /datum/data/wasteland_equipment("EC Adapter",						/obj/item/prefabs/complex/ecell/ec, 								50),
		new /datum/data/wasteland_equipment("MFC Adapter",						/obj/item/prefabs/complex/ecell/mfc, 								100),
		new /datum/data/wasteland_equipment("ECP Adapter",						/obj/item/prefabs/complex/ecell/ecp, 								150),
		new /datum/data/wasteland_equipment("Single Stream",					/obj/item/prefabs/complex/eburst/simple, 							100),
		new /datum/data/wasteland_equipment("Dual Stream",						/obj/item/prefabs/complex/eburst/dual, 								200),
		new /datum/data/wasteland_equipment("Fast Dual Stream",					/obj/item/prefabs/complex/eburst/fast, 								300),
		new /datum/data/wasteland_equipment("Triple Stream",					/obj/item/prefabs/complex/eburst/triple, 							300),
		new /datum/data/wasteland_equipment("Improved Weapon Frame",			/obj/item/prefabs/complex/WeaponFrame/improved, 					300),
		new /datum/data/wasteland_equipment("Masterwork Weapon Frame",			/obj/item/prefabs/complex/WeaponFrame/masterwork, 					500),

		)

/obj/machinery/mineral/wasteland_vendor/attachments
	name = "Long Branch Arsenal Attachments Vendor"
	desc = "A prewar vending machine in remarkably good shape. It's loaded down with firearm attachments."
	icon_state = "parts_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Weapon Optics",				/obj/item/attachments/scope,									150),
		new /datum/data/wasteland_equipment("Recoil Compensator",			/obj/item/attachments/recoil_decrease,							100),
		new /datum/data/wasteland_equipment("Improved Barrel",				/obj/item/attachments/bullet_speed,								100),
		new /datum/data/wasteland_equipment("Burst Cam",					/obj/item/attachments/burst_improvement,						200)
		)

/obj/machinery/mineral/wasteland_vendor/crafting
	name = "Sunnyfield Construction Vending Machine"
	desc = "A vending machine loaded down with raw materials and various parts. Sadly, it's impossible to break in and steal it all."
	icon_state = "trade_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("High Quality Parts",				/obj/item/stack/crafting/goodparts,									50),
		new /datum/data/wasteland_equipment("Metal Parts",						/obj/item/stack/crafting/metalparts,								10),
		new /datum/data/wasteland_equipment("Electronic Parts",					/obj/item/stack/crafting/electronicparts,							5),
		new /datum/data/wasteland_equipment("Metal Sheets x 20",				/obj/item/stack/sheet/metal/twenty,									50),
		new /datum/data/wasteland_equipment("Metal Sheets x 50",				/obj/item/stack/sheet/metal/fifty,									115),
		new /datum/data/wasteland_equipment("Glass Sheets x 10",				/obj/item/stack/sheet/glass/ten,									30),
		new /datum/data/wasteland_equipment("Glass Sheets x 50",				/obj/item/stack/sheet/glass/fifty,									90)
		)

/obj/machinery/mineral/wasteland_vendor/mining
	name = "Quincy Quarries Mining Vendor"
	desc = "A commonly-found machine wherever mining is to be done, maintained by the Quincy Quarry company."
	icon_state = "mining_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Pickaxe",					/obj/item/pickaxe,											25),
		new /datum/data/wasteland_equipment("Mining drill",				/obj/item/pickaxe/drill,									100),
		new /datum/data/wasteland_equipment("Manual mining scanner",	/obj/item/mining_scanner,									25),
		new /datum/data/wasteland_equipment("Automatic mining scanner",	/obj/item/t_scanner/adv_mining_scanner/lesser,				150),
		new /datum/data/wasteland_equipment("Advanced mining scanner",	/obj/item/t_scanner/adv_mining_scanner,						300),
		new /datum/data/wasteland_equipment("Proto-kinetic crusher",	/obj/item/twohanded/required/kinetic_crusher,				1000),
		new /datum/data/wasteland_equipment("ORM Board",				/obj/item/circuitboard/machine/ore_redemption,				150)
		)
		
		
// admin vendors, not for actual use by players

/obj/machinery/mineral/wasteland_vendor/admin
	name = "Brown Caravan Company Gen-fab"
	desc = "A well-maintained matter fabricator bearing a small, unfamilar logo. This one has the words 'GENERAL GOODS' printed across the front."
	icon_state = "generic_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("economy-sized Cram",		/obj/item/reagent_containers/food/snacks/f13/cram/large,	0),
		new /datum/data/wasteland_equipment("economy-sized BlamCo Mac-n-Cheese",	/obj/item/reagent_containers/food/snacks/f13/blamco/large,	0),
		new /datum/data/wasteland_equipment("Nuka-Cola",				/obj/item/reagent_containers/food/drinks/bottle/f13nukacola,	0),
		new /datum/data/wasteland_equipment("Sunset Sarsparilla",		/obj/item/reagent_containers/food/drinks/bottle/sunset ,		0),
		new /datum/data/wasteland_equipment("stimpak",					/obj/item/reagent_containers/hypospray/medipen/stimpak,			0),
		new /datum/data/wasteland_equipment("super stimpak",			/obj/item/reagent_containers/hypospray/medipen/stimpak/super,	0),
		new /datum/data/wasteland_equipment("RadAway",					/obj/item/reagent_containers/blood/radaway,						0),
		new /datum/data/wasteland_equipment("high-quality scrap metal",	/obj/item/stack/crafting/goodparts,								0),
		new /datum/data/wasteland_equipment("scrap metal",				/obj/item/stack/crafting/metalparts,							0),
		new /datum/data/wasteland_equipment("electronic scrap",			/obj/item/stack/crafting/electronicparts,						0),
		new /datum/data/wasteland_equipment("metal sheets",				/obj/item/stack/sheet/metal/fifty,								0),
		new /datum/data/wasteland_equipment("glass sheets",				/obj/item/stack/sheet/glass/fifty,								0),
		new /datum/data/wasteland_equipment("Pip-Boy",					/obj/item/pda,													0)
		)
		
/obj/machinery/mineral/wasteland_vendor/admin/armor
	name = "Brown Caravan Company Armorer"
	desc = "A well-maintained matter fabricator bearing a small, unfamilar logo. This one has the words 'ARMOR' printed across the front."
	icon_state = "generic_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("basic armor kit",				/obj/item/clothing/suit/armor/f13/kit,						0),
		new /datum/data/wasteland_equipment("leather jacket",				/obj/item/clothing/suit/armor/f13/leather_jacket,			0),
		new /datum/data/wasteland_equipment("reinforced leather jacket",	/obj/item/clothing/suit/armor/f13/leather_jacket/combat,	0),
		new /datum/data/wasteland_equipment("leather armor",				/obj/item/clothing/suit/armor/f13/leatherarmor,				0),
		new /datum/data/wasteland_equipment("advanced leather armor",		/obj/item/clothing/suit/armor/f13/leatherarmor/reinforced,	0),
		new /datum/data/wasteland_equipment("security vest",				/obj/item/clothing/suit/armor/vest,							0),
		new /datum/data/wasteland_equipment("security helmet",				/obj/item/clothing/head/helmet,								0),
		new /datum/data/wasteland_equipment("metal armor",					/obj/item/clothing/suit/armor/f13/metalarmor,				0),
		new /datum/data/wasteland_equipment("metal helmet",					/obj/item/clothing/head/helmet/f13/metalmask,				0),
		new /datum/data/wasteland_equipment("advanced metal armor",			/obj/item/clothing/suit/armor/f13/metalarmor/reinforced,	0),
		new /datum/data/wasteland_equipment("advanced metal helmet",		/obj/item/clothing/head/helmet/f13/metalmask/mk2,			0),
		new /datum/data/wasteland_equipment("combat armor",					/obj/item/clothing/suit/armor/f13/combat,					0),
		new /datum/data/wasteland_equipment("combat helmet",				/obj/item/clothing/head/helmet/f13/combat,					0),
		new /datum/data/wasteland_equipment("advanced combat armor",		/obj/item/clothing/suit/armor/f13/combat/mk2,				0),
		new /datum/data/wasteland_equipment("advanced combat helmet",		/obj/item/clothing/head/helmet/f13/combat/mk2,				0),
		new /datum/data/wasteland_equipment("elite riot armor",				/obj/item/clothing/suit/armor/f13/rangercombat/eliteriot/reclaimed,		0),
		new /datum/data/wasteland_equipment("elite riot helmet",			/obj/item/clothing/head/helmet/f13/rangercombat/eliteriot/reclaimed,	0),
		new /datum/data/wasteland_equipment("T45b PA suit",		/obj/item/clothing/suit/armor/f13/power_armor/t45b,						0),
		new /datum/data/wasteland_equipment("T45b PA helmet",	/obj/item/clothing/head/helmet/f13/power_armor/t45b,					0),
		new /datum/data/wasteland_equipment("T45d PA suit",		/obj/item/clothing/suit/armor/f13/power_armor/t45d,						0),
		new /datum/data/wasteland_equipment("T45d PA helmet",	/obj/item/clothing/head/helmet/f13/power_armor/t45d,					0),
		new /datum/data/wasteland_equipment("T60a PA suit",		/obj/item/clothing/suit/armor/f13/power_armor/t60,						0),
		new /datum/data/wasteland_equipment("T60a PA helmet",	/obj/item/clothing/head/helmet/f13/power_armor/t60,						0),
		new /datum/data/wasteland_equipment("X03a PA suit",		/obj/item/clothing/suit/armor/f13/power_armor/advanced,					0),
		new /datum/data/wasteland_equipment("X03a PA helmet",	/obj/item/clothing/head/helmet/f13/power_armor/advanced,				0),
		new /datum/data/wasteland_equipment("X03b PA suit",		/obj/item/clothing/suit/armor/f13/power_armor/advanced/mk2,				0),
		new /datum/data/wasteland_equipment("X03b PA helmet",	/obj/item/clothing/head/helmet/f13/power_armor/advanced/mk2,			0),
		new /datum/data/wasteland_equipment("Power Armor Manual",	/obj/item/book/granter/trait/pa_wear,								0)
		)
		
/obj/machinery/mineral/wasteland_vendor/admin/weapons
	name = "Brown Caravan Company Weaponsmith"
	desc = "A well-maintained matter fabricator bearing a small, unfamilar logo. This one has the words 'WEAPONRY' printed across the front."
	icon_state = "generic_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("pipe rifle",					/obj/item/gun/ballistic/revolver/pipe_rifle, 						0),
		new /datum/data/wasteland_equipment("varmint rifle",				/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint, 	0),
		new /datum/data/wasteland_equipment("service rifle",				/obj/item/gun/ballistic/automatic/marksman/servicerifle, 			0),
		new /datum/data/wasteland_equipment("brush gun",					/obj/item/gun/ballistic/shotgun/automatic/hunting/brush,			0),
		new /datum/data/wasteland_equipment("hunting rifle",				/obj/item/gun/ballistic/shotgun/remington,							0),
		new /datum/data/wasteland_equipment("cowboy repeater",				/obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy,			0),
		new /datum/data/wasteland_equipment("trail carbine",				/obj/item/gun/ballistic/shotgun/automatic/hunting/trail,			0),
		new /datum/data/wasteland_equipment("karabiner 98k",				/obj/item/gun/ballistic/shotgun/ww2rifle,							0),
		new /datum/data/wasteland_equipment("single shotgun",				/obj/item/gun/ballistic/revolver/single_shotgun,					0),
		new /datum/data/wasteland_equipment("caravan shotgun",				/obj/item/gun/ballistic/revolver/caravan_shotgun,					0),
		new /datum/data/wasteland_equipment("hunting shotgun",				/obj/item/gun/ballistic/shotgun/hunting,							0),
		new /datum/data/wasteland_equipment("trench shotgun",				/obj/item/gun/ballistic/shotgun/trench,								0),
		new /datum/data/wasteland_equipment("combat shotgun",				/obj/item/gun/ballistic/shotgun/automatic/combat,					0),
		new /datum/data/wasteland_equipment("9mm handgun",					/obj/item/gun/ballistic/automatic/pistol/ninemil,					0),
		new /datum/data/wasteland_equipment(".45 handgun",					/obj/item/gun/ballistic/automatic/pistol/m1911,						0),
		new /datum/data/wasteland_equipment("10mm handgun",					/obj/item/gun/ballistic/automatic/pistol/n99,						0),
		new /datum/data/wasteland_equipment("laser pistol",					/obj/item/gun/energy/laser/pistol, 									0),
		new /datum/data/wasteland_equipment("laser rifle",					/obj/item/gun/energy/laser/aer9, 									0),
		new /datum/data/wasteland_equipment("advanced laser rifle",			/obj/item/gun/energy/laser/aer14, 									0),
		new /datum/data/wasteland_equipment("plasma pistol",				/obj/item/gun/energy/laser/plasma/pistol, 							0),
		new /datum/data/wasteland_equipment("plasma rifle",					/obj/item/gun/energy/laser/plasma, 									0),
		new /datum/data/wasteland_equipment("plasma carbine",				/obj/item/gun/energy/laser/plasma/carbine, 							0),
		new /datum/data/wasteland_equipment("10mm speedloader",				/obj/item/ammo_box/l10mm,											0),
		new /datum/data/wasteland_equipment("10mm handgun magazine",		/obj/item/ammo_box/magazine/m10mm_adv,								0),
		new /datum/data/wasteland_equipment("12ga junk shell",				/obj/item/ammo_casing/shotgun/improvised,							0),
		new /datum/data/wasteland_equipment("12ga buckshot shell",			/obj/item/ammo_casing/shotgun/buckshot,								0),
		new /datum/data/wasteland_equipment("12ga slug shell",				/obj/item/ammo_casing/shotgun,										0),
		new /datum/data/wasteland_equipment("12ga riot shell",				/obj/item/ammo_casing/shotgun/rubbershot,							0),
		new /datum/data/wasteland_equipment("12ga pulse shell",				/obj/item/ammo_casing/shotgun/pulseslug,							0),
		new /datum/data/wasteland_equipment("12ga meteor shell",			/obj/item/ammo_casing/shotgun/meteorslug,							0),
		new /datum/data/wasteland_equipment("12ga laser shell",				/obj/item/ammo_casing/shotgun/laserslug,							0),
		new /datum/data/wasteland_equipment("12ga incendiary shell",		/obj/item/ammo_casing/shotgun/incendiary,							0),
		new /datum/data/wasteland_equipment("12ga dragonsbreath shell",		/obj/item/ammo_casing/shotgun/dragonsbreath,						0),
		new /datum/data/wasteland_equipment("9mm handgun magazine",			/obj/item/ammo_box/magazine/m9mm,									0),
		new /datum/data/wasteland_equipment(".45 handgun magazine",			/obj/item/ammo_box/magazine/m45,									0),
		new /datum/data/wasteland_equipment("small 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle/small,						0),
		new /datum/data/wasteland_equipment("standard 5.56mm rifle magazine",	/obj/item/ammo_box/magazine/m556/rifle,							0),
		new /datum/data/wasteland_equipment(".357 speedloader",				/obj/item/ammo_box/a357,											0),
		new /datum/data/wasteland_equipment(".44 speedloader",				/obj/item/ammo_box/m44,												0),
		new /datum/data/wasteland_equipment(".38 speedloader",				/obj/item/ammo_box/c38,												0),
		new /datum/data/wasteland_equipment(".308 stripper clip",			/obj/item/ammo_box/a308,											0),
		new /datum/data/wasteland_equipment(".45-70 speedloader",			/obj/item/ammo_box/c4570,											0),
		new /datum/data/wasteland_equipment("microfusion cell",				/obj/item/stock_parts/cell/ammo/mfc, 								0),
		new /datum/data/wasteland_equipment("energy cell",					/obj/item/stock_parts/cell/ammo/ec, 								0),
		new /datum/data/wasteland_equipment("box of .45 ammunition",		/obj/item/ammo_box/c45,												0),
		new /datum/data/wasteland_equipment("box of 9mm ammunition",		/obj/item/ammo_box/c9mm,											0),
		new /datum/data/wasteland_equipment("box of 10mm ammunition",		/obj/item/ammo_box/c10mm,											0),
		new /datum/data/wasteland_equipment("box of .308 ammunition",		/obj/item/ammo_box/a308box,											0),
		new /datum/data/wasteland_equipment("box of .45-70 ammunition",		/obj/item/ammo_box/c4570box,										0),
		new /datum/data/wasteland_equipment("box of .357 ammunition",		/obj/item/ammo_box/a357box,											0),
		new /datum/data/wasteland_equipment("box of 5.56mm ammunition",		/obj/item/ammo_box/a556,											0)
		)

#undef STATE_IDLE
#undef STATE_SERVICE
#undef STATE_VEND
#undef STATE_LOCKOPEN
#undef CASH_CAP_VENDOR
#undef CASH_AUR_VENDOR
#undef CASH_DEN_VENDOR
#undef CASH_NCR_VENDOR
