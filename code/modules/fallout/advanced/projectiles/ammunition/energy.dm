//Fallout 13 energy guns ammo directory

/obj/item/ammo_casing/energy/f13plasma
	projectile_type = /obj/item/projectile/beam/plasma
	delay = 1
	randomspread = 1
	variance = 1
	select_name = "kill"
	e_cost = 40
	firing_effect_type = /obj/effect/overlay/temp/dir_setting/firing_effect/plasma

/obj/item/ammo_casing/energy/f13plasma/turbo
	projectile_type = /obj/item/projectile/beam/plasma/turbo
	delay = 1
	e_cost = 40
	randomspread = 1
	variance = 1

/obj/item/ammo_casing/energy/f13plasma/tri
	delay = 2
	pellets = 3
	variance = 25
	e_cost = 100 //this does not apply per pellet for some reason
	randomspread = 0
	
/obj/item/ammo_casing/energy/laser/gatling
	projectile_type = /obj/item/projectile/beam/laser/gatling
	delay = 1
	e_cost = 12.5 // 12.5 per shot, 10 per burst, 125 per full burst, 8 total bursts/80 shots with cell that has 1k energy.
	randomspread = 1
	variance = 5

/obj/item/ammo_casing/energy/laser/rcw
	delay = 1
	e_cost = 20 //20 per shot, 5 per burst, 100 per full burst, 10 total bursts/50 shots with cell that has 1k energy.
	projectile_type = /obj/item/projectile/beam/laser/rcw
	randomspread = 1
	variance = 8

/obj/item/projectile/beam/laser/rcw
	damage = 10

/obj/item/ammo_casing/energy/laser/rifle
	delay = 1
	e_cost = 25
	randomspread = 1
	variance = 1

/obj/item/ammo_casing/energy/laser/rifle/aer13
	delay = 1
	e_cost = 25
	randomspread = 1
	variance = 1

/obj/item/ammo_casing/energy/laser/rifle/tri
	delay = 2
	pellets = 5
	variance = 25
	e_cost = 100 //this does not apply per pellet for some reason
	randomspread = 0

/obj/item/ammo_casing/energy/laser/laer
	delay = 1
	e_cost = 32.5
	randomspread = 1
	projectile_type = /obj/item/projectile/beam/laser/laerbolt
	variance = 1

/obj/item/ammo_casing/energy/laser/gauss2mm
	delay = 0
	e_cost = 2250
	randomspread = 0
	projectile_type = /obj/item/projectile/beam/laser/gauss2mm
	variance = 0
