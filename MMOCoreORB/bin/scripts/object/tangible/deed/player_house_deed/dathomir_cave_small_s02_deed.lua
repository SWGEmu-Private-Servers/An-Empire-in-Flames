--EiF


object_tangible_deed_player_house_deed_dathomir_cave_small_s02_deed = object_tangible_deed_player_house_deed_shared_dathomir_cave_small_s02_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	generatedObjectTemplate = "object/building/player/dathomir_cave_small_s02.iff",


	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "DR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints"},
	experimentalMin = {0, 0, 21000},
	experimentalMax = {0, 0, 39000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 4},
}

ObjectTemplates:addTemplate(object_tangible_deed_player_house_deed_dathomir_cave_small_s02_deed, "object/tangible/deed/player_house_deed/dathomir_cave_small_s02_deed.iff")
