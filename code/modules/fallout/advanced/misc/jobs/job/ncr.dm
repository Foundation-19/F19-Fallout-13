//Fallout 13 New California Republic faction directory

/datum/job/captain
	title = "NCR Captain"
	desc = "The fate of civilization rests on your shoulders.<br>You were chosen to write history anew.<br>Make the two headed bear proud."
	flag = CAPTAIN
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_captain"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7
	whitelist_on = 0

	allowed_packs = list("starter", "cigarettes", "super_ten", "trooper_armor")

	required_items = list(
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/gold,
	/obj/item/weapon/reagent_containers/pill/patch/stimpak,
	/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/captain

	access = list(71)

/datum/outfit/job/captain
	name = "NCR Captain"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/general
	shoes = /obj/item/clothing/shoes/laceup
	suit = null
	belt = /obj/item/weapon/storage/belt/military/army/full
	head = /obj/item/clothing/head/f13/ncr_captain
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	id = /obj/item/weapon/card/id/ncr

/datum/job/captain/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)


//NCR Sergeant

/datum/job/ncr_sergeant
	title = "NCR Sergeant"
	desc = "You have to remind Troopers to speak only when spoken to, and that the first and last words out of their filthy sewers will be \"Sir\"."
	flag = NCR_SERGEANT
	department_head = list("captain")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_sergeant"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Captain"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "super_ten", "trooper_armor","heavy_trooper")

	required_items = list(
	/obj/item/clothing/head/f13/ncr_officer,
	/obj/item/clothing/under/f13/ncr,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz,
	/obj/item/weapon/gun/ballistic/automatic/rifle,
	/obj/item/ammo_box/magazine/m308
	)

	outfit = /datum/outfit/job/ncr_sergeant

	access = list(71)

/datum/outfit/job/ncr_sergeant
	name = "NCR Sergeant"
	id = null
	gloves = /obj/item/clothing/gloves/f13/ncr
	uniform = /obj/item/clothing/under/f13/ncr_officer
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	head = /obj/item/clothing/head/f13/ncr_officer
	belt = /obj/item/weapon/storage/belt/military/army/full
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	id = /obj/item/weapon/card/id/ncr

/datum/job/vranger
	title = "NCR Veteran Ranger"
	desc = "You are a shadow. No one can hear you coming - and if they see you, they know they're a goner."
	flag = RANGER
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "vranger"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	outfit = /datum/outfit/job/vranger

	access = list(71)

	allowed_packs = list("starter", "cigarettes", "super_ten")

	required_items = list(
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved,
	/obj/item/clothing/suit/armor/ranger/eliteriotgear, //adding this here so vet rangers have a choice between light weight, low protective gear or high weight, high protective gear.
	/obj/item/clothing/head/helmet/ranger/eliteriot,
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz,
	)


/datum/outfit/job/vranger
	name = "NCR Veteran Ranger"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/mechanic
	shoes = /obj/item/clothing/shoes/f13/military/light
	suit = /obj/item/clothing/suit/armor/ranger
	suit_store = /obj/item/weapon/gun/ballistic/revolver/sequoia
	head = /obj/item/clothing/head/helmet/ranger
	belt = /obj/item/weapon/storage/belt/military/assault/full
	back = /obj/item/weapon/gun/ballistic/automatic/sniper_rifle
	weapon = /obj/item/weapon/cqc_manual
	id = /obj/item/weapon/card/id/ncr

	//NCR First Recon

/datum/job/ncr_ranger
	title = "NCR Patrol Ranger"
	desc = "We rangers chew nails and spit napalm. The toughest of the NCR."
	flag = NCR_RANGER
	department_head = list("vranger")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_ranger"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Veteran Ranger"
	minimal_player_age = 5

	allowed_packs = list("starter", "cigarettes", "super_ten")

	required_items = list(
	/obj/item/clothing/head/f13/ncr_officer,
	/obj/item/clothing/under/f13/ncr,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz,
	/obj/item/weapon/gun/ballistic/automatic/rifle,
	/obj/item/ammo_box/magazine/m308
	)

	outfit = /datum/outfit/job/ncr_ranger

	access = list(71)

/datum/outfit/job/ncr_ranger
	name = "NCR Patrol Ranger"
	id = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/armor/f13/sergeant
	head = /obj/item/clothing/head/f13/sergeant
	belt = /obj/item/weapon/storage/belt/military/army/full
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	id = /obj/item/weapon/card/id/ncr

/datum/job/trooper
	title = "NCR Trooper"
	desc = "I am a soldier and I'm marching on, I am a warrior and this is my song!"
	flag = TROOPER
	department_head = list("ncr_captain", "ncr_sergeant")
	department_flag = WASTELAND
	faction = "ncr"
	status = "trooper"
	total_positions = 30
	spawn_positions = 30
	supervisors = "the Captain"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "super_ten", "trooper_armor")

	required_items = list(
	/obj/item/weapon/kitchen/knife/combat
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/trooper

	access = list(71)

/datum/outfit/job/trooper
	name = "NCR Trooper"
	gloves = /obj/item/clothing/gloves/f13/ncr
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	mask = /obj/item/clothing/mask/bandana/f13/facewrap
	head = /obj/item/clothing/head/helmet/f13/trooper
	glasses = /obj/item/clothing/glasses/f13/biker
	belt = /obj/item/weapon/storage/belt/military/army/full
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	id = /obj/item/weapon/card/id/ncr
