TaanabCaveScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TaanabCaveScreenPlay",
}
 
registerScreenPlay("TaanabCaveScreenPlay", true)
 
function TaanabCaveScreenPlay:start()
	if (isZoneEnabled("taanab")) then
                self:spawnMobiles()
        end
end

function TaanabCaveScreenPlay:spawnMobiles()
	
	spawnMobile("taanab", "norulac_raider", 600, -0.6, -13.7, -8.3, 0, 6036722)
	spawnMobile("taanab", "norulac_raider", 600, 11.3, -14.2, -5.5, 0, 6036722)
	spawnMobile("taanab", "norulac_raider", 600, 9.7, -23.9, -28.3, 0, 6036723)
	spawnMobile("taanab", "norulac_raider", 600, -11.3, -30.7, -27.1, 0, 6036723)

	spawnMobile("taanab", "norulac_raider_commando", 600, -1.8, -40.7, -74.1, 0, 6036724)
	spawnMobile("taanab", "norulac_raider_commando", 600, 2.6, -40.4, -62.4, 0, 6036724)
	spawnMobile("taanab", "norulac_raider_commando", 600, 3.4, -41.0, -72.6, 0, 6036724)

	spawnMobile("taanab", "norulac_raider", 600, 49.3, -46.8, -53.7, 0, 6036725)
	spawnMobile("taanab", "norulac_raider", 600, 43.8, -46.1, -95.1, 0, 6036725)
	spawnMobile("taanab", "norulac_raider", 600, 23.6, -45.7, -102.8, 0, 6036725)

	spawnMobile("taanab", "norulac_raider", 600, -1.7, -45.8, -147.8, 0, 6036726)
	spawnMobile("taanab", "norulac_raider", 600, -11.0, -44.4, -136.4, 0, 6036726)
	spawnMobile("taanab", "norulac_raider", 600, -4.2, -64.0, -234.2, 0, 6036728)
	spawnMobile("taanab", "norulac_raider", 600, -21.7, -65.4, -244.6, 0, 6036728)

	spawnMobile("taanab", "norulac_raider_commando", 600, -95.3, -73.7, -170.0, 0, 6036729)
	spawnMobile("taanab", "norulac_raider_captain", 600, -83.5, -71.6, -169.2, 0, 6036729)
	spawnMobile("taanab", "norulac_raider_captain", 600, -100.5, -72.9, -159.1, 0, 6036729)
	spawnMobile("taanab", "norulac_raider_captain", 600, -111.7, -69.4, -170.6, 0, 6036729)

	spawnMobile("taanab", "norulac_raider_captain", 600, -85.4, -101.5, -111.2, 180, 6036732)
	spawnMobile("taanab", "norulac_raider_captain", 600, -92.8, -101.1, -111.9, 180, 6036732)
	spawnMobile("taanab", "norulac_raider_captain", 600, -90.7, -101.1, -104.8, 180, 6036732)

	--more

	spawnMobile("taanab", "norulac_raider",600,-21.4,-64.6,-218.1,-90,6036728)
	spawnMobile("taanab", "norulac_raider",600,-63.1,-70.6,-85.9,-164,6036730)
	spawnMobile("taanab", "norulac_raider",600,-64.9,-68.4,-112.5,8,6036730)
	spawnMobile("taanab", "norulac_raider",600,-68.9,-68.4,-108.1,47,6036730)
	spawnMobile("taanab", "norulac_raider",600,-16,-69,-96.4,-155,6036730)
	spawnMobile("taanab", "norulac_raider",600,-24.2,-80.4,-152.5,-62,6036731)
	spawnMobile("taanab", "norulac_raider",600,-93.7,-102,-142.8,-88,6036729)
	spawnMobile("taanab", "norulac_raider",600,-92.4,-102.2,-138.6,149,6036729)

	spawnMobile("taanab", "norulac_raider_commando",600,44.6,-46.7,-50.4,-179,6036725)
	spawnMobile("taanab", "norulac_raider_commando",600,48,-46.2,-94.6,-35,6036725)
	spawnMobile("taanab", "norulac_raider_commando",600,-9.3,-44.7,-141.9,83,6036726)
	spawnMobile("taanab", "norulac_raider_commando",600,-0.7,-63.7,-231.7,-67,6036728)
	spawnMobile("taanab", "norulac_raider_commando",600,-22.1,-65.7,-240.2,88,6036728)
	spawnMobile("taanab", "norulac_raider_commando",600,-68,-70,-89.8,99,6036730)
	spawnMobile("taanab", "norulac_raider_commando",600,-20.7,-80.2,-148.9,-128,6036731)
	spawnMobile("taanab", "norulac_raider_commando",600,-78.8,-100.8,-118.4,-93,6036732)
	spawnMobile("taanab", "norulac_raider_commando",600,-103,-99.7,-121.5,98,6036732)

	spawnMobile("taanab", "norulac_raider_captain",600,1.1,-45.1,-142.6,-80,6036726)
	spawnMobile("taanab", "norulac_raider_captain",600,-21.5,-63.3,-259.2,18,6036728)
	spawnMobile("taanab", "norulac_raider_captain",600,-14.1,-68.8,-98.8,-104,6036730)
	

end
