/datum/mood_event/used_drugs //for NCR, BOS, Enclave
	description = span_boldwarning("I'm nothing but a filthy junkie...")
	mood_change = -12
	timeout = 2 MINUTES

/datum/mood_event/betrayed_caesar //for Legion, obviously
	description = span_boldwarning("I have betrayed the will of Caesar and defiled my body!")
	mood_change = -25
	timeout = 5 MINUTES

/datum/mood_event/jet_euphoria
	description = span_nicegreen("I feel like i'm flying...")
	mood_change = 25
	timeout = 15 MINUTES