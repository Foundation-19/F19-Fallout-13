//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"
#define FORCE_MAP "_maps/sunnyvale.json"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\sunnyvale\sunnyvale.dmm"

		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
