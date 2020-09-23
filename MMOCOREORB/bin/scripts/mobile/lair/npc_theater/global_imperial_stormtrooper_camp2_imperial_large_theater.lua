global_imperial_stormtrooper_camp2_imperial_large_theater = Lair:new {
	mobiles = {
		{"fbase_stormtrooper_bombardier_hard",2},
		{"fbase_stormtrooper_medic_hard",2},
		{"fbase_stormtrooper_squad_leader_hard",1},
		{"fbase_stormtrooper_hard",4}
	},
	spawnLimit = 15,
	buildingsVeryEasy = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsEasy = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsMedium = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsHard = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsVeryHard = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	missionBuilding = "object/tangible/lair/base/objective_banner_imperial.iff",
	mobType = "npc",
	buildingType = "theater",
	faction = "imperial"
}

addLairTemplate("global_imperial_stormtrooper_camp2_imperial_large_theater", global_imperial_stormtrooper_camp2_imperial_large_theater)
