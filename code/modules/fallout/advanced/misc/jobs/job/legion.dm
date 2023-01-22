//Fallout 13 Legion faction directory

/datum/job/legate
	title = "Legion Legatus"
	desc = "Caesar's will is the will of the Legion.<br>The Legate is the hand of Caesar!<br>Veni, vidi, vici!"
	flag = LEGLEGAT
	department_head = list("Caesar")
	department_flag = WASTELAND
	faction = "legion"
	status = "legate"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Caesar"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	whitelist_on = 0

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/gold
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/leglegate

	access = list(72)

/datum/outfit/job/leglegate
	name = "Legion Legatus"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionlegate
	gloves = /obj/item/clothing/gloves/f13/legionlegate
	suit = /obj/item/clothing/suit/armor/f13/leglegate
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	head = /obj/item/clothing/head/helmet/f13/leglegate
	back = /obj/item/weapon/bumpersword
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/automatic/rifle
	id = /obj/item/weapon/card/id/legion

//Legion Centurion

/datum/job/centurion
	title = "Legion Centurion"
	desc = "We are the Legion - one is many.<br>The Centurion is a guardian of Caesar!<br>Ab uno disce omnes!"
	flag = LEGCENTURION
	department_head = list("legate")
	department_flag = WASTELAND
	faction = "legion"
	status = "centurion"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legcenturion

	access = list(72)

/datum/outfit/job/legcenturion
	name = "Legion Centurion"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/leather
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	back = /obj/item/weapon/bumpersword
	suit = /obj/item/clothing/suit/armor/f13/legcenturion
	head = /obj/item/clothing/head/helmet/f13/legcenturion
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	id = /obj/item/weapon/card/id/legion

//Legion Vexillarius

/datum/job/vex
	title = "Legion Vexillarius"
	desc = "Mortal actions never deceive the gods.<br>The Vexillarius is an ambassador of Caesar!<br>Acta deos numquam mortalia fallunt!"
	flag = LEGVEX
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "vexillarius"
	total_positions = 8
	spawn_positions = 8
	supervisors = "the Legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legvex

	access = list(72)

/datum/outfit/job/legvex
	name = "Legion Vexillarius"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/leather
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	suit = /obj/item/clothing/suit/armor/f13/legvexil
	head = /obj/item/clothing/head/helmet/f13/legvexil
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	id = /obj/item/weapon/card/id/legion

//Legion Decanus

/datum/job/decan
	title = "Legion Decanus"
	desc = "Boldness is our wall, action is our shield.<br>The Decanus is a weapon of Caesar!<br>Audacia pro muro et scuto opus!"
	flag = LEGDECAN
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "decanus"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the Centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	required_items = list(
	/obj/item/clothing/head/helmet/f13/legdecan/alt,
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legdecan

	access = list(72)

/datum/outfit/job/legdecan
	name = "Legion Decanus"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legdecan
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legdecan
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle
	id = /obj/item/weapon/card/id/legion

//Legion Prime

/datum/job/prime
	title = "Legion Prime"
	desc = "Victory favors bravery.<br>The Prime is a servant of Caesar!<br>Ad victoriam!"
	flag = PRIME
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "prime"
	total_positions = 25
	spawn_positions = 25
	supervisors = "the Centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/prime

	access = list(72)

/datum/outfit/job/prime
	name = "Legion Prime"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legprime
	head = /obj/item/clothing/head/helmet/f13/legprime
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legrecruit
	id = /obj/item/weapon/card/id/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1,/obj/item/weapon/reagent_containers/pill/patch/healingpowder)

// legion recruit

/datum/job/recruit
	title = "Legion Recruit"
	desc = "Victory favors the bold."
	flag = RECRUIT
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "recruit"
	total_positions = 60
	spawn_positions = 60
	supervisors = "the Centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 0
	disallowed_gender = FEMALE

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/recruit

	access = list(72)

/datum/outfit/job/recruit
	name = "Legion Recruit"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legrecruit
	belt = /obj/item/weapon/storage/belt/legionbelt/full
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legrecruit
	id = /obj/item/weapon/card/id/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1,/obj/item/weapon/reagent_containers/pill/patch/healingpowder)

/datum/job/camp
	title = "Legion Camp Follower"
	desc = "Victory favors the bold."
	flag = CAMPFOLLOWER
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "follower"
	total_positions = 25
	spawn_positions = 25
	supervisors = "the Legion"
	selection_color = "#ec9d9d"
	minimal_player_age = 0
	disallowed_gender = MALE

	required_items = list(
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/campfollower

/datum/outfit/job/campfollower
	name = "Legion Camp Follower"
	uniform = /obj/item/clothing/under/f13/female/tribal
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
