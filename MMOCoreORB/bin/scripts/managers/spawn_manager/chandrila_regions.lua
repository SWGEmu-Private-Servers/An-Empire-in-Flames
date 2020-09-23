require("scripts.managers.spawn_manager.regions")

chandrila_regions = {
        {"aakuan_champions_cave",4339,-4281,{1,150},NOSPAWNAREA + NOBUILDZONEAREA}, -- Crystal Canyon POI badge area     
        {"aakuan_tent",2475,2303,{1,150},NOSPAWNAREA + NOBUILDZONEAREA}, -- Lake Sah'ot    
        {"animal_skull",-80,4710,{1,300},NOSPAWNAREA + NOBUILDZONEAREA}, -- Chandriltech Facility      
        {"arch_and_torches",-5018,4084,{1,1000}, NOBUILDZONEAREA}, -- Gladean State Park
        
        
	{"dearic",0,0,{1,0},UNDEFINEDAREA},
	{"dearic_easy_newbie",432,-3008,{1,1750},SPAWNAREA,{"chandrila_world"},256},
	{"dearic_medium_newbie",432,-3008,{3,1750,2500},SPAWNAREA,{"chandrila_world"},384},
   
	{"nashal",0,0,{1,0},UNDEFINEDAREA},
	
	{"nashal_easy_newbie",4352,5209,{1,1750},SPAWNAREA,{"chandrila_world"},256},
	{"nashal_medium_newbie",4352,5209,{3,1750,2500},SPAWNAREA,{"chandrila_world"},384},
	{"talus_imperial_outpost_easy_newbie",-2186,2300,{1,1000},SPAWNAREA,{"chandrila_world"},256},
	{"talus_imperial_outpost_medium_newbie",-2186,2300,{3,1000,1750},SPAWNAREA,{"chandrila_world"},384},
	

	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,{"chandrila_world","global"},2048},

}

chandrila_static_spawns = {
	{"rebel_recruiter",1,191.3,6,-3046.8,43,0, "", "", "stationary"},

}

