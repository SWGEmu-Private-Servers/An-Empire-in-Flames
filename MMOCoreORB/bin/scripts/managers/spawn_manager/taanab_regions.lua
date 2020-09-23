-- {"regionName", xCenter, yCenter, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {1, radius}
--   - Rectangle: {2, width, height}
--   - Ring: {3, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.spawn_manager.regions")

taanab_regions = {
	{"pandath",2000,5400,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"starhunterstation",3763,-5425,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,{"taanab_world"},2048},
	{"taanabhexfarms",-3000,-105,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"taanabgreatherdnbz",5537,-4958,{1,400},NOBUILDZONEAREA},
	{"taanabgreatherd",5537,-4958,{1,300},NOWORLDSPAWNAREA + SPAWNAREA,{"taanab_nerfherd"},1024},
	{"downedship",3293,-1324,{1,150},NOBUILDZONEAREA},
	{"taanabcanyonlands",-2590,3705,{1,50},NOBUILDZONEAREA},
	{"taanabmine",-2609,-1305,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"taanabcave",-850,7200,{1,150},NOSPAWNAREA + NOBUILDZONEAREA},
}
