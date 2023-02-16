/// How much stamina this takes to swing this is not for realism purposes hecc off.
/obj/item/proc/getweight(mob/living/user, multiplier = 1, trait = SKILL_STAMINA_COST)
	. = (total_mass || w_class * STAM_COST_W_CLASS_MULT) * multiplier
	if(!user)
		return
	var/bad_trait
	if(SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE))
		. *= STAM_COST_NO_COMBAT_MULT
		bad_trait = SKILL_COMBAT_MODE
	if(used_skills && user.mind)
		. = user.mind.item_action_skills_mod(src, ., skill_difficulty, trait, bad_trait, FALSE)
	var/total_health = user.getStaminaLoss()
	. = clamp(., 0, STAMINA_NEAR_CRIT - total_health)
