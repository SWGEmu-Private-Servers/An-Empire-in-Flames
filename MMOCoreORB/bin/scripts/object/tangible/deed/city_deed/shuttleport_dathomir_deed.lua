--EiF


object_tangible_deed_city_deed_shuttleport_dathomir_deed = object_tangible_deed_city_deed_shared_shuttleport_dathomir_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	gameObjectType = 8388609,
	generatedObjectTemplate = "object/building/player/city/shuttleport_dathomir.iff",

	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "DR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints"},
	experimentalMin = {0, 0, 35000},
	experimentalMax = {0, 0, 75000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 4},
}

ObjectTemplates:addTemplate(object_tangible_deed_city_deed_shuttleport_dathomir_deed, "object/tangible/deed/city_deed/shuttleport_dathomir_deed.iff")
