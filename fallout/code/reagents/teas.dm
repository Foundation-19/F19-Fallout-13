//fallout teas

/datum/reagent/consumable/tea/agavetea
	name = "Agave Tea"
	description = "A soothing herbal rememedy steeped from the Agave Plant. Inhibits increased healing of burns and sores."
	color = "#FFFF91"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	name = "Agave Tea"
	description = "A soothing herbal rememedy steeped from the Agave Plant. Inhibits increased healing of burns and sores."

/datum/reagent/consumable/tea/agavetea/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-3*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/broctea
	name = "Broc Tea"
	description = "A soothing herbal rememedy steeped from the Broc Flower. Increases the clearance and flow of airways."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	name = "Broc Tea"
	description = "A soothing herbal rememedy steeped from the Broc Flower. Increases the clearance and flow of airways."

/datum/reagent/consumable/tea/broctea/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-4*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE



/datum/reagent/consumable/tea/coyotetea
	name = "Coyote Tea"
	description = "A smokey herbal rememedy steeped from coyote tobacco stems. Natural caffeines keep the drinker alert and awake while numbing the senses."
	color = "#008000"
	nutriment_factor = 0
	taste_description = "smoke"
	glass_icon_state = "coyotetea"
	name = "Coyote Tea"
	description = "A smokey herbal rememedy steeped from coyote tobacco stems. Natural caffeines keep the drinker alert and awake while numbing the senses."

/datum/reagent/consumable/tea/coyotetea/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		var/smoke_message = pick("You feel relaxed.", "You feel calmed.","You feel alert.","You feel rugged.")
		to_chat(M, span_notice("[smoke_message]"))
	M.AdjustStun(-40, 0)
	M.AdjustKnockdown(-40, 0)
	M.AdjustUnconscious(-40, 0)
	M.adjustStaminaLoss(-1*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/feratea
	name = "Barrel Tea"
	description = "A sour and dry rememedy steeped from barrel cactus fruit. Detoxifies the user through natural filteration and dehydration."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	name = "Barrel Tea"
	description = "A sour and dry rememedy steeped from barrel cactus fruit. Detoxifies the user through natural filteration and dehydration."

/datum/reagent/consumable/tea/feratea/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.Dizzy(-2)
		M.Jitter(-2)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.type,2.5)
	if(M.health > 20)
		M.adjustToxLoss(-3*REAGENTS_EFFECT_MULTIPLIER, 0)
		. = TRUE
	M.radiation += 0.1
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/pricklytea
	name = "Prickly Tea"
	description = "A sweet and fruity rememedy steeped from prickly pear fruit. Keeps you on edge."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "sweetness"
	glass_icon_state = "cafe_latte"
	name = "Prickly Tea"
	description = "A sweet and fruity rememedy steeped from prickly pear fruit. Keeps you on edge."

/datum/reagent/consumable/tea/pricklytea/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/xandertea
	name = "Xander Tea"
	description = "A engaging herbal rememedy steeped from blitzed Xander root. Detoxifies and replenishes the bodies blood supply."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "earthy"
	glass_icon_state = "coffee"
	name = "Xander Tea"
	description = "A engaging herbal rememedy steeped from blitzed Xander root. Detoxifies and replenishes the bodies blood supply."

/datum/reagent/consumable/tea/xandertea/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(BLOOD_VOLUME_NORMAL, M.blood_volume + 3)
	M.adjustToxLoss(-4*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE
