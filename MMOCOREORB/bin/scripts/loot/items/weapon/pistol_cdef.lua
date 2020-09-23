--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

pistol_cdef = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_cdef.iff",
	craftingValues = {
		{"mindamage",275,350,0},
		{"maxdamage",501,605,0},
		{"attackspeed",4.1,3.0,0},
		{"woundchance",4,5,0},
		{"roundsused",5,20,0},
		{"hitpoints",450,1000,0},
		{"zerorangemod",-5,5,0},
		{"maxrangemod",-120,-120,0},
		{"midrange",16,16,0},
		{"midrangemod",10,22,0},
		{"attackhealthcost",65,60,0},
		{"attackactioncost",65,60,0},
		{"attackmindcost",65,60,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 50,
	junkMaxValue = 80

}

addLootItemTemplate("pistol_cdef", pistol_cdef)
