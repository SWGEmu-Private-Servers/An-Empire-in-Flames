-- {"regionName", xCenter, yCenter, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {1, radius}
--   - Rectangle: {2, width, height}
--   - Ring: {3, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.spawn_manager.regions")

kuat_regions = {
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA + NOBUILDZONEAREA,{"kuat_world"},2048},
	{"kuat_city",2500,-3000,{1,500},NOSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_gardens",477,-4978,{1,600},NOSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_rec_zone",-3949,5604,{1,350},NOSPAWNAREA + NOWORLDSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_shipyard1",5427,5889,{1,1200},NOSPAWNAREA + NOWORLDSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_shipyard2",5134,3905,{1,1200},NOSPAWNAREA + NOWORLDSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_shipyard3",5022,5142,{1,1200},NOSPAWNAREA + NOWORLDSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_dax_area",-5500,3000,{1,350},NOSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_fishing_docks",5600,-2325,{1,350},NOSPAWNAREA + NOBUILDZONEAREA},
	{"kuat_failed_op",-5200,-6230,{1,350},NOSPAWNAREA + NOBUILDZONEAREA},	
	{"andrim_city",-6975,160,{1,750},NOSPAWNAREA + NOBUILDZONEAREA},
		
}

