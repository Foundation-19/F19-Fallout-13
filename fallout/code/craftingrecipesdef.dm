/datum/crafting_recipe

	var/list/tools = list() //type paths of items needed but not consumed

/datum/crafting_recipe/New()
	if(!(result in reqs))
		blacklist += result