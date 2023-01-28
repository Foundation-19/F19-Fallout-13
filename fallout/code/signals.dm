#define COMSIG_MOB_CLIENT_LOGIN "mob_client_login"					//sent when a mob/login() finishes: (client)
#define COMSIG_MOB_CLIENT_LOGOUT "mob_client_logout"				//sent when a mob/logout() starts: (client)
#define COMSIG_MOB_CLIENT_CHANGE_VIEW "mob_client_change_view"		//from base of /client/change_view(): (client, old_view, view)
#define COMSIG_MOB_CLIENT_MOUSEMOVE "mob_client_mousemove"			//from base of /client/MouseMove(): (object, location, control, params)


#define COMSIG_UPGRADE_APPVAL "apply_values"					//from /atom/refresh_upgrades(): (/src) Called to upgrade specific values
#define COMSIG_UPGRADE_ADDVAL "add_values" 						//from /atom/refresh_upgrades(): (/src) Called to add specific things to the /src, called before COMSIG_APPVAL
#define COMSIG_UPGRADE_REMOVE "uninstall"
#define COMSIG_ITEM_ATTACK_OBJ_NOHIT "item_attack_obj_nohit"
#define COMSIG_DISABLE_COMBAT_MODE "disable_combat_mode"			//safely disables combat mode.



// /datum/component/storage signals
#define COMSIG_CONTAINS_STORAGE "is_storage"						//() - returns bool.
#define COMSIG_TRY_STORAGE_INSERT "storage_try_insert"				//(obj/item/inserting, mob/user, silent, force) - returns bool
#define COMSIG_TRY_STORAGE_SHOW "storage_show_to"					//(mob/show_to, force) - returns bool.
#define COMSIG_TRY_STORAGE_HIDE_FROM "storage_hide_from"			//(mob/hide_from) - returns bool
#define COMSIG_TRY_STORAGE_HIDE_ALL "storage_hide_all"				//returns bool
#define COMSIG_TRY_STORAGE_SET_LOCKSTATE "storage_lock_set_state"	//(newstate)
#define COMSIG_IS_STORAGE_LOCKED "storage_get_lockstate"			//() - returns bool. MUST CHECK IF STORAGE IS THERE FIRST!
#define COMSIG_TRY_STORAGE_TAKE_TYPE "storage_take_type"			//(type, atom/destination, amount = INFINITY, check_adjacent, force, mob/user, list/inserted) - returns bool - type can be a list of types.
#define COMSIG_TRY_STORAGE_FILL_TYPE "storage_fill_type"			//(type, amount = INFINITY, force = FALSE)			//don't fuck this up. Force will ignore max_items, and amount is normally clamped to max_items.
#define COMSIG_TRY_STORAGE_TAKE "storage_take_obj"					//(obj, new_loc, force = FALSE) - returns bool
#define COMSIG_TRY_STORAGE_QUICK_EMPTY "storage_quick_empty"		//(loc) - returns bool - if loc is null it will dump at parent location.
#define COMSIG_TRY_STORAGE_RETURN_INVENTORY "storage_return_inventory"	//(list/list_to_inject_results_into, recursively_search_inside_storages = TRUE)
#define COMSIG_TRY_STORAGE_CAN_INSERT "storage_can_equip"			//(obj/item/insertion_candidate, mob/user, silent) - returns bool


#define COMPONENT_NO_ATTACK_HAND 1							//works on all 3.