/datum/material/blackpowder
	name = "blackpowder"
	desc = "blackpowder"
	color = "#000000"
	alpha = 150
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/ore/blackpowder
	value_per_unit = 0.0050

/obj/item/stack/ore/blackpowder
	name = "gunpowder"
	icon_state = "Blackpowder ore"
	item_state = "Blackpowder ore"
	singular_name = "blackpowder"
	points = 1
	merge_type = /obj/item/stack/ore/blackpowder
	custom_materials = list(/datum/material/blackpowder=MINERAL_MATERIAL_AMOUNT)
	grind_results = list(/datum/reagent/blackpowder = 50)
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/ore/blackpowder/fifty
	amount = 50

/obj/item/stack/ore/blackpowder/twenty
	amount = 20

/obj/item/stack/ore/blackpowder/two
	amount = 2

/obj/item/stack/ore/blackpowder/five
	amount = 5

/datum/reagent/blackpowder
	name = "Black Powder"
	description = "Explodes. Violently."
	reagent_state = LIQUID
	color = "#000000"
	metabolization_rate = 0.05
	taste_description = "salt"
	value = REAGENT_VALUE_RARE
	ghoulfriendly = TRUE

/datum/reagent/blackpowder/on_mob_life(mob/living/carbon/M)
	..()
	if(isplasmaman(M))
		M.hallucination += 5

/datum/reagent/blackpowder/on_ex_act()
	var/location = get_turf(holder.my_atom)
	var/datum/effect_system/reagents_explosion/e = new()
	e.set_up(1 + round(volume/6, 1), location, 0, 0, message = 0)
	e.start()
	holder.clear_reagents()