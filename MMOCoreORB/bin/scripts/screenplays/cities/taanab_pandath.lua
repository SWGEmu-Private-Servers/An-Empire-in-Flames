TaanabPandathScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TaanabPandathScreenPlay"
}

registerScreenPlay("TaanabPandathScreenPlay", true)

function TaanabPandathScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
		self:spawnSceneObjects()
	end
end

function TaanabPandathScreenPlay:spawnSceneObjects()

	--outside starport

end

function TaanabPandathScreenPlay:spawnMobiles()

	--Anything dashed out will need to be added here and removed from spawn manager once the spawnMobiles command is extended.

	--streets
	spawnMobile("taanab", "pilot",600,2135.6,45,5366.4,-69,0)
	spawnMobile("taanab", "commoner",600,2132.6,45,5366.1,78,0)
	spawnMobile("taanab", "pilot",600,2138.9,45,5375.2,4,0)
	spawnMobile("taanab", "farmer",600,2129.5,45,5392.9,-147,0)
	spawnMobile("taanab", "noble",600,2127.5,45,5366.4,-69,0)
	spawnMobile("taanab", "informant_npc_lvl_3",600,2006.3,45,5537.6,152,0)
	spawnMobile("taanab", "commoner",600,2009.9,45,5537.8,-122,0)
	spawnMobile("taanab", "r3",600,2099.2,45,5510.8,-171,0)
	spawnMobile("taanab", "commoner",600,2098,45,5507.9,20,0)
	spawnMobile("taanab", "commoner",600,2033.1,45,5370.8,-178,0)
	spawnMobile("taanab", "commoner",600,2031.9,45,5367.8,44,0)
	spawnMobile("taanab", "farmer",600,2123.6,45,5471.3,156,0)
	spawnMobile("taanab", "trainer_artisan",600,2010.1,45.5,5463,-44,0)
	spawnMobile("taanab", "info_broker",600,2139.5,45,5376.6,-134,0)
	spawnMobile("taanab", "trainer_scout",600,2169.2,45,5346.9,-104,0)
	spawnMobile("taanab", "trainer_ranger",600,2164.3,45,5350.5,-177,0)
--	spawnMobile("taanab", "criminal",600,2150.6,45,5327.2,18,0)
--	spawnMobile("taanab", "criminal",600,2150.6,45,5331.8,134,0)
	spawnMobile("taanab", "informant_npc_lvl_1",600,2089.8,45,5320.9,32,0)
	spawnMobile("taanab", "informant_npc_lvl_2",600,2076.8,45,5319.5,-61,0)
	spawnMobile("taanab", "commoner",600,1956.1,45,5464.0,-171,0)
	spawnMobile("taanab", "commoner",600,1957,45,5460.3,-57,0)
	spawnMobile("taanab", "commoner",600,1962.4,45,5458.6,10,0)
	spawnMobile("taanab", "commoner",600,1921.8,45,5420.4,168,0)
	spawnMobile("taanab", "thug",600,2116.8,45,5271.9,157,0)
	spawnMobile("taanab", "thug",600,2122.4,45,5270.2,-140,0)
	spawnMobile("taanab", "criminal",600,2088.9,45,5308.7,99,0)
	spawnMobile("taanab", "criminal",600,2100.2,45,5529.6,-7,0)
	spawnMobile("taanab", "thug",600,2097.9,45,5534.4,129,0)
	spawnMobile("taanab", "thief",600,1892,45,5525.4,-105,0)
	spawnMobile("taanab", "thief",600,1885.4,45,5518.2,-23,0)
	spawnMobile("taanab", "farmer",600,1935.5,45,5389.6,98,0)
	spawnMobile("taanab", "noble",600,1921.3,45,5416,47,0)
	spawnMobile("taanab", "contractor",600,1899.3,47.5,5339.2,-11,0)
	spawnMobile("taanab", "scientist",600,1982.6,45,5287.5,50,0)
	spawnMobile("taanab", "trainer_creaturehandler",600,2169.4,45,5342.8,-90,0)
	spawnMobile("taanab", "commoner",600,2050,45,5365,75,0)
	spawnMobile("taanab", "commoner",600,2060,45,5368,-90,0)
	spawnMobile("taanab", "commoner",600,2049,45,5372,99,0)
	spawnMobile("taanab", "commoner",600,2048,45,5374,89,0)
	spawnMobile("taanab", "commoner",600,2059,45,5375,-100,0)
	spawnMobile("taanab", "commoner",600,2058,45,5385,-115,0)
	spawnMobile("taanab", "commoner",600,2059,45,5387,-90,0)
	spawnMobile("taanab", "commoner",600,2060,45,5396,-45,0)
	spawnMobile("taanab", "commoner",600,2050,45,5382,90,0)
	spawnMobile("taanab", "commoner",600,2049,45,5425,96,0)
	spawnMobile("taanab", "commoner",600,2049,45,5323,84,0)
	spawnMobile("taanab", "commoner",600,2057.7,45,5435.9,-155,0)
	spawnMobile("taanab", "commoner",600,2053.1,45,5431.5,124,0)
	spawnMobile("taanab", "commoner",600,2051,45,5408.4,113,0)
	spawnMobile("taanab", "commoner",600,2048.8,45,5422.9,60,0)
	spawnMobile("taanab", "commoner",600,2069.6,45,5412.3,-130,0)
	spawnMobile("taanab", "commoner",600,2071.6,45,5418.2,-152,0)
	spawnMobile("taanab", "commoner",600,2071.1,45,5415.1,-6,0)
	spawnMobile("taanab", "commoner",600,2051.6,45,5322.1,-67,0)
	spawnMobile("taanab", "commoner",600,2053.4,45,5391.3,97,0)
	spawnMobile("taanab", "pilot",600,2102.3,45,5373.1,154,0)
	spawnMobile("taanab", "pilot",600,2103.1,45,5369.8,-12,0)
	spawnMobile("taanab", "thug",600,1887.5,45,5363.6,12,0)
	spawnMobile("taanab", "thug",600,1885.1,45,5371.1,114,0)
	spawnMobile("taanab", "farmer",600,2099.8,45,5358.4,-47,0)
	spawnMobile("taanab", "r2",600,1912.1,45,5544.3,-43,0)
	spawnMobile("taanab", "criminal",600,1877.2,45,5402.5,-53,0)
	spawnMobile("taanab", "commoner",600,1910.7,45,5466.9,153,0)
	spawnMobile("taanab", "commoner",600,1909.1,45,5463.8,38,0)

	
	--junk dealers in spawn manager pandath.lua

	

	--hotel
	spawnMobile("taanab", "bartender",600,20.1,1.6,13,164,6037380)
	spawnMobile("taanab", "patron_devaronian",600,20.7,1.3,10.4,-62,6037380)
	spawnMobile("taanab", "patron_quarren",600,18.8,1.3,10.6,61,6037380)
	spawnMobile("taanab", "businessman",600,-23,1.6,10.7,122,6037381)

	--cantina
	spawnMobile("taanab", "bartender",600,8.5,-0.9,1,78,6036259)
	spawnMobile("taanab", "patron_chiss",600,11.3,-0.9,-1.3,-39,6036259)
	spawnMobile("taanab", "patron_ithorian",600,10.8,-0.9,2.9,-163,6036259)
	spawnMobile("taanab", "patron_ishitib",600,9.1,-0.9,10.1,84,6036259)
	spawnMobile("taanab", "patron",600,11.1,-0.9,11.3,-160,6036259)
	spawnMobile("taanab", "patron",600,22.3,-0.9,20.8,-147,6036261)
	spawnMobile("taanab", "patron",600,15.9,-0.9,18.2,99,6036261)
	spawnMobile("taanab", "entertainer",600,20.5,-0.9,-1.6,20,6036259)
	
	--guild halls
	spawnMobile("taanab", "trainer_merchant",600,11,1.1,5.5,162,6036340)
	spawnMobile("taanab", "trainer_weaponsmith",600,-2.9,1.1,-8.7,126,6036343)
	spawnMobile("taanab", "trainer_droidengineer",600,-14.6,1.1,-11.2,82,6036344)
	spawnMobile("taanab", "trainer_armorsmith",600,-15.2,1.1,0.1,91,6036341)
	spawnMobile("taanab", "trainer_tailor",600,-14.9,1.1,4.4,99,6036341)
	spawnMobile("taanab", "trainer_chef",600,-13.2,1.1,-13.5,17,6036134)
	spawnMobile("taanab", "trainer_architect",600,7,1.1,-11.7,84,6036132)
	spawnMobile("taanab", "trainer_artisan",600,3.3,1.1,-9.1,-106,6036133)

	--med center
	spawnMobile("taanab", "trainer_doctor",600,17.1,0.3,1.2,118,6036502)
	spawnMobile("taanab", "trainer_medic",600,22.1,0.3,-8,-9,6036502)
	spawnMobile("taanab", "trainer_surveyor",600,-21.4,0.3,-10.1,166,6036506)
	spawnMobile("taanab", "trainer_bioengineer",600,-24.4,0.3,1.3,161,6036506)
	
		
	
end
