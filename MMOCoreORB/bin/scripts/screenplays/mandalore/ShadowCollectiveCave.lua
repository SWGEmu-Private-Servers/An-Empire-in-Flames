ShadowCollectiveCave = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "ShadowCollectiveCave"
}

registerScreenPlay("ShadowCollectiveCave", true)

function ShadowCollectiveCave:start()
	if (isZoneEnabled("mandalore")) then
		self:spawnMobiles()
	end
end

function ShadowCollectiveCave:spawnMobiles()
	--Shadow Collective Cave 
	
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 3.7, -10.9, -7.7, -96, 8566281)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 11.4, -21.8, -7.0, -92, 8566281)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 24.3, -27.8, -8.9, -78, 8566281)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 24.1, -38.8, -36.1, 47, 8566282)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 24.8, -42.7, -66.7, -2, 8566282)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 49.9, -48.8, -62.9, -57, 8566282)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 76.8, -46.5, -143.4, 80, 8566291)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 92.9, -46.4, -132.2, 2, 8566291)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 95.4, -45.5, -100.8, -134, 8566285)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 89.5, -46.6, -111.1, -76, 8566285)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 76.1, -46.4, -108.0, -76, 8566285)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 53.3, -48.7, -105.2, -13, 8566290)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 50.4, -51.7, -84.4, 9, 8566290)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 44.9, -47.1, -9.0, 173, 8566282)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 66.3, -55.6, -11.2, -97, 8566283)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 82.0, -61.1, -5.1, -167, 8566283)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 90.6, -63.3, -23.5, -56, 8566283)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 74.0, -67.9, -37.9, 58, 8566283)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 51.6, -67.7, -45.7, 26, 8566282)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 86.6, -71.0, -46.9, -22, 8566283)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 62.2, -75.5, -64.8, 33, 8566284)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 90.8, -76.1, -67.8, -28, 8566284)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 90.3, -76.3, -87.3, -41, 8566284)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 66.5, -76.8, -85.2, 9, 8566284)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 53.9, -75.3, -101.3, -1, 8566286)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 57.9, -69.5, -123.7, -9, 8566286)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 73.3, -66.4, -139.3, -69, 8566287)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 89.6, -66.9, -140.4, -82, 8566287)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 96.0, -66.1, -110.1, -165, 8566285)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 113.7, -66.3, -121.1, -15, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 113.8, -67.2, -90.3, -176, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 133.2, -66.9, -89.5, -178, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 127.7, -66.6, -107.2, -94, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 136.4, -66.4, -119.0, -45, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 154.2, -66.2, -123.7, -65, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 142.9, -66.5, -88.3, -140, 8566288)
	spawnMobile("mandalore", "shadow_collective_criminal", 120, 164.1, -66.8, -97.5, -96, 8566289)
	spawnMobile("mandalore", "shadow_collective_sc87", 3600, 190.1, -66.5, -102.8, -83, 8566289)
		
end