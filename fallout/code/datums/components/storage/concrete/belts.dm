/// Generic belt
/datum/component/storage/concrete/belt
	max_items = STORAGE_BELT_GENERIC_MAX_ITEMS
	max_w_class = STORAGE_BELT_GENERIC_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_GENERIC_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_GENERIC_MAX_TOTAL_SPACE

/// Specialized belt
/datum/component/storage/concrete/belt/specialized
	max_items = STORAGE_BELT_SPECIALIZED_MAX_ITEMS
	max_w_class = STORAGE_BELT_SPECIALIZED_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_SPECIALIZED_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_SPECIALIZED_MAX_TOTAL_SPACE

/// Utility Belt
/datum/component/storage/concrete/belt/specialized/utility/Initialize()
	. = ..()
	can_hold = GLOB.toolbelt_allowed

/// Medibelt
/datum/component/storage/concrete/belt/specialized/medical/Initialize()
	. = ..()
	can_hold = GLOB.medibelt_allowed

/// Bandolier
/datum/component/storage/concrete/belt/specialized/bandolier
	max_items = STORAGE_BELT_HOLSTER_MAX_ITEMS
	max_w_class = STORAGE_BELT_HOLSTER_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE

/datum/component/storage/concrete/belt/specialized/bandolier/Initialize()
	. = ..()
	can_hold = GLOB.ammobelt_allowed

/// Webbing
/datum/component/storage/concrete/belt/webbing
	max_items = STORAGE_BELT_WEBBING_MAX_ITEMS
	max_w_class = STORAGE_BELT_WEBBING_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_WEBBING_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_WEBBING_MAX_TOTAL_SPACE

/datum/component/storage/concrete/belt/webbing/Initialize()
	. = ..()
	can_hold = GLOB.ammobelt_allowed

/// Holster
/datum/component/storage/concrete/belt/specialized/gun
	max_items = STORAGE_BELT_HOLSTER_MAX_ITEMS
	max_w_class = STORAGE_BELT_HOLSTER_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE

/datum/component/storage/concrete/belt/specialized/gun/Initialize()
	. = ..()
	can_hold = GLOB.holster_allowed
