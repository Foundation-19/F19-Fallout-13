/////////////
// FALLOUT //
/////////////

/obj/item/storage/pill_bottle/chem_tin/
	name = "chem tin"
	desc = "A branded tin made to hold ingestable chems."

/obj/item/storage/pill_bottle/chem_tin/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.allow_quick_gather = TRUE
	STR.click_gather = TRUE
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/pill, /obj/item/reagent_containers/syringe, /obj/item/dice))

// ---------------------------------------------
// MENTAT TIN

/obj/item/storage/pill_bottle/chem_tin/mentats
	name = "Mentats tin"
	icon = 'fallout/icons/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_mentats"
	desc = "Contains pills used to increase intelligence and perception."

/obj/item/storage/pill_bottle/chem_tin/mentats/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/mentat(src)

// ---------------------------------------------
// FIXER TIN

/obj/item/storage/pill_bottle/chem_tin/fixer
	name = "Fixer tin"
	icon = 'fallout/icons/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_fixer"
	desc = "Contains pills used to treat addiction and overdose on other chems."

/obj/item/storage/pill_bottle/chem_tin/fixer/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/fixer(src)

// ---------------------------------------------
// RAD-X PILL BOTTLE

/obj/item/storage/pill_bottle/chem_tin/radx
	name = "Rad-X bottle"
	icon = 'fallout/icons/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_radx"
	desc = "Contains pills that prevent radiation buildup, totally shielding the user at high doses. Does not treat radiation sickness, best taken before exposure."

/obj/item/storage/pill_bottle/chem_tin/radx/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/radx(src)

// ---------------------------------------------
// BUFFOUT PILL BOTTLE

/obj/item/storage/pill_bottle/chem_tin/buffout
	name = "Buffout bottle"
	icon = 'fallout/icons/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_buffout"
	desc = "Contains pills used to increase muscle mass."

/obj/item/storage/pill_bottle/chem_tin/buffout/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/buffout(src)

///
// ---------------------------------------------
// PURIFICATION PILL BOTTLE

/obj/item/storage/pill_bottle/chem_tin/waterpurification
	name = "bottle of water purifying pills"
	icon = 'fallout/icons/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_purify"
	desc = "Contains pills to treat water."

/obj/item/storage/pill_bottle/chem_tin/waterpurification/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/reagent_containers/pill/purify(src)

///
