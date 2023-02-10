bj/item/reagent_containers/food/snacks/cracker
	name = "cracker"
	desc = "It's a salted cracker."
	icon_state = "cracker"
	bitesize = 1
	bonus_reagents = list(
		/datum/reagent/consumable/nutriment = 1
	)
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 1
	)
	filling_color = "#F0E68C"
	tastes = list("cracker" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/cracker/c_ration
	name = "army cracker"
	bitesize = 2
	icon_state = "c_ration_cracker"

/obj/item/reagent_containers/food/snacks/cracker/k_ration
	name = "ranger biscuit"
	bitesize = 2
	icon_state = "k_ration_cracker"
	tastes = list("biscuit" = 1, "brahmin butter" = 1)