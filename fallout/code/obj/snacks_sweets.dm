/obj/item/food/snacks/candy_corn
	name = "candy corn"
	desc = "It's a handful of candy corn."
	icon_state = "candy_corn"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/sugar = 2
	)
	//filling_color = "#FF8C00"
	tastes = list("candy corn" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/chocolatebar
	name = "chocolate bar"
	desc = "Such, sweet, fattening food."
	icon_state = "chocolatebar"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 2
	)
	//filling_color = "#A0522D"
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/mint
	name = "mint"
	desc = "It is only wafer thin."
	icon_state = "mint"
	//bitesize = 1
	food_reagents = list(
		/datum/reagent/toxin/minttoxin = 2
	)
	//filling_color = "#800000"
	foodtypes = TOXIC | SUGAR

/obj/item/food/snacks/chococoin
	name = "chocolate coin"
	desc = "A completely edible festive coin."
	icon_state = "chococoin"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3,
	/datum/reagent/consumable/coco = 1)
	//filling_color = "#A0522D"
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/fudgedice
	name = "fudge dice"
	desc = "A little cube of chocolate that tends to have a less intense taste if you eat too many at once."
	icon_state = "chocodice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/coco = 1
	)
	//filling_color = "#A0522D"
	tastes = list("fudge" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/chocoorange
	name = "chocolate orange"
	desc = "A festive chocolate orange."
	icon_state = "chocoorange"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 1
	)
	//filling_color = "#A0522D"
	tastes = list("chocolate" = 3, "oranges" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/tinychocolate
	name = "chocolate"
	desc = "A tiny and sweet chocolate. Has a 'strawberry' filling!"
	icon_state = "tiny_chocolate"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 1,
		/datum/reagent/consumable/coco = 1
	)
	//filling_color = "#A0522D"
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/snacks/bonbon
	name = "bon bon"
	desc = "A tiny and sweet chocolate."
	icon_state = "tiny_chocolate"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 1,
		/datum/reagent/consumable/coco = 1
	)
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/snacks/bonbon/caramel_truffle
	name = "caramel truffle"
	desc = "A bite-sized chocolate truffle with a chewy caramel filling."
	icon_state = "caramel_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3
	)
	tastes = list("chocolate" = 1, "chewy caramel" = 1)

/obj/item/food/snacks/bonbon/chocolate_truffle
	name = "chocolate truffle"
	desc = "A bite-sized chocolate truffle with a rich chocolate mousse filling."
	icon_state = "chocolate_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3
	)

/obj/item/food/snacks/bonbon/peanut_truffle
	name = "peanut truffle"
	desc = "A bite-sized chocolate truffle with crunchy peanuts mixed in."
	icon_state = "peanut_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3
	)
	tastes = list("chocolate" = 1, "peanuts" = 1)
	foodtypes = DAIRY | SUGAR | JUNKFOOD

/obj/item/food/snacks/bonbon/peanut_butter_cup
	name = "peanut butter cup"
	desc = "An ultra-sweet chocolate treat with a savory peanut butter filling."
	icon_state = "peanut_butter_cup"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3
	)
	tastes = list("chocolate" = 1, "peanut butter" = 1)
	foodtypes = DAIRY | SUGAR | JUNKFOOD

/obj/item/food/snacks/lollipop
	name = "lollipop"
	desc = "A delicious lollipop. Makes for a great Valentine's present."
	icon = 'fallout/icons/obj/lollipop.dmi'
	icon_state = "lollipop_stick"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/iron = 10,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/omnizine = 2
	)//Honk
	var/mutable_appearance/head
	var/headcolor = rgb(0, 0, 0)
	tastes = list("candy" = 1)
	foodtypes = JUNKFOOD | SUGAR | ANTITOXIC

/obj/item/food/snacks/lollipop/Initialize()
	. = ..()
	head = mutable_appearance('fallout/icons/obj/lollipop.dmi', "lollipop_head")
	change_head_color(rgb(rand(0, 255), rand(0, 255), rand(0, 255)))

/obj/item/food/snacks/lollipop/proc/change_head_color(C)
	headcolor = C
	cut_overlay(head)
	head.color = C
	add_overlay(head)

/obj/item/food/snacks/lollipop/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..(hit_atom)
	throw_speed = 1
	throwforce = 0

/obj/item/food/snacks/lollipop/cyborg
	var/spamchecking = TRUE

/obj/item/food/snacks/lollipop/cyborg/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/spamcheck), 1200)

/obj/item/food/snacks/lollipop/cyborg/equipped(mob/living/user, slot)
	. = ..(user, slot)
	spamchecking = FALSE

/obj/item/food/snacks/lollipop/cyborg/proc/spamcheck()
	if(spamchecking)
		qdel(src)

/obj/item/food/snacks/gumball
	name = "gumball"
	desc = "A colorful, sugary gumball."
	icon = 'fallout/icons/obj/lollipop.dmi'
	icon_state = "gumball"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/bicaridine = 2,
		/datum/reagent/medicine/kelotane = 2
		)	//Kek
	tastes = list("candy")
	foodtypes = JUNKFOOD

/obj/item/food/snacks/gumball/Initialize()
	. = ..()
	color = rgb(rand(0, 255), rand(0, 255), rand(0, 255))

/obj/item/food/snacks/gumball/cyborg
	var/spamchecking = TRUE

/obj/item/food/snacks/gumball/cyborg/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/spamcheck), 1200)

/obj/item/food/snacks/gumball/cyborg/equipped(mob/living/user, slot)
	. = ..(user, slot)
	spamchecking = FALSE

/obj/item/food/snacks/gumball/cyborg/proc/spamcheck()
	if(spamchecking)
		qdel(src)

/obj/item/food/snacks/spiderlollipop
	name = "spider lollipop"
	desc = "Still gross, but at least it has a mountain of sugar on it."
	icon_state = "spiderlollipop"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/toxin = 1,
		/datum/reagent/iron = 10,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/omnizine = 2
	) //lollipop, but vitamins = toxins
	//filling_color = "#00800"
	tastes = list("cobwebs" = 1, "sugar" = 2)
	foodtypes = JUNKFOOD | SUGAR | ANTITOXIC

/obj/item/food/snacks/candiedapple
	name = "candied apple"
	desc = "An apple coated in sugary sweetness."
	icon_state = "candiedapple"
	//bitesize = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 2
	)
	//filling_color = "#FF4500"
	tastes = list("apple" = 2, "sweetness" = 2)
	foodtypes = JUNKFOOD | FRUIT | SUGAR
