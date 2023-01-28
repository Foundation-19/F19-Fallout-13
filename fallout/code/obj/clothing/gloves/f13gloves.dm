/obj/item/clothing/gloves/f13
	armor = ARMOR_VALUE_LIGHT

/obj/item/clothing/gloves/f13/baseball
	name = "baseball glove"
	desc = "A large leather glove worn by baseball players of the defending team which assists them in catching and fielding balls hit by a batter or thrown by a teammate."
	icon_state = "baseball"
	inhand_icon_state = "b_shoes"
	greyscale_colors = null
	//transfer_prints = TRUE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/leather
	name = "leather gloves"
	desc = "Gloves made of wasteland animals hides, that were tanned and carefully stiched together."
	icon = 'fallout/icons/clothing/gloves.dmi'
	icon_state = "leather"
	inhand_icon_state = "leather"
	greyscale_colors = null
//	transfer_prints = FALSE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/leather/fingerless
	name = "fingerless leather gloves"
	desc = "Gloves made out of wasteland animal hides, tanned and stitched together without any fingers."
	icon_state = "ncr_gloves"
	inhand_icon_state = "ncr_gloves"
	//transfer_prints = TRUE
	heat_protection = null
	max_heat_protection_temperature = null

/obj/item/clothing/gloves/f13/military
	name = "military gloves"
	desc = "Tight fitting black leather gloves with mesh along the finger tips and padding along the palm, designed for use by the U.S. Army before the Great War."
	icon_state = "military"
	inhand_icon_state = "military"
	greyscale_colors = null
	//transfer_prints = TRUE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/doom
	name = "strange gloves"
	desc = "These gloves look like a part of some sort of space suit, or maybe exquisite armor, but you can't tell for sure."
	icon_state = "doom"
	inhand_icon_state = "doom"
	greyscale_colors = null
	//transfer_prints = TRUE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/f13/handwraps
	name = "handwraps"
	desc = "A roll of cloth to roll around one's palms, provides only minimal effectiveness."
	icon_state = "handwraps"
	inhand_icon_state = "handwraps"
	greyscale_colors = null
	//transfer_prints = TRUE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/lace
	name = "lace gloves"
	desc = "A tight, seethrough pair of black gloves, designed to be worn with something fancy."
	icon_state = "lacegloves"
	inhand_icon_state = "lacegloves"
	greyscale_colors = null
	//transfer_prints = TRUE
	strip_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/crudemedical
	name = "crude medical gloves"
	desc = "Cotton gloves waxed to prevent the blood from soaking through immediatly. Better than nothing."
	icon = 'fallout/code/modular_atom/legio_invicta/icons/icons_legion.dmi'
	worn_icon = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion.dmi'
	righthand_file = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion_righthand.dmi'
	lefthand_file = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion_lefthand.dmi'
	icon_state = "offwhite"
	inhand_icon_state = "offwhite"
	siemens_coefficient = 0.5

/obj/item/clothing/gloves/f13/mutant
	name = "mutant bracers"
	desc = "A pair of metal tubes with rope on the inside."
	icon_state = "mutie_bracer"
	inhand_icon_state = "mutie_bracer"
	armor = ARMOR_VALUE_MEDIUM
	armor_tokens = list(ARMOR_MODIFIER_UP_BULLET_T1, ARMOR_MODIFIER_UP_LASER_T1, ARMOR_MODIFIER_UP_ENV_T1, ARMOR_MODIFIER_UP_DT_T2)

/obj/item/clothing/gloves/f13/mutant/mk2
	name = "mutant bracers"
	desc = "A pair of giant metal tubes with rope on the inside."
	icon_state = "mutie_bracer_mk2"
	inhand_icon_state = "mutie_bracer_mk2"

/obj/item/clothing/gloves/f13/mutant/sign
	name = "mutant sign bracers"
	desc = "See this sign? It's a sign to move on."
	icon_state = "mutie_bracer_sign"
	inhand_icon_state = "mutie_bracer_sign"

/obj/item/clothing/gloves/botanic_leather
	name = "farmers gloves"
	desc = "These thick leather gloves protect against thorns, barbs, prickles, spikes and other harmful objects of floral origin.  They're also quite warm."
	icon = 'fallout/icons/clothing/gloves.dmi'
	icon_state = "farmer"
	worn_icon = 'fallout/icons/onmob/clothes/hand.dmi'
	inhand_icon_state = "farmer"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE


//////////
//LEGION//
//////////

/obj/item/clothing/gloves/legion // art in Legio Invicta
	name = "leather gloves"
	desc = "Fingerless leather gloves to improve grip worn by legionaires."
	icon = 'fallout/code/modular_atom/legio_invicta/icons/icons_legion.dmi'
	worn_icon = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion.dmi'
	righthand_file = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion_righthand.dmi'
	lefthand_file = 'fallout/code/modular_atom/legio_invicta/icons/onmob_legion_lefthand.dmi'
//	icon = 'fallout/icons/clothing/gloves.dmi'
//	worn_icon = 'fallout/icons/onmob/clothes/hand.dmi'
	icon_state = "gloves_fingerless"
	inhand_icon_state = "gloves_fingerless"
//	icon_state = "legion_fingerless"
//	inhand_icon_state = "legion_fingerless"
	greyscale_colors = null	//So they don't wash.
	//transfer_prints = TRUE
	strip_delay = 40
	equip_delay_other = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/legion/plated
	name = "plated gloves"
	desc = "Leather gloves with metal reinforcement."
	icon_state = "gloves_plated"
	inhand_icon_state = "gloves_plated"
//	icon_state = "legion_plated"
//	inhand_icon_state = "legion_plated"
//	transfer_prints = FALSE
	armor_tokens = list(ARMOR_MODIFIER_UP_LASER_T1, ARMOR_MODIFIER_UP_ENV_T1, ARMOR_MODIFIER_UP_DT_T1)

/obj/item/clothing/gloves/legion/legate
	name = "brass gauntlets"
	desc = "Heavy finely crafted metal gloves."
	icon = 'fallout/icons/clothing/gloves.dmi'
	worn_icon = 'fallout/icons/onmob/clothes/hand.dmi'
	icon_state = "legion_legate"
	inhand_icon_state = "legion_legate"
//	transfer_prints = FALSE
	armor_tokens = list(ARMOR_MODIFIER_UP_LASER_T1, ARMOR_MODIFIER_UP_ENV_T1, ARMOR_MODIFIER_UP_DT_T1)
