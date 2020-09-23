TaanabHexFarmsScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "TaanabHexFarmsScreenPlay",
}

registerScreenPlay("TaanabHexFarmsScreenPlay", true)

function TaanabHexFarmsScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
	end
end

function TaanabHexFarmsScreenPlay:spawnMobiles()
	
	-- farmers and droids
	spawnMobile("taanab", "farmer",600,-3006.1,50,-17.6,91,0)
	spawnMobile("taanab", "agriculturalist",600,-3004.8,50,-191.2,114,0)
	spawnMobile("taanab", "farmer",600,-3000.3,50,-192.8,-74,0)
	spawnMobile("taanab", "agriculturalist",600,-2885.6,50,-107.6,-153,0)
	spawnMobile("taanab", "farmer",600,-3170,50,-250,98,0)
	spawnMobile("taanab", "farmer",600,-3111.3,50,-106.4,-142,0)
	spawnMobile("taanab", "farmer",600,-2904.9,50,16.4,106,0)
	spawnMobile("taanab", "rancher",600,-2904.2,50,12.7,42,0)	

	-- inside the main house
	spawnMobile("taanab", "farmer",600,5.3,-0.5,2.1,-108,6036069)
		
end
