TaanabGreatHerdScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "TaanabGreatHerdScreenPlay",
}

registerScreenPlay("TaanabGreatHerdScreenPlay", true)

function TaanabGreatHerdScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
	end
end

function TaanabGreatHerdScreenPlay:spawnMobiles()
	
	-- Droids inner ring
	spawnMobile("taanab", "ig_assassin_droid",600,5525,74.4,-5012.7,-162,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5564,72.8,-5013.2,131,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5614.7,66.8,-4962.6,-65,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5599.5,68.5,-4915.2,12,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5540,69.1,-4882.5,18,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5499.8,70,-4900.1,-72,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5490.1,72.4,-4940.6,-73,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5494.4,73.4,-4981.6,-118,0)

	--outer ring
	spawnMobile("taanab", "ig_assassin_droid",600,5353,63.7,-4973.1,-140,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5361.8,67,-5054,-99,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5392.2,67.5,-5126.9,-154,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5477.3,61.1,-5171.9,160,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5581.6,57.6,-5156.3,-7,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5654.3,54.2,-5130.7,47,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5736.2,55.2,-5022.9,-111,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5723,53.5,-4869.9,83,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5658.4,56.2,-4783.7,40,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5552.1,54.5,-4710,-141,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5457.9,58.8,-4786.2,-35,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5404,62.1,-4863.8,-76,0)

	--outer outer ring
	spawnMobile("taanab", "ig_assassin_droid",600,5454.2,53.3,-4666.3,56,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5340,52.6,-4751.4,-45,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5257.9,54.5,-4841.5,-63,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5246.4,56.2,-5017.5,-104,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5292.5,66.7,-5130.3,-130,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5456.7,53.7,-5248.2,155,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5647,51.8,-5235.6,-21,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5791.9,47.6,-5109.1,7,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5830.7,53.3,-4920.7,52,0)
	spawnMobile("taanab", "ig_assassin_droid",600,5717.9,52.5,-4721,-144,0)


	--in the hut
	spawnMobile("taanab", "rancher",600,5534.3,68.3,-4950.5,-34,0)
	spawnMobile("taanab", "farmer_rancher",600,5534.6,68.4,-4948.7,-162,0)
	spawnMobile("taanab", "rancher",600,5538.9,69,-4957.3,-100,0)
	spawnMobile("taanab", "businessman",600,5535.7,69,-4959.5,37,0)
	
		
end
