TaanabMineScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "TaanabMineScreenPlay",

	lootContainers = {
		
	},
	
	lootLevel = 26,	

	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 3100000},
				{group = "junk", chance = 3500000},
				{group = "heavy_weapons_consumable", chance = 600000},
				{group = "rifles", chance = 600000},
				{group = "carbines", chance = 600000},
				{group = "pistols", chance = 600000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000}
			},
			lootChance = 8000000
		}					
	},
	
	lootContainerRespawn = 1800 -- 30 minutes
}

registerScreenPlay("TaanabMineScreenPlay", true)

function TaanabMineScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
		self:initializeLootContainers()
	end
end

function TaanabMineScreenPlay:spawnMobiles()
	
	-- Droids
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2596,90,-1335,0,0)
	spawnMobile("taanab", "r5",600,-2676,90,-1316.8,-153,0)
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2459.1,110,-1215.4,28,0)
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2524.4,11,-1247.2,-20,0)
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2689.9,80,-1267.1,9,0)
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2476.7,110,-1320.6,38,0)
	spawnMobile("taanab", "cll8_binary_load_lifter",600,-2627.3,90,-1340.7,28,0)
	
	--miners
	spawnMobile("taanab", "contractor",600,-2659.7,94,-1293.5,148,0)
	spawnMobile("taanab", "businessman",600,-2656.7,94,-1297.2,80,0)
	spawnMobile("taanab", "miner",600,-2656,94,-1294.3,91,0)
	spawnMobile("taanab", "miner",600,-2612.8,90,-1370.4,-24,0)
	spawnMobile("taanab", "miner",600,-2568.3,84.4,-1336.4,-144,0)
	spawnMobile("taanab", "miner",600,-2613.7,90,-1365.7,-171,0)
	spawnMobile("taanab", "miner",600,-2471.7,110,-1211.6,90,0)
	spawnMobile("taanab", "miner",600,-2456.1,110,-1224.7,-56,0)
	spawnMobile("taanab", "miner",600,-2447.9,110,-1263.2,-93,0)
	spawnMobile("taanab", "miner",600,-2486.7,110,-1307.1,-35,0)
	spawnMobile("taanab", "miner",600,-2524.3,110,-1275.6,-152,0)
	spawnMobile("taanab", "miner",600,-2519.3,110,-1281.8,-43,0)
	spawnMobile("taanab", "miner",600,-2561.9,80,-1361.2,-49,0)
	spawnMobile("taanab", "miner",600,-2637.6,76.1,-1300.2,86,0)
	spawnMobile("taanab", "miner",600,-2637.9,79.9,-1311.7,11,0)
	spawnMobile("taanab", "miner",600,-2625.3,90,-1337.8,-123,0)
	spawnMobile("taanab", "miner",600,-2673.1,80,-1278.1,154,0)
	spawnMobile("taanab", "miner",600,-2672.1,80,-1262.9,-41,0)
	spawnMobile("taanab", "miner",600,-2696.1,80,-1262.5,29,0)
	spawnMobile("taanab", "miner",600,-2621.4,90,-1278.4,41,0)
	spawnMobile("taanab", "miner",600,-2606.3,90,-1270.6,-108,0)
	spawnMobile("taanab", "miner",600,-2603.9,90,-1293.3,-102,0)
	spawnMobile("taanab", "miner",600,-2470.2,110,-1319.1,61,0)	
	spawnMobile("taanab", "miner",600,-2501.8,110,-1180.0,31,0)	
	spawnMobile("taanab", "miner",600,-2498.6,110,-1192.3,-151,0)	
	spawnMobile("taanab", "miner",600,-2454.1,110,-1211.5,167,0)	
	spawnMobile("taanab", "miner",600,-2458.2,110,-1266.5,-53,0)	
	spawnMobile("taanab", "miner",600,-2641.7,80,-1316.2,-3,0)	
	spawnMobile("taanab", "miner",600,-2627.3,80,-1250.4,53,0)	
	spawnMobile("taanab", "miner",600,-2611.9,80,-1247.5,-158,0)	
	spawnMobile("taanab", "miner",600,-2580.3,80,-1294.9,-130,0)	
	spawnMobile("taanab", "miner",600,-2576.4,80,-1305.5,-100,0)	
	spawnMobile("taanab", "miner",600,-2552,80,-1199.7,77,0)	
	spawnMobile("taanab", "miner",600,-2558.3,80,-1220.1,118,0)	

	
end
