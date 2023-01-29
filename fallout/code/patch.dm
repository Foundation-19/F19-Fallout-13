/*

FALLOUT HEALING ITEMS OVERVIEW
Some sort of summary, its a bit of a mess.

/obj/item/reagent_containers/pill/patch/healingpowder // 50hp over 50 seconds.
/obj/item/reagent_containers/pill/patch/healpoultice // 100hp over 50 seconds. a bit more potent than just bitters.
/obj/item/reagent_containers/pill/bitterdrink // 50hp over 25 seconds.
/obj/item/reagent_containers/pill/consumable/hydra // heals a bit but only when mob has a wound. Can be used on dislocated limbs.
/obj/item/reagent_containers/hypospray/medipen/stimpak // 20hp instantly, plus 30hp over 20 seconds.
/obj/item/reagent_containers/hypospray/medipen/stimpak/super // 50hp instantly, plus 50hp over 20 seconds.
/obj/item/stack/medical/mourning_dust //10 hp per application, seems to heal up to 2 body parts tho so possibly 20. In concept its pretty similar to suture, stackable, modest healing per application.
then you got sutures, medical mesh and whatever else

It would probably be a good move to look over pathing at some point, or adjust some storage items like pill bottles, since a literal bandaid and a whole bottle of something being
the same category causes some minor issues in consistency. Trying to sort out the logic in pathing, see below

pill/patch - applied topically, mask isn't a problem
pill - swallowed, mouth must be accessible (so worse than above I guess) but can be stored in pill bottles and whatnot
pill/consumable - as pill but a lot larger item, so suitable to blacklist for stuff like pill bottles

Problem children are Jet and Turbo, obviously theyre some kind of vape stuff you should suck in with your mouth, but theyre patches.
*/


/obj/item/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	inhand_icon_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30		// three seconds
	dissolvable = FALSE

/obj/item/reagent_containers/pill/patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, span_warning("The limb is missing!"))
			return
		//if(!L.can_inject(user, TRUE, user.zone_selected, FALSE, TRUE)) //stopped by clothing, not by species immunity.
			//return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, span_notice("Medicine won't work on a robotic limb!"))
			return
	..()

/obj/item/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/styptic_powder = 20)
	icon_state = "bandaid_brute"

/obj/item/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/silver_sulfadiazine = 20)
	icon_state = "bandaid_burn"

/obj/item/reagent_containers/pill/patch/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "pouch")


// ---------------------------------
// JET

/obj/item/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "A highly addictive meta-amphetamine that produces a fast-acting, intense euphoric high on the user."
	list_reagents = list(/datum/reagent/drug/jet = 10)
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_jet"


// ---------------------------------
// TURBO

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_turbo"
	list_reagents = list(/datum/reagent/drug/turbo = 5)


// ---------------------------------
// HEALING POWDER

/obj/item/reagent_containers/pill/patch/healingpowder // 50hp over 50 seconds.
	name = "Healing powder"
	desc = "A powder used to heal physical wounds derived from ground broc flowers and xander roots, commonly used by tribals."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	list_reagents = list(/datum/reagent/medicine/healing_powder = 10)
	self_delay = 5

// ---------------------------------
// CUSTOM POWDER

/obj/item/reagent_containers/pill/patch/healingpowder/custom
	name = "Homebrew powder"
	desc = "A mysterious mix of powders."
	list_reagents = null
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	self_delay = 5
	color = COLOR_PALE_GREEN_GRAY

// ---------------------------------
// HEALING POULTICE

/obj/item/reagent_containers/pill/patch/healpoultice // 100hp over 50 seconds. a bit more potent than just bitters.
	name = "Healing poultice"
	desc = "A concoction of broc flower, cave fungus, agrave fruit and xander root."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/healing_powder/poultice = 10, /datum/reagent/medicine/healing_powder = 10, /datum/reagent/medicine/bicaridine = 5, /datum/reagent/medicine/kelotane = 5)
	icon_state = "patch_healingpoultice"
	self_delay = 5

// ---------------------------------
// BITTER DRINK

/obj/item/reagent_containers/pill/bitterdrink  // 50hp over 25 seconds
	name = "Bitter drink"
	desc = "A strong herbal healing concoction invented and created by the Twin Mothers tribe."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_bitterdrink"
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 10, /datum/reagent/medicine/bicaridine = 5, /datum/reagent/medicine/kelotane = 5)
	self_delay = 5

// ---------------------------------
// HYDRA - never a thing, make it something. Sprites done.

/obj/item/reagent_containers/pill/consumable/hydra
	name = "Hydra"
	desc = "Hydra is a vile medicine made from fermented fungus and rad-scorpion venom mostly. For dislocated limbs rubbing it directly on the joint works best, but if one drinks it instead it will just boost the natural healing process of the body, curiously enough the effect is more noticeable the worse the trauma, requiring serious wounds to be useful."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_hydra"
	list_reagents = list(/datum/reagent/medicine/hydra = 10)

