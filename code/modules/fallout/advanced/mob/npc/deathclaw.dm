//Fallout 13 deathclaw directory

/mob/living/simple_animal/hostile/deathclaw
	name = "deathclaw"
	desc = "A huge monster. You're fucked."
	icon = 'icons/fallout/mobs/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	turns_per_move = 9
	speed = 2
	move_to_delay = 2 // this lot makes the deathclaw a LOT faster. if you are wearing even a standard amount of gear, you will not be outrunning this beasty.
	response_help = "touches"
	response_disarm = "tries to grab the deathclaw by its large"
	response_harm = "hits the deathclaw right in its large"
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw = 5, /obj/item/stack/sheet/animalhide/deathclaw=3)
	loot = list(
				/obj/item/trash/f13/deathclawtalon = 1,
				/obj/effect/decal/cleanable/blood/splatter
				)
				
	maxHealth = 650
	health = 650
	self_weight = 500
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)

	faction = list("hostile", "deathclaw")

	//ambient_sound = 'sound/f13npc/deathclaw_loop.ogg'

	sound_speak_chance = 15
	sound_speak = list('sound/f13npc/deathclaw_charge1.ogg','sound/f13npc/deathclaw_charge2.ogg','sound/f13npc/deathclaw_charge3.ogg')

	aggro_sound_chance = 100
	aggro_sound = 'sound/f13npc/deathclaw_charge1.ogg'

	death_sound = 'sound/f13npc/deathclaw_death.ogg'

	environment_smash = 3 // YOU CAN'T HIDE FROM ME
	force_threshold = 15
	melee_damage_lower = 30
	armour_penetration = 70
	melee_damage_upper = 40
	aggro_vision_range = 14
	see_in_dark = 10
	idle_vision_range = 10
	pixel_w = -16
	mob_size = MOB_SIZE_LARGE
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'
