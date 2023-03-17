#define TYPING_INDICATOR_TIMEOUT 20 MINUTES

/mob
	var/gang = null // A gang a mob is in
	///////TYPING INDICATORS///////
	/// Set to true if we want to show typing indicators.
	var/typing_indicator_enabled = FALSE
	/// Default icon_state of our typing indicator. Currently only supports paths (because anything else is, as of time of typing this, unnecesary.
	var/typing_indicator_state = /obj/effect/overlay/typing_indicator
	/// The timer that will remove our indicator for early aborts (like when an user finishes their message)
	var/typing_indicator_timerid
	var/mutable_appearance/typing_indicator_current
	var/damage_threshold_penetration_mob = 0
	var/list/possible_a_intents = null//Living
