/datum/reagent/consumable/mutjuice
	name = "Mutfruit Juice"
	description = "The sweet-salty juice of the mutfruit."
	color = "#660099"
	taste_description = "sweet and salty"
	name = "glass of mutfruit juice"
	description = "A glass of sweet-salty mutfruit juice."

/datum/reagent/consumable/mutjuice/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(50))
		M.heal_bodypart_damage(0,1, 0)
		. = TRUE
	..()

/datum/reagent/consumable/yuccajuice
	name = "Yucca Juice"
	description = "The raw essence of a	banana yucca."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "sand and bunker-air"
	glass_icon_state = "banana"
	name = "glass of yucca juice"
	description = "A wastelanders favourite."

/datum/reagent/consumable/tato_juice
	name = "Tato Juice"
	description = "Juice of the tato. Smells like bad eggs."
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "rotten ketchup"
	glass_icon_state = "glass_brown"
	name = "glass of tato juice"
	description = "Juice of the tato. Smells like bad eggs."
