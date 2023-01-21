//Fallout 13 Enclave faction roles

/datum/job/colonel
	title = "Enclave Colonel"
	desc = "An actual American patriot.<br>You live by the principle that the Main Goal is more important than the means of achieving it."
	flag = COLONEL
	department_head = list("Enclave Central Command")
	department_flag = MEDSCI
	faction = "enclave"
	status = "colonel"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Enclave Central Command"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 0

	required_items = list(
	/obj/item/weapon/cqc_manual
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

	outfit = /datum/outfit/job/colonel

	access = list(70, 63, 20, 12)

/datum/outfit/job/colonel
	name = "Enclave Colonel"
	backpack = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/autumn
	belt = /obj/item/weapon/storage/belt/military/enclavearmy/full
	id = /obj/item/weapon/card/id/enclave

/datum/job/colonel/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)

//Enclave Lieutenant

/datum/job/enclave_lieutenant
	title = "Enclave Lieutenant"
	desc = "A loyal soldier.<br>You trust your commander and orders from above - it's just about time to make America great again!"
	flag = ENCLAVE_LIEUTENANT
	department_head = list("colonel")
	department_flag = MEDSCI
	faction = "enclave"
	status = "enclave_lieutenant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	required_items = list(
	/obj/item/weapon/cqc_manual
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

	outfit = /datum/outfit/job/enclave_lieutenant

	access = list(70, 63, 20, 12)

/datum/outfit/job/enclave_lieutenant
	name = "Enclave Lieutenant"
	backpack = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = null
	head = /obj/item/clothing/head/soft/f13/enclave
	belt = /obj/item/weapon/storage/belt/military/enclavearmy/full
	id = /obj/item/weapon/card/id/enclave

/datum/job/enclave_lieutenant/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)

//Enclave Private

/datum/job/enclave_private
	title = "Enclave Private"
	desc = "Enlist today."
	flag = ENCLAVE_PRIVATE
	department_head = list("colonel", "lieutenant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "private"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	required_items = list(
	/obj/item/clothing/head/helmet/f13/combat_mk2,
	/obj/item/clothing/suit/armor/f13/combat_mk2
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

	outfit = /datum/outfit/job/enclave_private

	access = list(70)

/datum/outfit/job/enclave_private
	name = "Enclave Private"
	backpack = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/dbdu
	shoes = /obj/item/clothing/shoes/f13/military
	head = /obj/item/clothing/head/soft/f13/utility/tan
	belt = /obj/item/weapon/storage/belt/military/enclavearmy/full
	weapon = null
	id = /obj/item/weapon/card/id/enclave

/datum/job/enclave_private/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)

	//Enclave Scientist

/datum/job/enclave_scientist
	title = "Enclave Scientist"
	desc = "Experimenting on the Un-American since 1943."
	flag = ENCLAVE_SCIENTIST
	department_head = list("colonel", "lieutenant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "scientist"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	required_items = list(
	/obj/item/clothing/head/bio_hood/science,
	/obj/item/clothing/suit/bio_suit/sciencesuit,
	/obj/item/weapon/gun/energy/plasma/pistol
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

	outfit = /datum/outfit/job/enclave_private

	access = list(70)

/datum/job/enclave_scientist/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)


	//Enclave Recruit

/datum/job/enclave_recruit
	title = "Enclave Recruit"
	desc = "In Training!."
	flag = ENCLAVE_RECRUIT
	department_head = list("colonel", "lieutenant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "recruit"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	required_items = list(
	/obj/item/clothing/suit/armor/f13/combat_mk2,
	/obj/item/clothing/head/helmet/f13/combat_mk2
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

	outfit = /datum/outfit/job/enclave_private

	access = list(70)

/datum/job/enclave_recruit/after_spawn(mob/living/carbon/human/H)
	. = ..()
	add_servant_of_ratvar(H)
