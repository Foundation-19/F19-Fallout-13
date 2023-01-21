//Fallout 13 Neutral faction aka Wastelanders roles

/datum/job/settler
	title = "Wasteland Settler"
	flag = SETTLER
	department_flag = WASTELAND
	desc = "A true child of the wasteland.<br>In badlands you are born, in badlands lays your grave."
	faction = "none"
	status = "none"
	total_positions = -1
	spawn_positions = -1
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	outfit = /datum/outfit/job/settler

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "vault13", "starwars", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom","adminpack", "holsters", "terminator", "residentevil", "sierramadre", "karate","deadman")

/datum/outfit/job/settler
	name = "Wasteland Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/rag
	belt = /obj/item/weapon/storage/belt/cruzholster/full

//Adventurer

/datum/job/adventurer
	title = "Wasteland Adventurer"
	desc = "An offspring of wasteland wanderers.<br>Your life is a journey, and you are free to choose what kind of a journey it will be."
	flag = ADVENTURER
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/adventurer

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "starwars", "punk", "off", "madmax", "doom","adminpack", "holsters", "terminator", "residentevil", "sierramadre", "karate", "deadman")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/gloves/f13/military,
	/obj/item/clothing/under/f13/mercadv,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/under/f13/bodyguard,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/leonjacket,
	/obj/item/clothing/suit/hunterjacket,
	/obj/item/clothing/suit/mikecoat,
	/obj/item/clothing/suit/poncho,
	/obj/item/clothing/suit/poncho/green,
	/obj/item/clothing/suit/poncho/red,
	/obj/item/clothing/head/sombrero,
	/obj/item/clothing/under/leonclothes,
	/obj/item/clothing/under/liquidsuit,
	/obj/item/clothing/head/sombrero/green,
	/obj/item/clothing/under/leonclothes,
	/obj/item/clothing/suit/jacket/leather/overcoat,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/suit/armor/f13/bmetalarmor,
	/obj/item/clothing/head/soft/f13/utility/navy,
	/obj/item/clothing/head/helmet/f13/tribal,
	/obj/item/clothing/head/helmet/f13/eyebot,
	/obj/item/clothing/head/helmet/f13/marine,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/adventurer
	name = "Wasteland Adventurer"
	uniform = /obj/item/clothing/under/f13/merccharm
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/veteran
	belt = /obj/item/weapon/storage/belt/cruzholster/full
