#define TOOL_NCR			"NCR ammo bench"
#define TOOL_LEGION			"Legion ammo bench"
#define TOOL_FORGE			"forge"
#define TOOL_RELOADER		"pre-war reloading press"
#define TOOL_MSRELOADER     "makeshift reloading tool"
#define TOOL_LUNCHBOX       "lunchbox"
//benches
#define TOOL_WORKBENCH      "workbench"
#define TOOL_MWORKBENCH		"machine bench"
#define TOOL_ASSWORKBENCH   "assembly bench"
#define TOOL_FWORKBENCH   	"finishing workbench"
#define TOOL_BOTTLER		"bottler"
#define TOOL_AWORKBENCH     "advanced workbench"
#define TOOL_LOOM			"loom"
#define TOOL_CHEMMASTER		"ChemMaster / refinery"
#define TOOL_ALCHEMY		"alchemy table"
#define TOOL_METAL_BENCH	"metalworking bench"
//
#define TOOL_GUNTIER1		"Guns and Bullets: Part 1"
#define TOOL_GUNTIER2		"Guns and Bullets: Part 2"
#define TOOL_GUNTIER3		"Guns and Bullets: Part 3"
#define TOOL_GUNTIER4		"Guns and Bullets: Part 4"
#define TOOL_GUNTIER5		"Guns and Bullets: Part 5"

// If delay between the start and the end of tool operation is less than MIN_TOOL_SOUND_DELAY,
// tool sound is only played when op is started. If not, it's played twice.
#define MIN_TOOL_SOUND_DELAY 20

//Time for a work for tool system calculated in that way: basic time - tool level - stat check..
//It means that basic tools will give -30 on time, and people on right job should have -20 at least, or even more.
//This isn't used yet but it's kept for compatibility.
#define WORKTIME_INSTANT				0
#define WORKTIME_NEAR_INSTANT			30
#define WORKTIME_FAST					60
#define WORKTIME_NORMAL					90
#define WORKTIME_SLOW					120
#define WORKTIME_LONG					170
#define WORKTIME_EXTREMELY_LONG			250
