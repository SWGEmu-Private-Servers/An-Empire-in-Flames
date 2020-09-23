-- {"regionName", xCenter, yCenter, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {1, radius}
--   - Rectangle: {2, width, height}
--   - Ring: {3, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.spawn_manager.regions")

hoth_regions = {
	{"echobase",-5100,5100,{1,2000},NOSPAWNAREA + NOBUILDZONEAREA},
	{"starport",0,-2000,{1,400},NOSPAWNAREA + NOBUILDZONEAREA},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,{"hoth_world"},512},
	{"wampacaves",0,4000,{1,2000},NOBUILDZONEAREA},
	{"geyserfield",5000,850,{3600,4700},NOBUILDZONEAREA},

}

