DownedShipScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "DownedShipScreenPlay",

	lootContainers = {
		6036667,
		6036668,
		6036669,
		6036670
		
	},
	
	lootLevel = 38,	

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

registerScreenPlay("DownedShipScreenPlay", true)

function DownedShipScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:initializeLootContainers()
	end
end

function DownedShipScreenPlay:spawnSceneObjects()

	--Lower Floor
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_down.iff",-3.5,9,-21.4,6036662,1,0,0,0) --Middle
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_up.iff",-3.5,0,-21.4,6036662,1,0,0,0)
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_down.iff",0.5,9,-21.4,6036661,1,0,0,0) --Left
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_up.iff",0.5,0,-21.4,6036661, 1,0,0,0)
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_down.iff",-7.5,9,-21.4,6036663,1,0,0,0) --Right
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_up.iff",-7.5,0,-21.4,6036663,1,0,0,0)
	--Upper Floor
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_up.iff",13.5,7,-17.95,6036664,1,0,0,0)
	spawnSceneObject("taanab", "object/tangible/terminal/terminal_elevator_down.iff",13.5,15,-17.95,6036664,1,0,0,0)

end

function DownedShipScreenPlay:spawnMobiles()
	
	-- Inside Ship, main floor
	spawnMobile("taanab", "black_sun_thug",600,-15,7,4.2,75,6036635)
	spawnMobile("taanab", "black_sun_guard",600,1.5,7,2.8,-90,6036635)
	spawnMobile("taanab", "black_sun_guard",600,1.5,7,-2.9,-90,6036635)
	spawnMobile("taanab", "black_sun_henchman",600,21.1,7,-10.6,-9,6036639)
	spawnMobile("taanab", "black_sun_henchman",600,21.8,7,9.4,-151,6036639)
	spawnMobile("taanab", "black_sun_henchman",600,25.8,7,-3.2,-61,6036639)
	spawnMobile("taanab", "black_sun_assassin",600,34.5,7,0.1,-90,6036642)
	spawnMobile("taanab", "black_sun_thug",600,33.6,7,-4.1,-28,6036642)
	spawnMobile("taanab", "black_sun_thug",600,33.8,7,4.1,-142,6036642)

	-- Lower level
	spawnMobile("taanab", "black_sun_henchman",600,-20.3,0,-3.3,-13,6036650)
	spawnMobile("taanab", "black_sun_henchman",600,-19.9,0,2.6,151,6036650)
	spawnMobile("taanab", "black_sun_henchman",600,-23.9,0,0.5,92,6036650)
	spawnMobile("taanab", "black_sun_guard",600,23.5,0,-3.3,-79,6036653)
	spawnMobile("taanab", "black_sun_guard",600,23.1,0,2.2,-139,6036653)
	spawnMobile("taanab", "black_sun_guard",600,9.6,0,-3.2,2,6036653)
	spawnMobile("taanab", "black_sun_guard",600,9.4,0,2.3,-177,6036653)
	spawnMobile("taanab", "black_sun_assassin",600,31.1,-0.3,-0.6,-90,6036660)
	spawnMobile("taanab", "black_sun_assassin",600,-4,0,12.9,-180,6036648)
	spawnMobile("taanab", "black_sun_guard",600,-3.6,0,7.7,-1,6036648)
	spawnMobile("taanab", "black_sun_thug",600,11.5,7,0.1,90,6036639)
	spawnMobile("taanab", "black_sun_assassin",600,-25.2,9,3.5,150,6036637)

	--Outside guards
	spawnMobile("taanab", "black_sun_henchman",600,3342.1,53.6,-1285.7,-3,0)
	spawnMobile("taanab", "black_sun_thug",600,3309.3,55.3,-1280.4,0,0)
	spawnMobile("taanab", "black_sun_thug",600,3305.6,54.5,-1274.3,133,0)

	--ramp
	spawnMobile("taanab", "black_sun_guard",600,3320.5,64.1,-1306.6,46,0)	

	
	

end
