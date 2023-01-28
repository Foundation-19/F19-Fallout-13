/obj/item/reagent_containers/food/snacks/cookie
	name = "cookie"
	desc = "COOKIE!!!"
	icon_state = "COOKIE!!!"
	bitesize = 1
	bonus_reagents = list(
		/datum/reagent/consumable/nutriment = 1
	)
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 1
	)
	filling_color = "#F0E68C"
	tastes = list("cookie" = 1)
	foodtype = GRAIN | SUGAR
	dunkable = TRUE


/obj/item/reagent_containers/food/snacks/sugarcookie
	name = "sugar cookie"
	desc = "Just like your little sister used to make."
	icon_state = "sugarcookie"
	bonus_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3
	)
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3
	)
	filling_color = "#CD853F"
	tastes = list("sweetness" = 1)
	foodtype = GRAIN | JUNKFOOD | SUGAR
	dunkable = TRUE