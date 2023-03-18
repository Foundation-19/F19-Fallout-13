/datum/reagent
	var/pH = 7							//pH of the specific reagent, used for calculating the sum pH of a holder.
	var/value = REAGENT_VALUE_NONE //How much does it sell for in cargo?

/datum/reagent/consumable/ethanol/rotgut
	name = "Rotgut"
	description = "The folks out west started outfitting their vehicles with rot gut engines to get around. A waste of a tasty drink if you ask me"
	boozepwr = 200 //strong enough to kill you, and second only to bacchus blessing
	quality = DRINK_VERYGOOD
	taste_description = "noxious fumes, burning pain, and a hint of sweetness"
	glass_icon_state = "whiskeyglass" //iirc there should be a sprite now
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/strawberryjuice
	name = "Strawberry Juice"
	description = "Refreshing seasonal summer drink."
	color = "#E50D31"
	taste_description = "strawberry"

/datum/reagent/fuel/holyoil		//Its oil
	name = "Zelus Oil"
	description = "Oil blessed by a greater being."
	taste_description = "metallic oil"
	value = REAGENT_VALUE_RARE
	ghoulfriendly = TRUE

/datum/reagent/fuel/holyoil/on_mob_life(mob/living/carbon/M)
	if(is_servant_of_ratvar(M))
		M.drowsyness = max(M.drowsyness-5, 0)
		M.AdjustUnconscious(-60, FALSE)
		M.AdjustAllImmobility(-30, FALSE)
		M.AdjustKnockdown(-40, FALSE)
		M.adjustStaminaLoss(-15, FALSE)
		M.adjustToxLoss(-5, FALSE, TRUE)
		M.adjustOxyLoss(-3, FALSE)
		M.adjustBruteLoss(-3, FALSE)
		M.adjustFireLoss(-5, FALSE)
	if(iscultist(M))
		M.AdjustUnconscious(1, FALSE)
		M.AdjustAllImmobility(10, FALSE)
		M.AdjustKnockdown(10, FALSE)
		M.adjustStaminaLoss(15, FALSE)
	else
		M.adjustToxLoss(3, FALSE)
		M.adjustOxyLoss(2, FALSE)
		M.adjustStaminaLoss(10, FALSE)
		holder.remove_reagent(type, 1)
	return TRUE

//We only get 30u to start with...

/datum/reagent/fuel/holyoil/reaction_obj(obj/O, reac_volume)
	. = ..()
	if(istype(O, /obj/item/stack/sheet/iron))
		var/obj/item/stack/sheet/iron/M = O
		reac_volume = min(reac_volume, M.amount)
		new/obj/item/stack/tile/silver(get_turf(M), reac_volume)
		M.use(reac_volume)
