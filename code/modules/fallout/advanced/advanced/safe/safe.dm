/obj/structure/safe_caps/proc/capsSet(amount)
	var/DBQuery/query = dbcon.NewQuery("UPDATE `player` SET `caps` = [amount] WHERE ckey = '[usr.ckey]'")
	query.Execute()

/obj/structure/safe_caps/proc/capsGet()
	var/DBQuery/query = dbcon.NewQuery("SELECT `caps` FROM `player` WHERE ckey = '[usr.ckey]'")
	query.Execute()

	if(query.ErrorMsg() != "")
		world.log << "SQL Error: [query.ErrorMsg()]"
	else
		if(!query.NextRow())
			return 0

		return text2num(query.item[1])

	return 0

/obj/structure/safe_caps/proc/deposit(amount)
	var/caps = capsGet()

	capsSet(caps + amount * 0.66)
	playsound(src, 'sound/items/change_jaws.ogg', 60, 1)

/obj/structure/safe_caps/proc/withdraw(amount)
	var/safe_amount = capsGet()

	if(amount > safe_amount)
		to_chat(usr, "<span class='warning'>You need more caps in safe to do this!</span>")
		return

	capsSet(safe_amount - amount)

	var/obj/item/stack/caps/target/caps = new(amount)
	caps.loc = loc

	to_chat(usr, "You get your [amount] caps.")
	playsound(src, 'sound/items/change_jaws.ogg', 60, 1)

/obj/structure/safe_caps/attackby(obj/item/I, mob/living/carbon/human/user, parameters)
	if(istype(I, /obj/item/stack/caps))
		deposit(I:amount)
		qdel(I)

	attack_hand(user)

/obj/structure/safe_caps/attack_hand(mob/user)
	showUI()

/obj/structure/safe_caps/proc/getHTML()
	. += "<style>"
	. += "body {text-align: center;} .header {font-size: 15px; font-style: italic; margin-bottom: 10px; color: #ff66ff; display: block;} .description {display: block;} .percent {color: #ff0000;} .caps {color: #ffffff;} .button {margin-left: 5px; display: inline-block; text-transform: uppercase;} body { text-align: center; background-color: #212121;}"
	. += "body {text-align: center; background-color: #212121;} body, .uiTitle, a {color: #8bc34a;} .header {color: #ffc107;} .percent {color: #e51c23;} a {background-color: #145d14;} a:hover {color: #212121; background-color: #8bc34a;}"
	. += "</style>"

	. += "<span class='header'>� ���� ���� �� ������ ��������� ���� ������ ����� ��������.</span>"
	. += "<span class='description'>����� ���� ������ � ����, �� ������� <span class='percent'>33%</span> � �������� ��������.</span>"
	. += "<span class='description'>����� �������� ������ - ���������� �������� ��� �� ����.</span>"
	. += "<span class='content'>�� ����� ����� <span class='caps'>[capsGet()]</span> ������.</span>"

	var/amount = capsGet()

	if(amount >= 10000)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=10000'>����� 10 000</a>"

	if(amount >= 5000)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=5000'>����� 5000</a>"

	if(amount >= 3000)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 3000</a>"

	if(amount >= 2000)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 2000</a>"

	if(amount >= 1000)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 1000</a>"

	if(amount >= 500)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=500'>����� 500</a>"

	if(amount >= 400)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 400</a>"

	if(amount >= 300)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 300</a>"

	if(amount >= 200)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 200</a>"

	if(amount >= 100)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=1000'>����� 100</a>"

	if(amount >= 50)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=50'>����� 50</a>"

	if(amount >= 10)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=10'>����� 10</a>"

	if(amount > 0)
		. += "<a class='button' href='byond://?src=\ref[src];withdraw=[amount]'>����� ���</a>"

	return .

/obj/structure/safe_caps/proc/showUI()
	var/datum/browser/popup = new(usr, "vending", "Caps safe",  641, 237)
	popup.set_content(getHTML())
	popup.open()

/obj/structure/safe_caps/Topic(href, href_list)
	if(..())
		return

	if(href_list["withdraw"])
		var/amount = text2num(href_list["withdraw"])
		withdraw(amount)

	showUI()