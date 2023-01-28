// mobility flag traits
// IN THE FUTURE, IT WOULD BE NICE TO DO SOMETHING SIMILAR TO https://github.com/tgstation/tgstation/pull/48923/files (ofcourse not nearly the same because I have my.. thoughts on it)
// BUT FOR NOW, THESE ARE HOOKED TO DO update_mobility() VIA COMSIG IN living_mobility.dm
// SO IF YOU ADD MORE, BESURE TO UPDATE IT THERE.

/// Disallow movement
#define TRAIT_MOBILITY_NOMOVE		"mobility_nomove"
/// Disallow pickup
#define TRAIT_MOBILITY_NOPICKUP		"mobility_nopickup"
/// Disallow item use
#define TRAIT_MOBILITY_NOUSE		"mobility_nouse"