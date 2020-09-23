--Copyright (C) 2018 <SWG EiF>


--This File is part of SWG: Empire in Flames. It is not designed to be redistributed or used in other SWGEMU based emulators or any other emulators.
--If you wish to use this file, please contact the Empire in Flames team for permission to do so.
--This software is distributed without any warranty; without an impied warranty of merchantability or fitness for a particular purpose.


object_tangible_deed_city_deed_vote_center_deed = object_tangible_deed_city_deed_shared_vote_center_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	gameObjectType = 8388609,
	generatedObjectTemplate = "object/building/player/city/vote_center.iff",

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

ObjectTemplates:addTemplate(object_tangible_deed_city_deed_vote_center_deed, "object/tangible/deed/city_deed/vote_center_deed.iff")
