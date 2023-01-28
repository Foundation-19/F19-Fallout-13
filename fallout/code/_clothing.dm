/obj/item/clothing
	/// Required tool behavior to salvage the item
	var/salvage_tool_behavior = TOOL_SAW
	/// Items that are dropped on salvage; If it's empty - item can't salvaged
	var/list/salvage_loot = list()
	var/pocket_storage_component_path

/obj/item/clothing/head/helmet
	var/list/protected_zones = list(BODY_ZONE_HEAD)