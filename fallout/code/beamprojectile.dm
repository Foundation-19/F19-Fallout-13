//musket
/obj/projectile/beam/laser/musket //musket
	name = "laser beam"
	damage = 45
	hitscan = TRUE
	pixels_per_second = TILES_TO_PIXELS(50)

//Securitrons Beam
/obj/projectile/beam/laser/pistol/ultraweak
	damage = 15 //quantity over quality

//Alrem's plasmacaster
/obj/projectile/f13plasma/plasmacaster/arlem
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 60
	armour_penetration = BULLET_PENETRATION_ABSOLUTE
	flag = "laser"
	eyeblur = 0
	is_reflectable = FALSE
	pixels_per_second = TILES_TO_PIXELS(50)

//Lasers
/obj/projectile/beam/laser/pistol/wattz //Wattz pistol
	damage = 31

/obj/projectile/beam/laser/pistol/wattz/magneto //upgraded Wattz
	name = "penetrating laser beam"
	damage = 33

/obj/projectile/beam/laser/pistol //AEP7
	name = "laser beam"
	damage = 35

/obj/projectile/beam/laser/recharger/hitscan //hitscan recharger pistol
	name = "recharger beam"
	damage = 24
	hitscan = TRUE
	armour_penetration = BULLET_PENETRATION_LOW
	damage_threshold_penetration = BULLET_DT_PENETRATION_PISTOL
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE


/obj/projectile/beam/laser/rechargerrifle/hitscan //histcan recharger rifle
	name = "recharger beam"
	damage = 19
	hitscan = TRUE
	armour_penetration = BULLET_PENETRATION_LOW
	damage_threshold_penetration = BULLET_DT_PENETRATION_PISTOL
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/projectile/beam/laser/lasgun //AER9
	name = "laser beam"
	damage = 33

/obj/projectile/beam/laser/tribeam //Tribeam laser, fires 3 shots, will melt you
	name = "tribeam laser"
	damage = 21

/obj/projectile/beam/laser/wattz2k
	name = "laser bolt"
	damage = 35

/obj/projectile/beam/laser/aer12 //AER12
	name = "laser beam"
	damage = 30
	icon_state = "xray"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN

/obj/projectile/beam/laser/aer14 //AER14
	name = "laser beam"
	damage = 38
	icon_state = "omnilaser"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/projectile/beam/laser/rcw //RCW
	name = "rapidfire beam"
	icon_state = "xray"
	damage = 30
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN

//Actual used lasers

/obj/projectile/beam/laser/pistol/wattz/hitscan //hitscan wattz
	name = "weak laser beam"
	damage = 12
	armour_penetration = BULLET_PENETRATION_LOW
	damage_threshold_penetration = BULLET_DT_PENETRATION_PISTOL
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/laser/pistol/wattz/magneto/hitscan
	name = "penetrating laser beam"
	damage = 12
	hitscan = TRUE
	armour_penetration = BULLET_PENETRATION_LOW
	damage_threshold_penetration = BULLET_DT_PENETRATION_RIFLE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/laser/pistol/hitscan //hitscan AEP7
	name = "laser beam"
	damage = 15
	armour_penetration = BULLET_PENETRATION_HEAVY
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/laser/lasgun/hitscan //hitscan aer9 test
	name = "laser beam"
	damage = 20
	armour_penetration = BULLET_PENETRATION_HEAVY
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM
	hitscan = TRUE
	wound_bonus = 15
	bare_wound_bonus = 20
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/laser/lasgun/hitscan/focused
	name = "overcharged laser beam"
	damage_threshold_penetration = BULLET_DT_PENETRATION_RIFLE
	damage = 34

/obj/projectile/beam/laser/tribeam/hitscan
	name = "tribeam laser"
	damage = 20 //if all bullets connect, this will do 60
	armour_penetration = BULLET_PENETRATION_LOW // lens makes it less focused
	damage_threshold_penetration = BULLET_DT_PENETRATION_PISTOL
	hitscan = TRUE
	wound_bonus = -10
	bare_wound_bonus = -20 //tribeam is bad at wounding, as basically its only real downside
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/laser/wattz2k/hitscan
	name = "sniper laser bolt"
	damage = 28
	armour_penetration = BULLET_PENETRATION_ABSOLUTE
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM
	wound_bonus = 10
	bare_wound_bonus = 20
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser
	hitscan = TRUE

/obj/projectile/beam/laser/aer12/hitscan
	name = "laser beam"
	damage = 25
	armour_penetration = BULLET_PENETRATION_HEAVY
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM
	wound_bonus = 20
	bare_wound_bonus = 25
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = COLOR_LIME
	muzzle_flash_intensity = 6
	muzzle_flash_range = 2
	muzzle_flash_color_override = COLOR_LIME
	impact_light_intensity = 7
	impact_light_range = 2.5
	impact_light_color_override = COLOR_LIME

/obj/projectile/beam/laser/aer14/hitscan
	damage = 30
	armour_penetration = BULLET_PENETRATION_ABSOLUTE
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM
	wound_bonus = 25
	bare_wound_bonus = 30
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	hitscan = TRUE
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_BLUE
	muzzle_flash_intensity = 6
	muzzle_flash_range = 2
	muzzle_flash_color_override = LIGHT_COLOR_BLUE
	impact_light_intensity = 7
	impact_light_range = 2.5
	impact_light_color_override = LIGHT_COLOR_BLUE

/obj/projectile/beam/laser/rcw/hitscan //RCW
	name = "rapidfire beam"
	icon_state = "emitter"
	damage = 20 //Firerate for damage and wounds
	armour_penetration = BULLET_PENETRATION_LOW
	damage_threshold_penetration = BULLET_DT_PENETRATION_SMALL
	hitscan = TRUE
	muzzle_type = /obj/effect/projectile/muzzle/laser/emitter
	tracer_type = /obj/effect/projectile/tracer/laser/emitter
	impact_type = /obj/effect/projectile/impact/laser/emitter
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser

/obj/projectile/beam/laser/rcw/hitscan/autolaser //autolaser
	damage = 7

/obj/projectile/beam/laser/gatling/hitscan //Gatling Laser
	name = "laser beam"
	damage = 10
	armour_penetration = BULLET_PENETRATION_ABSOLUTE
	damage_threshold_penetration = BULLET_DT_PENETRATION_PISTOL
	hitscan = TRUE
	wound_bonus = -5
	bare_wound_bonus = -10 //designed to straight up kill people not cuddle them
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

///////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/projectile/beam/laser/pistol/hitscan/stun //compliance regulator beam
	name = "compliance beam"
	damage = 33
	damage_type = STAMINA
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler

/obj/projectile/beam/laser/ultra_pistol //unused
	name = "laser beam"
	damage = 40
	irradiate = 200

/obj/projectile/beam/laser/ultra_rifle //unused
	name = "laser beam"
	damage = 45
	irradiate = 200

/obj/projectile/beam/laser/gatling //Gatling Laser Projectile
	name = "rapid-fire laser beam"
	damage = 12

/obj/projectile/beam/laser/solar //Solar Scorcher
	name = "solar scorcher beam"
	damage = 28
	armour_penetration = 0.42

/obj/projectile/beam/laser/solar/hitscan
	name = "solar scorcher beam"
	damage = 27
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

///////////////
//F13 Plasma///
///////////////
//Why isnt this in the plasma folder?//


/obj/projectile/f13plasma //Plasma caster
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 60 //fucc you normies
	armour_penetration = 0 //no AP, armor shouldnt have more than 20 resist against plasma unless its specialized
	damage_threshold_penetration = BULLET_DT_PENETRATION_SNIPER
	flag = "energy" //checks vs. energy protection
	wound_bonus = 90 //being hit with plasma is horrific
	eyeblur = 0
	is_reflectable = TRUE
	pixels_per_second =  TILES_TO_PIXELS(10) //same as 40mm grenade


//ghetoo plasma rounds
/obj/projectile/f13plasma/plasmaghetto
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	armour_penetration = 0
	damage_threshold_penetration = BULLET_DT_PENETRATION_MEDIUM //-4 threshold
	damage = 60 //it burns!!
	flag = "energy"
	wound_bonus = 50 //higher wounding than real plasma rifle
	bare_wound_bonus = 10
	eyeblur = 0
	is_reflectable = TRUE
	pixels_per_second = TILES_TO_PIXELS(50) //way faster than regular plasma for soem reason

/obj/projectile/plasmacarbine //urban plasma rifle
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 45
	flag = "energy" //checks vs. energy protection
	damage_threshold_penetration = BULLET_DT_PENETRATION_RIFLE //ignores below combat armor, combat armor greatly reduced
	wound_bonus = 75 //almost as bad as the plasma caster
	eyeblur = 0
	is_reflectable = TRUE
	pixels_per_second = TILES_TO_PIXELS(10)

/obj/projectile/f13plasma/repeater //Plasma repeater
	name = "plasma stream"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 90
	flag = "energy" //checks vs. energy protection
	eyeblur = 0
	is_reflectable = FALSE

/obj/projectile/f13plasma/repeater/mining
	name = "mining plasma stream"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 25
	flag = "energy"
	eyeblur = 0
	is_reflectable = FALSE

/obj/projectile/f13plasma/repeater/mining/on_hit(atom/target)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer)

/obj/projectile/f13plasma/pistol //Plasma pistol
	damage = 35
	wound_bonus = 70 //being hit with plasma is horrific

/obj/projectile/f13plasma/pistol/worn
	damage = 30

/obj/projectile/f13plasma/pistol/glock //Glock (streamlined plasma pistol)
	damage = 40
	wound_bonus = 75 //being hit with plasma is horrific

/obj/projectile/f13plasma/scatter //Multiplas, fires 3 shots, will melt you
	damage = 35

/obj/projectile/f13plasma/pistol/alien
	name = "alien projectile"
	icon_state = "ion"
	damage = 90 //horrifyingly powerful, but very limited ammo
	armour_penetration = 0.8 //keeps AP, because lol aliens
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_range = 2
	light_color = LIGHT_COLOR_BLUE

/obj/projectile/beam/laser/laer //Elder's/Unique LAER
	name = "advanced laser beam"
	icon_state = "u_laser"
	damage = 45
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/projectile/beam/laser/laer/hitscan
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	hitscan = TRUE
	hitscan_light_intensity = 5
	hitscan_light_range = 1
	hitscan_light_color_override = LIGHT_COLOR_BLUE
	muzzle_flash_intensity = 8
	muzzle_flash_range = 2
	muzzle_flash_color_override = LIGHT_COLOR_BLUE
	impact_light_intensity = 10
	impact_light_range = 3
	impact_light_color_override = LIGHT_COLOR_BLUE

/obj/projectile/beam/laser/laer/hitscan/Initialize()
	. = ..()
	transform *= 2

/obj/projectile/beam/laser/musket //musket
	name = "laser bolt"
	damage = 40
	armour_penetration = 0.2



// BETA // Obsolete
/obj/projectile/beam/laser/pistol/lasertesting //Wattz pistol
	damage = 25
