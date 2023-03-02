/mob/living/simple_animal/hostile/hellpig
	name = "hellpig"
	desc = "A mutated American boar, sporting razor sharp tucks and a nasty temper."
	icon = 'fallout/code/modular_coyote/icons/mob/hellpig.dmi'
	icon_state = "hellpig"
	icon_living = "hellpig"
	icon_dead = "hellpig_dead"
	maxHealth = 500
	health = 500
	melee_damage_lower = 20
	melee_damage_upper = 40
	footstep_type = FOOTSTEP_MOB_HEAVY
	wound_bonus = 5
	bare_wound_bonus = 25
	faction = list("yaoguai")
	emote_taunt = list('fallout/sound/f13npc/deathclaw/taunt.ogg')
//	aggrosound = list('fallout/sound/f13npc/deathclaw/aggro1.ogg', 'fallout/sound/f13npc/deathclaw/aggro2.ogg', )
//	idlesound = list('fallout/sound/f13npc/deathclaw/idle.ogg',)
	death_sound = list('fallout/sound/f13npc/hellpig/hellpigdead.ogg',)
	guaranteed_butcher_results = list(/obj/item/food/snacks/meat/slab = 10, /obj/item/stack/sheet/bone = 6,)
	butcher_results = list(/obj/item/food/snacks/meat/slab = 4, /obj/item/stack/sheet/bone = 2,)
	butcher_difficulty = 1

