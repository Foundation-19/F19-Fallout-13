/datum/status_effect/ghoulheal //the actual healing is handled in ghoul.dm
	id = "ghoulheal"
	duration = -1
	alert_type = /obj/screen/alert/status_effect/ghoulheal

/datum/status_effect/ghoulheal/tick()
	if(owner.health != owner.maxHealth)
		new /obj/effect/temp_visual/heal(get_turf(src), "#0f9600")

/obj/screen/alert/status_effect/ghoulheal
	name = "Radiation Healing"
	desc = "You are regenerating from radiation. The more radiation you accumulate, the faster you will heal, and the slower you will move. Don't accumulate too much."
	icon_state = "fleshmend"
