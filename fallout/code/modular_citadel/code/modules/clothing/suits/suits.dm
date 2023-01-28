/*/////////////////////////////////////////////////////////////////////////////////
///////																		///////
///////			Cit's exclusive suits, armor, etc. go here			///////
///////																		///////
*//////////////////////////////////////////////////////////////////////////////////


/obj/item/clothing/suit/armor/medium/duster/trenchcoat/cloak
	name = "armored trenchcloak"
	desc = "A trenchcoat enchanced with a special lightweight kevlar. This one appears to be designed to be draped over one's shoulders rather than worn normally.."
	worn_icon = 'fallout/code/modular_citadel/icons/mob/citadel/suit.dmi'
	icon_state = "hostrench"
	inhand_icon_state = "hostrench"
	body_parts_covered = CHEST|ARMS|LEGS

/obj/item/clothing/suit/hooded/cloak/david
	name = "red cloak"
	icon_state = "goliath_cloak"
	desc = "A grubby red cloak, it has gained its color from years of blood, dust, rust, and various stains."
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/david
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/head/hooded/cloakhood/david
	name = "red cloak hood"
	icon_state = "golhood"
	desc = "A simple hood, does it make you less or more suspicous?"
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
