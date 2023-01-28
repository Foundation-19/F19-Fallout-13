/obj/proc/setup_armor_values()
	if(!armor)
		return
	if(!islist(armor))
		return
	if(length(armor_tokens) < 1)
		return // all done!

	for(var/list/token in armor_tokens)
		for(var/modifier in token)
			switch(GLOB.armor_token_operation_legend[modifier])
				if("MULT")
					armor[modifier] = round(armor[modifier] * token[modifier], 1)
				if("ADD")
					armor[modifier] += token[modifier]
				else
					continue
