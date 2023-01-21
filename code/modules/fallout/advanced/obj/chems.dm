//Fallout 13 wasteland medicine directory

/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	name = "healing powder"
	desc = "A foul-smelling primitive healing medicine.<br>It is widespread in the wasteland due to easy production - all kinds of Wastelanders from Settlers to Mercenaries use it to heal minor injuries.<br>Soldiers of the Legion use healing powder as their primary source of medicine and healing, since the Legion bans the use of other chems, such as stimpaks."
	list_reagents = list("omnizine" = 20, "salglu_solution" = 15, "musclestimulant" = 10) // added morphine to the mix to prevent stacking a bunch of healing powders together, and to add the drowsiness drawback from FO2.
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "heal_powder"
	item_state = "bandaid"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/stimpak
	name = "stimpak"
	desc = "A stimpak, or stimulation delivery package, is a type of hand-held medication used for healing the body."
	list_reagents = list("styptic_powder" = 30, "silver_sulfadiazine" = 25)
	icon = 'icons/fallout/objects/medicine/syringe.dmi'
	icon_state = "stim_15"
	item_state = "syringe_15"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	name = "super stimpak"
	desc = "The super version of the Stimpak has an additional vial containing more powerful drugs than the basic model."
	list_reagents = list("styptic_powder" = 50, "omnizine" = 15, "silver_sulfadiazine" = 25)
	icon = 'icons/fallout/objects/medicine/syringe.dmi'
	icon_state = "superstim_15"
	item_state = "syringe_15"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/medx
	name = "med-x"
	desc = "Med-X is a potent opiate analgesic that binds to opioid receptors in the brain and central nervous system, reducing the perception of pain as well as the emotional response to pain.<br>Essentially, it is a painkiller delivered via hypodermic needle. Allows a user to walk on despite horrific wounds."
	list_reagents = list("morphine" = 4, "musclestimulant" = 20)
	icon = 'icons/fallout/objects/medicine/syringe.dmi'
	icon_state = "medx_15"
	item_state = "syringe_15"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/radaway
	name = "radaway"
	desc = "RadAway is an intravenous chemical solution that bonds with irradiated particles and passes them through the body's system. It takes some time to work, and is also a potent diuretic."
	list_reagents = list("charcoal" = 40)
	icon = 'icons/fallout/objects/medicine/bloodpack.dmi'
	icon_state = "radaway"
	item_state = "syringe_15"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/jet
	name = "jet"
	desc = "Jet is an extremely addictive chem, a single hit is enough to form an addiction in most people. It significantly boosts a user's metabolism, allowing for bursts of increased speed and a quicker recovery time from both fatigue and stuns."
	list_reagents = list("hyperepinephrine" = 15, "crank" = 12)
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "jet"
	item_state = "bandaid"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/psycho
	name = "psycho"
	desc = "Psycho boosts pain tolerance and strength to incredible levels, preventing wounds from slowing down the user. It also provides a mixture of stimulants which promote rapid wound healing. Overdose will rapidly result in death, it is recommended to take Psycho with extreme caution."
	list_reagents = list("epinephrine" = 15, "inacusiate" = 5, "oculine" = 5, "psychocorazine" = 25)
	icon = 'icons/fallout/objects/medicine/syringe.dmi'
	icon_state = "psycho"
	item_state = "syringe_15"
	self_weight = 0.01
	
/obj/item/weapon/reagent_containers/pill/patch/radx
	name = "rad-x"
	desc = "Rad-X is an anti-radiation chemical that can significantly reduce the danger of irradiated areas."
	list_reagents = list("potass_iodide" = 30, "pen_acid" = 15)
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "radx"
	item_state = "bandaid"
	self_weight = 0.01

/obj/item/weapon/reagent_containers/pill/patch/turbo
	name = "turbo"
	desc = "Turbo provides a speed boost to the user, though mixing volatile chems like this can't be good for your health."
	list_reagents = list("hyperepinephrine" = 18, "crank" = 9)
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "turbo"
	item_state = "turbo"
	self_weight = 0.01
