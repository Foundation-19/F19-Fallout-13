// /datum/component/container_item
/// (atom/container, mob/user) - returns bool
#define COMSIG_CONTAINER_TRY_ATTACH "container_try_attach"

#define COMSIG_UPGRADE_APPVAL "apply_values"					//from /atom/refresh_upgrades(): (/src) Called to upgrade specific values
#define COMSIG_UPGRADE_ADDVAL "add_values" 						//from /atom/refresh_upgrades(): (/src) Called to add specific things to the /src, called before COMSIG_APPVAL
