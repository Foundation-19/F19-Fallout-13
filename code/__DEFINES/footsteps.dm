#define FOOTSTEP_WOOD "wood"
#define FOOTSTEP_FLOOR "floor"
#define FOOTSTEP_PLATING "plating"
#define FOOTSTEP_CARPET "carpet"
#define FOOTSTEP_SAND "sand"
#define FOOTSTEP_GRASS "grass"
#define FOOTSTEP_WATER "water"
#define FOOTSTEP_LAVA "lava"
#define FOOTSTEP_MEAT "meat"
#define FOOTSTEP_CATWALK "catwalk"
#define FOOTSTEP_RUST "rust"
#define FOOTSTEP_LOOSE_SAND "sand"
#define FOOTSTEP_SNOW "snow"
#define FOOTSTEP_GRAVEL "gravel"
#define FOOTSTEP_ROAD	"road"
//barefoot sounds
#define FOOTSTEP_WOOD_BAREFOOT "woodbarefoot"
#define FOOTSTEP_WOOD_CLAW "woodclaw"
#define FOOTSTEP_HARD_BAREFOOT "hardbarefoot"
#define FOOTSTEP_HARD_CLAW "hardclaw"
#define FOOTSTEP_CARPET_BAREFOOT "carpetbarefoot"
//misc footstep sounds
#define FOOTSTEP_GENERIC_HEAVY "heavy"

//footstep mob defines
#define FOOTSTEP_MOB_CLAW 1
#define FOOTSTEP_MOB_BAREFOOT 2
#define FOOTSTEP_MOB_HEAVY 3
#define FOOTSTEP_MOB_SHOE 4
#define FOOTSTEP_MOB_HUMAN 5 //Warning: Only works on /mob/living/carbon/human
#define FOOTSTEP_MOB_SLIME 6
#define FOOTSTEP_OBJ_MACHINE 7
#define FOOTSTEP_OBJ_ROBOT 8

/*

id = list(
list(sounds),
base volume,
extra range addition
)


*/

GLOBAL_LIST_INIT(footstep, list(
	FOOTSTEP_WOOD = list(list(
		'fallout/sound/footsteps/wood1.ogg',
		'fallout/sound/footsteps/wood2.ogg',
		'fallout/sound/footsteps/wood3.ogg',
		'fallout/sound/footsteps/wood4.ogg',
		'fallout/sound/footsteps/wood5.ogg'), 100, 0),
	FOOTSTEP_FLOOR = list(list(
		'fallout/sound/footsteps/floor1.ogg',
		'fallout/sound/footsteps/floor2.ogg',
		'fallout/sound/footsteps/floor3.ogg',
		'fallout/sound/footsteps/floor4.ogg',
		'fallout/sound/footsteps/floor5.ogg'), 75, -1),
	FOOTSTEP_PLATING = list(list(
		'fallout/sound/footsteps/plating1.ogg',
		'fallout/sound/footsteps/plating2.ogg',
		'fallout/sound/footsteps/plating3.ogg',
		'fallout/sound/footsteps/plating4.ogg',
		'fallout/sound/footsteps/plating5.ogg'), 100, 1),
	FOOTSTEP_CARPET = list(list(
		'fallout/sound/footsteps/carpet1.ogg',
		'fallout/sound/footsteps/carpet2.ogg',
		'fallout/sound/footsteps/carpet3.ogg',
		'fallout/sound/footsteps/carpet4.ogg',
		'fallout/sound/footsteps/carpet5.ogg'), 75, -1),
	FOOTSTEP_SAND = list(list(
		'fallout/sound/footsteps/asteroid1.ogg',
		'fallout/sound/footsteps/asteroid2.ogg',
		'fallout/sound/footsteps/asteroid3.ogg',
		'fallout/sound/footsteps/asteroid4.ogg',
		'fallout/sound/footsteps/asteroid5.ogg'), 75, 0),
	FOOTSTEP_GRASS = list(list(
		'fallout/sound/footsteps/grass1.ogg',
		'fallout/sound/footsteps/grass2.ogg',
		'fallout/sound/footsteps/grass3.ogg',
		'fallout/sound/footsteps/grass4.ogg'), 75, 0),
	FOOTSTEP_WATER = list(list(
		'fallout/sound/footsteps/water1.ogg',
		'fallout/sound/footsteps/water2.ogg',
		'fallout/sound/footsteps/water3.ogg',
		'fallout/sound/footsteps/water4.ogg'), 100, 1),
	FOOTSTEP_LAVA = list(list(
		'fallout/sound/footsteps/lava1.ogg',
		'fallout/sound/footsteps/lava2.ogg',
		'fallout/sound/footsteps/lava3.ogg'), 100, 0),
	FOOTSTEP_MEAT = list(list(
		'sound/effects/meatslap.ogg'), 100, 0),
	FOOTSTEP_CATWALK = list(list(
		'fallout/sound/footsteps/catwalk1.ogg',
		'fallout/sound/footsteps/catwalk2.ogg',
		'fallout/sound/footsteps/catwalk3.ogg',
		'fallout/sound/footsteps/catwalk4.ogg',
		'fallout/sound/footsteps/catwalk5.ogg'), 100, 1),
	FOOTSTEP_RUST = list(list(
		'fallout/sound/footsteps/hull1.ogg',
		'fallout/sound/footsteps/hull2.ogg',
		'fallout/sound/footsteps/hull3.ogg',
		'fallout/sound/footsteps/hull4.ogg',
		'fallout/sound/footsteps/hull5.ogg'), 100, 1),
	FOOTSTEP_SNOW = list(list(
		'fallout/sound/footsteps/snow1.ogg',
		'fallout/sound/footsteps/snow2.ogg',
		'fallout/sound/footsteps/snow3.ogg',
		'fallout/sound/footsteps/snow4.ogg',
		'fallout/sound/footsteps/snow5.ogg'), 100, 1),
	FOOTSTEP_GRAVEL = list(list(
		'fallout/sound/footsteps/gravel1.ogg',
		'fallout/sound/footsteps/gravel2.ogg',
		'fallout/sound/footsteps/gravel3.ogg',
		'fallout/sound/footsteps/gravel4.ogg'), 40, 1),
	FOOTSTEP_LOOSE_SAND = list(list(
		'fallout/sound/footsteps/sand1.ogg',
		'fallout/sound/footsteps/sand2.ogg',
		'fallout/sound/footsteps/sand3.ogg',
		'fallout/sound/footsteps/sand4.ogg'), 100, 1),
	FOOTSTEP_ROAD = list(list(
		'fallout/sound/footsteps/road_walk1.ogg',
		'fallout/sound/footsteps/road_walk2.ogg',
		'fallout/sound/footsteps/road_walk3.ogg',
		'fallout/sound/footsteps/road_walk4.ogg',
		'fallout/sound/footsteps/road_walk5.ogg',
		'fallout/sound/footsteps/road_walk6.ogg'), 50, 1),
))
//bare footsteps lists
GLOBAL_LIST_INIT(barefootstep, list(
	FOOTSTEP_WOOD_BAREFOOT = list(list(
		'fallout/sound/footsteps/woodbarefoot1.ogg',
		'fallout/sound/footsteps/woodbarefoot2.ogg',
		'fallout/sound/footsteps/woodbarefoot3.ogg',
		'fallout/sound/footsteps/woodbarefoot4.ogg',
		'fallout/sound/footsteps/woodbarefoot5.ogg'), 80, -1),
	FOOTSTEP_HARD_BAREFOOT = list(list(
		'fallout/sound/footsteps/hardbarefoot1.ogg',
		'fallout/sound/footsteps/hardbarefoot2.ogg',
		'fallout/sound/footsteps/hardbarefoot3.ogg',
		'fallout/sound/footsteps/hardbarefoot4.ogg',
		'fallout/sound/footsteps/hardbarefoot5.ogg'), 80, -1),
	FOOTSTEP_CARPET_BAREFOOT = list(list(
		'fallout/sound/footsteps/carpetbarefoot1.ogg',
		'fallout/sound/footsteps/carpetbarefoot2.ogg',
		'fallout/sound/footsteps/carpetbarefoot3.ogg',
		'fallout/sound/footsteps/carpetbarefoot4.ogg',
		'fallout/sound/footsteps/carpetbarefoot5.ogg'), 75, -2),
	FOOTSTEP_SAND = list(list(
		'fallout/sound/footsteps/asteroid1.ogg',
		'fallout/sound/footsteps/asteroid2.ogg',
		'fallout/sound/footsteps/asteroid3.ogg',
		'fallout/sound/footsteps/asteroid4.ogg',
		'fallout/sound/footsteps/asteroid5.ogg'), 75, 0),
	FOOTSTEP_GRASS = list(list(
		'fallout/sound/footsteps/grass1.ogg',
		'fallout/sound/footsteps/grass2.ogg',
		'fallout/sound/footsteps/grass3.ogg',
		'fallout/sound/footsteps/grass4.ogg'), 75, 0),
	FOOTSTEP_WATER = list(list(
		'fallout/sound/footsteps/water1.ogg',
		'fallout/sound/footsteps/water2.ogg',
		'fallout/sound/footsteps/water3.ogg',
		'fallout/sound/footsteps/water4.ogg'), 100, 1),
	FOOTSTEP_LAVA = list(list(
		'fallout/sound/footsteps/lava1.ogg',
		'fallout/sound/footsteps/lava2.ogg',
		'fallout/sound/footsteps/lava3.ogg'), 100, 0),
	FOOTSTEP_MEAT = list(list(
		'sound/effects/meatslap.ogg'), 100, 0),
))

//claw footsteps lists
GLOBAL_LIST_INIT(clawfootstep, list(
	FOOTSTEP_WOOD_CLAW = list(list(
		'fallout/sound/footsteps/woodclaw1.ogg',
		'fallout/sound/footsteps/woodclaw2.ogg',
		'fallout/sound/footsteps/woodclaw3.ogg',
		'fallout/sound/footsteps/woodclaw2.ogg',
		'fallout/sound/footsteps/woodclaw1.ogg'), 90, 1),
	FOOTSTEP_HARD_CLAW = list(list(
		'fallout/sound/footsteps/hardclaw1.ogg',
		'fallout/sound/footsteps/hardclaw2.ogg',
		'fallout/sound/footsteps/hardclaw3.ogg',
		'fallout/sound/footsteps/hardclaw4.ogg',
		'fallout/sound/footsteps/hardclaw1.ogg'), 90, 1),
	FOOTSTEP_CARPET_BAREFOOT = list(list(
		'fallout/sound/footsteps/carpetbarefoot1.ogg',
		'fallout/sound/footsteps/carpetbarefoot2.ogg',
		'fallout/sound/footsteps/carpetbarefoot3.ogg',
		'fallout/sound/footsteps/carpetbarefoot4.ogg',
		'fallout/sound/footsteps/carpetbarefoot5.ogg'), 75, -2),
	FOOTSTEP_SAND = list(list(
		'fallout/sound/footsteps/asteroid1.ogg',
		'fallout/sound/footsteps/asteroid2.ogg',
		'fallout/sound/footsteps/asteroid3.ogg',
		'fallout/sound/footsteps/asteroid4.ogg',
		'fallout/sound/footsteps/asteroid5.ogg'), 75, 0),
	FOOTSTEP_GRASS = list(list(
		'fallout/sound/footsteps/grass1.ogg',
		'fallout/sound/footsteps/grass2.ogg',
		'fallout/sound/footsteps/grass3.ogg',
		'fallout/sound/footsteps/grass4.ogg'), 75, 0),
	FOOTSTEP_WATER = list(list(
		'fallout/sound/footsteps/water1.ogg',
		'fallout/sound/footsteps/water2.ogg',
		'fallout/sound/footsteps/water3.ogg',
		'fallout/sound/footsteps/water4.ogg'), 100, 1),
	FOOTSTEP_LAVA = list(list(
		'fallout/sound/footsteps/lava1.ogg',
		'fallout/sound/footsteps/lava2.ogg',
		'fallout/sound/footsteps/lava3.ogg'), 100, 0),
	FOOTSTEP_MEAT = list(list(
		'sound/effects/meatslap.ogg'), 100, 0),
))

//heavy footsteps list
GLOBAL_LIST_INIT(heavyfootstep, list(
	FOOTSTEP_GENERIC_HEAVY = list(list(
		'fallout/sound/footsteps/heavy1.ogg',
		'fallout/sound/footsteps/heavy2.ogg'), 100, 2),
	FOOTSTEP_WATER = list(list(
		'fallout/sound/footsteps/water1.ogg',
		'fallout/sound/footsteps/water2.ogg',
		'fallout/sound/footsteps/water3.ogg',
		'fallout/sound/footsteps/water4.ogg'), 100, 2),
	FOOTSTEP_LAVA = list(list(
		'fallout/sound/footsteps/lava1.ogg',
		'fallout/sound/footsteps/lava2.ogg',
		'fallout/sound/footsteps/lava3.ogg'), 100, 0),
	FOOTSTEP_MEAT = list(list(
		'sound/effects/meatslap.ogg'), 100, 0),
	FOOTSTEP_RUST = list(list(
		'fallout/sound/footsteps/hull1.ogg',
		'fallout/sound/footsteps/hull2.ogg',
		'fallout/sound/footsteps/hull3.ogg',
		'fallout/sound/footsteps/hull4.ogg',
		'fallout/sound/footsteps/hull5.ogg'), 100, 1),
	FOOTSTEP_SNOW = list(list(
		'fallout/sound/footsteps/snow1.ogg',
		'fallout/sound/footsteps/snow2.ogg',
		'fallout/sound/footsteps/snow3.ogg',
		'fallout/sound/footsteps/snow4.ogg',
		'fallout/sound/footsteps/snow5.ogg'), 100, 1),
	FOOTSTEP_GRAVEL = list(list(
		'fallout/sound/footsteps/gravel1.ogg',
		'fallout/sound/footsteps/gravel2.ogg',
		'fallout/sound/footsteps/gravel3.ogg',
		'fallout/sound/footsteps/gravel4.ogg'), 40, 1),
	FOOTSTEP_LOOSE_SAND = list(list(
		'fallout/sound/footsteps/sand1.ogg',
		'fallout/sound/footsteps/sand2.ogg',
		'fallout/sound/footsteps/sand3.ogg',
		'fallout/sound/footsteps/sand4.ogg'), 100, 1),
	FOOTSTEP_ROAD = list(list(
		'fallout/sound/footsteps/road_walk1.ogg',
		'fallout/sound/footsteps/road_walk2.ogg',
		'fallout/sound/footsteps/road_walk3.ogg',
		'fallout/sound/footsteps/road_walk4.ogg',
		'fallout/sound/footsteps/road_walk5.ogg',
		'fallout/sound/footsteps/road_walk6.ogg'), 50, 1),
))

