///////////////////
// FALLOUT HYPOS //
///////////////////

/obj/item/reagent_containers/hypospray/medipen/stimpak // 20hp instantly, plus 30hp over 20 seconds. stims in fallout contain a whole cocktail of chems, and this mix prevents them from stacking with healing powder and bitter drink.
	name = "stimpak"
	desc = "A handheld delivery system for medicine, used to rapidly heal physical damage to the body."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "hypo_stimpak"
	custom_price = PRICE_STIMPAK
	syringe_self_delay = 10 //Double of a powder
	volume = 15
	amount_per_transfer_from_this = 15
	reagent_flags = DRAWABLE
	list_reagents = list(/datum/reagent/medicine/stimpak = 15)

/obj/item/reagent_containers/hypospray/medipen/stimpak/on_reagent_change(changetype)
	update_icon()

/obj/item/reagent_containers/hypospray/medipen/stimpak/update_overlays()
	. = ..()
	var/mutable_appearance/stimpak_overlay = mutable_appearance('icons/obj/reagentfillings.dmi', "stim", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += stimpak_overlay

/obj/item/reagent_containers/hypospray/medipen/stimpak/custom
	desc = "A handheld delivery system for medicine, this particular one will deliver a tailored cocktail."
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = null

/obj/item/reagent_containers/hypospray/medipen/stimpak/epipak
	name = "epipak"
	desc = "A rapid and safe way to stabilize patients in critical condition for personnel without advanced medical knowledge. Contains a powerful antiseptic that can help fight infections."
	amount_per_transfer_from_this = 15
	volume = 15
	list_reagents = list(/datum/reagent/medicine/epinephrine = 10, /datum/reagent/medicine/spaceacillin = 3, /datum/reagent/medicine/coagulant = 2)

// ---------------------------------
// SUPER STIMPAK

/obj/item/reagent_containers/hypospray/medipen/stimpak/super // 50hp instantly, plus 50hp over 20 seconds.
	name = "super stimpak"
	desc = "The super version comes in a hypodermic, but with an additional vial containing more powerful drugs than the basic model and a leather belt to strap the needle to the injured limb."
	icon_state = "hypo_superstimpak"
	custom_price = PRICE_SUPER_STIM
	syringe_self_delay = 10 //Double of a powder
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/super_stimpak = 15)

/obj/item/reagent_containers/hypospray/medipen/stimpak/super/custom
	desc = "The super version comes in a hypodermic, but with an additional vial to inject more drugs than the basic model and a leather belt to strap the needle to a limb. This particular one will deliver a tailored cocktail."
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = null

// ---------------------------------
// MED-X

/obj/item/reagent_containers/hypospray/medipen/medx
	name = "Med-X"
	desc = "A short-lasting shot of Med-X applied via hypodermic needle."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "hypo_medx"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/medicine/medx = 10)

/obj/item/reagent_containers/hypospray/medipen/medx/on_reagent_change(changetype)
	update_icon()

/obj/item/reagent_containers/hypospray/medipen/medx/update_overlays()
	. = ..()
	var/mutable_appearance/stimpak_overlay = mutable_appearance('icons/obj/reagentfillings.dmi', "medx", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += stimpak_overlay

// ---------------------------------
// PSYCHO

/obj/item/reagent_containers/hypospray/medipen/psycho
	name = "Psycho"
	desc = "Contains Psycho, a drug that makes the user hit harder and shrug off slight stuns, but causes slight brain damage and carries a risk of addiction."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "hypo_psycho"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/drug/psycho = 10)

/obj/item/reagent_containers/hypospray/medipen/psycho/on_reagent_change(changetype)
	update_icon()

/obj/item/reagent_containers/hypospray/medipen/psycho/update_overlays()
	. = ..()
	var/mutable_appearance/stimpak_overlay = mutable_appearance('icons/obj/reagentfillings.dmi', "psycho", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += stimpak_overlay

// ---------------------------------
// STEADY

/obj/item/reagent_containers/hypospray/medipen/steady
	name = "Steady"
	desc = "An inhaler of Steady, a combat drug which provides the user with a steady aim that makes it impossible to miss in sharpshooting. However, it is also highly addictive"
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "hypo_steady"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/drug/steady = 10)

// End Fallout -------------------------------------------------

/obj/item/reagent_containers/hypospray/medipen/ekit
	name = "emergency first-aid autoinjector"
	desc = "An epinephrine medipen with extra coagulant and antibiotics to help stabilize bad cuts and burns."
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/epinephrine = 12, /datum/reagent/medicine/coagulant = 2.5, /datum/reagent/medicine/spaceacillin = 0.5)

/obj/item/reagent_containers/hypospray/medipen/blood_loss
	name = "hypovolemic-response autoinjector"
	desc = "A medipen designed to stabilize and rapidly reverse severe bloodloss."
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/epinephrine = 5, /datum/reagent/medicine/coagulant = 2.5, /datum/reagent/iron = 3.5, /datum/reagent/medicine/salglu_solution = 4)

/obj/item/reagent_containers/hypospray/medipen/stimulants
	name = "illegal stimpack medipen"
	desc = "A highly illegal medipen due to its load and small injections, allow for five uses before being drained"
	volume = 50
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/medicine/stimulants = 50)

/obj/item/reagent_containers/hypospray/medipen/stimulants/baseball
	name = "the reason the syndicate major league team wins"
	desc = "They say drugs never win, but look where you are now, then where they are."
	icon_state = "baseballstim"
	volume = 50
	amount_per_transfer_from_this = 50
	list_reagents = list(/datum/reagent/medicine/stimulants = 50)



/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor
	desc = "A modified stimulants autoinjector for use in combat situations. Has a mild healing effect."
	list_reagents = list(/datum/reagent/medicine/stimulants = 10, /datum/reagent/medicine/omnizine = 10)

/obj/item/reagent_containers/hypospray/medipen/morphine
	name = "morphine medipen"
	desc = "A rapid way to get you out of a tight situation and fast! You'll feel rather drowsy, though."
	list_reagents = list(/datum/reagent/medicine/morphine = 10)

/obj/item/reagent_containers/hypospray/medipen/tuberculosiscure
	name = "BVAK autoinjector"
	desc = "Bio Virus Antidote Kit autoinjector. Has a two use system for yourself, and someone else. Inject when infected."
	icon_state = "stimpen"
	volume = 60
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/atropine = 10, /datum/reagent/medicine/epinephrine = 10, /datum/reagent/medicine/salbutamol = 20, /datum/reagent/medicine/spaceacillin = 20)

/obj/item/reagent_containers/hypospray/medipen/survival
	name = "survival medipen"
	desc = "A medipen for surviving in the harshest of environments, heals and protects from environmental hazards. WARNING: Do not inject more than one pen in quick succession."
	icon_state = "stimpen"
	volume = 52
	amount_per_transfer_from_this = 52
	list_reagents = list(/datum/reagent/medicine/salbutamol = 10, /datum/reagent/medicine/leporazine = 15, /datum/reagent/medicine/neo_jelly = 15, /datum/reagent/medicine/epinephrine = 10, /datum/reagent/medicine/lavaland_extract = 2)

/obj/item/reagent_containers/hypospray/medipen/firelocker
	name = "fire treatment medipen"
	desc = "A medipen that has been fulled with burn healing chemicals for personnel without advanced medical knowledge."
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/oxandrolone = 5, /datum/reagent/medicine/kelotane = 10)

/obj/item/reagent_containers/hypospray/combat/heresypurge
	name = "holy water autoinjector"
	desc = "A modified air-needle autoinjector for use in combat situations. Prefilled with 5 doses of a holy water mixture."
	volume = 250
	list_reagents = list(/datum/reagent/water/holywater = 150, /datum/reagent/peaceborg_tire = 50, /datum/reagent/peaceborg_confuse = 50)
	amount_per_transfer_from_this = 50

#define HYPO_SPRAY 0
#define HYPO_INJECT 1

#define WAIT_SPRAY 25
#define WAIT_INJECT 25
#define SELF_SPRAY 15
#define SELF_INJECT 15

#define DELUXE_WAIT_SPRAY 20
#define DELUXE_WAIT_INJECT 20
#define DELUXE_SELF_SPRAY 10
#define DELUXE_SELF_INJECT 10

#define COMBAT_WAIT_SPRAY 15
#define COMBAT_WAIT_INJECT 15
#define COMBAT_SELF_SPRAY 0
#define COMBAT_SELF_INJECT 0

//A vial-loaded hypospray. Cartridge-based!
/obj/item/hypospray/mkii
	name = "hypospray mk.II"
	icon_state = "hypo2"
	icon = 'icons/obj/syringe.dmi'
	desc = "A new development from DeForest Medical, this hypospray takes 30-unit vials as the drug supply for easy swapping."
	w_class = WEIGHT_CLASS_TINY
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/bottle/vial/tiny, /obj/item/reagent_containers/glass/bottle/vial/small)
	var/mode = HYPO_INJECT
	var/obj/item/reagent_containers/glass/bottle/vial/vial
	var/start_vial = /obj/item/reagent_containers/glass/bottle/vial/small
	var/spawnwithvial = TRUE
	var/inject_wait = WAIT_INJECT
	var/spray_wait = WAIT_SPRAY
	var/spray_self = SELF_SPRAY
	var/inject_self = SELF_INJECT
	var/quickload = FALSE
	var/penetrates = FALSE

/obj/item/hypospray/mkii/brute
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/small/bicaridine

/obj/item/hypospray/mkii/toxin
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/small/antitoxin

/obj/item/hypospray/mkii/oxygen
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/small/dexalin

/obj/item/hypospray/mkii/burn
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/small/kelotane

/obj/item/hypospray/mkii/tricord
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/small/tricord

/obj/item/hypospray/mkii/CMO
	name = "hypospray mk.II deluxe"
	allowed_containers = list(/obj/item/reagent_containers/glass/bottle/vial/tiny, /obj/item/reagent_containers/glass/bottle/vial/small, /obj/item/reagent_containers/glass/bottle/vial/large)
	icon_state = "cmo2"
	desc = "The Deluxe Hypospray can take larger-size vials. It also acts faster and delivers more reagents per spray."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/large/CMO
	inject_wait = DELUXE_WAIT_INJECT
	spray_wait = DELUXE_WAIT_SPRAY
	spray_self = DELUXE_SELF_SPRAY
	inject_self = DELUXE_SELF_INJECT

/obj/item/hypospray/mkii/CMO/combat
	name = "combat hypospray mk.II"
	desc = "A combat-ready deluxe hypospray that acts almost instantly. It can be tactically reloaded by using a vial on it."
	icon_state = "combat2"
	start_vial = /obj/item/reagent_containers/glass/bottle/vial/large/combat
	inject_wait = COMBAT_WAIT_INJECT
	spray_wait = COMBAT_WAIT_SPRAY
	spray_self = COMBAT_SELF_SPRAY
	inject_self = COMBAT_SELF_INJECT
	quickload = TRUE
	penetrates = TRUE

/obj/item/hypospray/mkii/Initialize()
	. = ..()
	if(!spawnwithvial)
		update_icon()
		return
	if(start_vial)
		vial = new start_vial
	update_icon()

/obj/item/hypospray/mkii/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/hypospray/mkii/update_icon_state()
	icon_state = "[initial(icon_state)][vial ? "" : "-e"]"

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	if(vial)
		. += "[vial] has [vial.reagents.total_volume]u remaining."
	else
		. += "It has no vial loaded in."
	. += "[src] is set to [mode ? "Inject" : "Spray"] contents on application."

/obj/item/hypospray/mkii/proc/unload_hypo(obj/item/I, mob/user)
	if((istype(I, /obj/item/reagent_containers/glass/bottle/vial)))
		var/obj/item/reagent_containers/glass/bottle/vial/V = I
		V.forceMove(user.loc)
		user.put_in_hands(V)
		to_chat(user, span_notice("You remove [vial] from [src]."))
		vial = null
		update_icon()
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1)
	else
		to_chat(user, span_notice("This hypo isn't loaded!"))
		return

/obj/item/hypospray/mkii/attackby(obj/item/I, mob/living/user)
	if((istype(I, /obj/item/reagent_containers/glass/bottle/vial) && vial != null))
		if(!quickload)
			to_chat(user, span_warning("[src] can not hold more than one vial!"))
			return FALSE
		unload_hypo(vial, user)
	if((istype(I, /obj/item/reagent_containers/glass/bottle/vial)))
		var/obj/item/reagent_containers/glass/bottle/vial/V = I
		if(!is_type_in_list(V, allowed_containers))
			to_chat(user, span_notice("[src] doesn't accept this type of vial."))
			return FALSE
		if(!user.transferItemToLoc(V,src))
			return FALSE
		vial = V
		user.visible_message(span_notice("[user] has loaded a vial into [src]."),span_notice("You have loaded [vial] into [src]."))
		update_icon()
		playsound(loc, 'sound/weapons/autoguninsert.ogg', 35, 1)
		return TRUE
	else
		to_chat(user, span_notice("This doesn't fit in [src]."))
		return FALSE

/obj/item/hypospray/mkii/AltClick(mob/user)
	. = ..()
	if(vial)
		vial.attack_self(user)
		return TRUE

// Gunna allow this for now, still really don't approve - Pooj
/obj/item/hypospray/mkii/emag_act(mob/user)
	. = ..()
	if(obj_flags & EMAGGED)
		to_chat(user, "[src] happens to be already overcharged.")
		return
	inject_wait = COMBAT_WAIT_INJECT
	spray_wait = COMBAT_WAIT_SPRAY
	spray_self = COMBAT_SELF_INJECT
	inject_self = COMBAT_SELF_SPRAY
	penetrates = TRUE
	to_chat(user, "You overcharge [src]'s control circuit.")
	obj_flags |= EMAGGED
	return TRUE

/obj/item/hypospray/mkii/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..() //Don't bother changing this or removing it from containers will break.

/obj/item/hypospray/mkii/attack(obj/item/I, mob/user, params)
	return

/obj/item/hypospray/mkii/afterattack(atom/target, mob/user, proximity)
	. = ..()
	INVOKE_ASYNC(src, .proc/attempt_inject, target, user, proximity)

/obj/item/hypospray/mkii/proc/attempt_inject(atom/target, mob/user, proximity)
	if(!vial || !proximity || !isliving(target))
		return
	var/mob/living/L = target

	if(!L.reagents || !L.can_inject(user, TRUE, user.zone_selected, penetrates))
		return

	if(iscarbon(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, span_warning("The limb is missing!"))
			return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, span_notice("Medicine won't work on a robotic limb!"))
			return

	//Always log attemped injections for admins
	var/contained = vial.reagents.log_list()
	log_combat(user, L, "attemped to inject", src, addition="which had [contained]")

	if(!vial)
		to_chat(user, span_notice("[src] doesn't have any vial installed!"))
		return
	if(!vial.reagents.total_volume)
		to_chat(user, span_notice("[src]'s vial is empty!"))
		return

	var/fp_verb = mode == HYPO_SPRAY ? "spray" : "inject"
	var/method = mode == HYPO_SPRAY ? PATCH  : INJECT

	if(L != user)
		L.visible_message(span_danger("[user] is trying to [fp_verb] [L] with [src]!"), \
						span_userdanger("[user] is trying to [fp_verb] you with [src]!"))
	if(!do_mob(user, L, inject_wait, extra_checks = CALLBACK(L, /mob/living/proc/can_inject, user, FALSE, user.zone_selected, penetrates)))
		return
	if(!vial.reagents.total_volume)
		return
	log_attack("<font color='red'>[user.name] ([user.ckey]) applied [src] to [L.name] ([L.ckey]), which had [contained] (INTENT: [uppertext(user.a_intent)]) (MODE: [mode])</font>")
	if(L != user)
		L.visible_message(span_danger("[user] uses the [src] on [L]!"), \
						span_userdanger("[user] uses the [src] on you!"))
	else
		L.log_message("<font color='orange'>applied [src] to themselves ([contained]).</font>", INDIVIDUAL_ATTACK_LOG)

	var/fraction = min(vial.amount_per_transfer_from_this/vial.reagents.total_volume, 1)
	vial.reagents.reaction(L, method, fraction)
	vial.reagents.trans_to(target, vial.amount_per_transfer_from_this, log = TRUE)
	var/long_sound = vial.amount_per_transfer_from_this >= 15
	playsound(loc, long_sound ? 'sound/items/hypospray_long.ogg' : pick('sound/items/hypospray.ogg','sound/items/hypospray2.ogg'), 50, 1, -1)
	to_chat(user, span_notice("You [fp_verb] [vial.amount_per_transfer_from_this] units of the solution. The hypospray's cartridge now contains [vial.reagents.total_volume] units."))

/obj/item/hypospray/mkii/attack_self(mob/living/user)
	if(user)
		if(user.incapacitated())
			return
		else if(!vial)
			to_chat(user, "This Hypo needs to be loaded first!")
			return
		else
			unload_hypo(vial,user)

/obj/item/hypospray/mkii/CtrlClick(mob/living/user)
	. = ..()
	if(user.canUseTopic(src, FALSE) && user.get_active_held_item(src))
		switch(mode)
			if(HYPO_SPRAY)
				mode = HYPO_INJECT
				to_chat(user, "[src] is now set to inject contents on application.")
			if(HYPO_INJECT)
				mode = HYPO_SPRAY
				to_chat(user, "[src] is now set to spray contents on application.")
		return TRUE

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	. += "<span class='notice'><b>Ctrl-Click</b> it to toggle its mode from spraying to injecting and vice versa.</span>"

#undef HYPO_SPRAY
#undef HYPO_INJECT
#undef WAIT_SPRAY
#undef WAIT_INJECT
#undef SELF_SPRAY
#undef SELF_INJECT
#undef DELUXE_WAIT_SPRAY
#undef DELUXE_WAIT_INJECT
#undef DELUXE_SELF_SPRAY
#undef DELUXE_SELF_INJECT
#undef COMBAT_WAIT_SPRAY
#undef COMBAT_WAIT_INJECT
#undef COMBAT_SELF_SPRAY
#undef COMBAT_SELF_INJECT
