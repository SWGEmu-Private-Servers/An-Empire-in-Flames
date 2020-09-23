taanab_norulac_raider_camp = Lair:new {
	mobiles = {{"norulac_raider", 1},{"norulac_raider_commando", 1}},
	bossMobiles = {{"norulac_raider_captain",1}},
	spawnLimit = 8,
	buildingsVeryEasy = {"object/building/poi/tatooine_swoop_medium.iff","object/building/poi/tatooine_swoop_medium2.iff"},
	buildingsEasy = {"object/building/poi/tatooine_swoop_medium.iff","object/building/poi/tatooine_swoop_medium2.iff"},
	buildingsMedium = {"object/building/poi/tatooine_swoop_medium.iff","object/building/poi/tatooine_swoop_medium2.iff"},
	buildingsHard = {"object/building/poi/tatooine_swoop_medium.iff","object/building/poi/tatooine_swoop_medium2.iff"},
	buildingsVeryHard = {"object/building/poi/tatooine_swoop_medium.iff","object/building/poi/tatooine_swoop_medium2.iff"},
	missionBuilding = "object/tangible/lair/base/objective_power_node.iff",
	mobType = "npc",
	buildingType = "theater"
}

addLairTemplate("taanab_norulac_raider_camp", taanab_norulac_raider_camp)
