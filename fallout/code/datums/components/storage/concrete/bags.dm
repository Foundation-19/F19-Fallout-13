/datum/component/storage/concrete/bag
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	display_numerical_stacking = FALSE
	click_gather = TRUE
	insert_preposition = "in"
	max_items = STORAGE_BAG_MAX_ITEMS
	max_w_class = STORAGE_BAG_MAX_SIZE
	max_combined_w_class = STORAGE_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_BAG_MAX_TOTAL_SPACE

/datum/component/storage/concrete/bag/book/Initialize()
	. = ..()
	can_hold = typecacheof(list(/obj/item/book, /obj/item/storage/book, /obj/item/spellbook))

/datum/component/storage/concrete/bag/chem_med_etc/Initialize()
	. = ..()
	can_hold = GLOB.medibelt_allowed

/datum/component/storage/concrete/bag/produce
	storage_flags = STORAGE_FLAGS_LEGACY_DEFAULT
	display_numerical_stacking = TRUE
	max_items = STORAGE_TRASH_BAG_MAX_ITEMS
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = STORAGE_TRASH_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_TRASH_BAG_MAX_TOTAL_SPACE

/datum/component/storage/concrete/bag/produce/Initialize()
	. = ..()
	can_hold = GLOB.storage_produce_bag_can_hold

/datum/component/storage/concrete/bag/salvage
	storage_flags = STORAGE_FLAGS_LEGACY_DEFAULT
	display_numerical_stacking = TRUE
	max_items = STORAGE_BIG_TRASH_BAG_MAX_ITEMS
	max_w_class = WEIGHT_CLASS_GIGANTIC
	max_combined_w_class = STORAGE_BIG_TRASH_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_BIG_TRASH_BAG_MAX_TOTAL_SPACE

/datum/component/storage/concrete/bag/salvage/Initialize()
	. = ..()
	can_hold = typecacheof(list(/obj/item/salvage))

/datum/component/storage/concrete/bag/salvage/storage/Initialize()
	. = ..()
	can_hold = GLOB.storage_salvage_storage_bag_can_hold

/datum/component/storage/concrete/bag/casing
	storage_flags = STORAGE_FLAGS_LEGACY_DEFAULT
	display_numerical_stacking = TRUE
	max_items = STORAGE_CASING_BAG_MAX_ITEMS
	max_w_class = STORAGE_CASING_BAG_MAX_SIZE
	max_combined_w_class = STORAGE_CASING_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_CASING_BAG_MAX_TOTAL_SPACE

/datum/component/storage/concrete/bag/casing/Initialize()
	. = ..()
	can_hold = typecacheof(list(/obj/item/ammo_casing))
	cant_hold = typecacheof(list(/obj/item/ammo_casing/caseless/arrow))

/datum/component/storage/concrete/bag/quiver
	storage_flags = STORAGE_FLAGS_LEGACY_DEFAULT
	display_numerical_stacking = TRUE
	max_items = STORAGE_CASING_QUIVER_MAX_ITEMS
	max_w_class = STORAGE_CASING_QUIVER_MAX_SIZE
	max_combined_w_class = STORAGE_CASING_QUIVER_MAX_TOTAL_SPACE
	max_volume = STORAGE_CASING_QUIVER_MAX_TOTAL_SPACE

/datum/component/storage/concrete/bag/quiver/Initialize()
	. = ..()
	can_hold = typecacheof(list(/obj/item/ammo_casing/caseless/arrow))

/datum/component/storage/concrete/bag/trash
	max_items = STORAGE_TRASH_BAG_MAX_ITEMS
	max_w_class = STORAGE_TRASH_BAG_MAX_SIZE
	max_combined_w_class = STORAGE_TRASH_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_TRASH_BAG_MAX_TOTAL_SPACE
	storage_flags = STORAGE_FLAGS_LEGACY_DEFAULT
	display_numerical_stacking = TRUE
	limited_random_access = TRUE
	limited_random_access_stack_position = 3

/datum/component/storage/concrete/bag/trash/Initialize()
	. = ..()
	can_hold_extra = typecacheof(list(/obj/item/organ/internal/lungs, /obj/item/organ/internal/liver, /obj/item/organ/internal/stomach, /obj/item/clothing/shoes)) - typesof(/obj/item/clothing/shoes/magboots, /obj/item/clothing/shoes/jackboots, /obj/item/clothing/shoes/workboots)
	cant_hold = typecacheof(list(/obj/item/disk/nuclear, /obj/item/storage/wallet, /obj/item/organ/internal/brain))

/datum/component/storage/concrete/bag/trash/big
	max_items = STORAGE_BIG_TRASH_BAG_MAX_ITEMS
	max_w_class = STORAGE_BIG_TRASH_BAG_MAX_SIZE
	max_combined_w_class = STORAGE_BIG_TRASH_BAG_MAX_TOTAL_SPACE
	max_volume = STORAGE_BIG_TRASH_BAG_MAX_TOTAL_SPACE
	limited_random_access_stack_position = 5
