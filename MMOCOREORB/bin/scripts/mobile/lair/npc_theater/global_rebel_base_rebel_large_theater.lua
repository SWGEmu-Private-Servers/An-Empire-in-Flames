global_rebel_base_rebel_large_theater = Lair:new {
	mobiles = {
		{"fbase_rebel_colonel_hard",1},
		{"fbase_rebel_grenadier_hard",2},
		{"fbase_rebel_elite_sand_rat",2},
		{"fbase_rebel_soldier_hard",4}
	},
	spawnLimit = 15,
	buildingsVeryEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsMedium = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsHard = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsVeryHard = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	missionBuilding = "object/tangible/lair/base/objective_banner_rebel.iff",
	mobType = "npc",
	buildingType = "theater",
	faction = "rebel"
}

addLairTemplate("global_rebel_base_rebel_large_theater", global_rebel_base_rebel_large_theater)
