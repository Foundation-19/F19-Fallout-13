
/*
prewar alloys
*/
GLOBAL_LIST_INIT(prewar_recipes, list ( \
	new/datum/stack_recipe("modern chair", /obj/structure/chair/comfy/modern, 2, time = 5, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("gun locker", /obj/structure/guncase, 4, time = 10, one_per_turf = TRUE, on_floor = TRUE), \

))

/obj/item/stack/sheet/prewar
	name = "pre-war alloys"
	singular_name = "pre war alloy"
	desc = "This sheet was manufactured by using advanced smelting techniques before the war."
	icon_state = "sheet-prewar"
	inhand_icon_state = "sheet-metal"
	custom_materials = list()
	throwforce = 10
	flags_1 = CONDUCT_1
	armor = ARMOR_VALUE_GENERIC_ITEM
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/prewar
	grind_results = list(/datum/reagent/iron = 20, /datum/reagent/toxin/plasma = 20)

/obj/item/stack/sheet/prewar/get_main_recipes()
	. = ..()
	. += GLOB.prewar_recipes

/obj/item/stack/sheet/prewar/five
	amount = 5

/obj/item/stack/sheet/prewar/twenty
	amount = 20

/obj/item/stack/sheet/prewar/fifty
	amount = 50