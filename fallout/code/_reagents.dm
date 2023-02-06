/// Standard reagents value defines.
/// Take a grain of salt, only "rare" reagents should have a decent value here, for balance reasons.
/// TL;DR Think of it also like general market request price more than rarity.
#define REAGENT_VALUE_NONE			0	//all the stuff pretty much available in potentially unlimited quantities.
#define REAGENT_VALUE_VERY_COMMON	0.1 //same as above, just not so unlimited.
#define REAGENT_VALUE_COMMON		0.5
#define REAGENT_VALUE_UNCOMMON		1
#define REAGENT_VALUE_RARE			2.5
#define REAGENT_VALUE_VERY_RARE		5
#define REAGENT_VALUE_EXCEPTIONAL	10	//extremely rare or tedious to craft, possibly unsynthetizable, reagents.
#define REAGENT_VALUE_AMAZING		30	//reserved ONLY for non-mass produceable, unsynthetizable reagents.
#define REAGENT_VALUE_GLORIOUS		300	//reagents that shouldn't be possible to get or farm under normal conditions. e.g. Romerol, fungal TB, adminordrazine...
