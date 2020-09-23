--Copyright (C) 2017 <SWG EiF>


--This File is part of SWG: Empire in Flames. It is not designed to be redistributed or used in other SWGEMU based emulators or any other emulators.
--If you wish to use this file, please contact the Empire in Flames team for permission to do so.
--This software is distributed without any warranty; without an implied warranty of merchantability or fitness for a particular purpose.
--this exception also makes it possible to release a modified version


object_tangible_deed_vehicle_deed_tcg_republic_gunship_deed = object_tangible_deed_vehicle_deed_shared_tcg_republic_gunship_deed:new {

	templateType = VEHICLEDEED,

	controlDeviceObjectTemplate = "object/intangible/vehicle/tcg_republic_gunship_pcd.iff",
	generatedObjectTemplate = "object/mobile/vehicle/tcg_republic_gunship.iff",

	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "SR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hit_points"},
	experimentalMin = {0, 0, 5000},
	experimentalMax = {0, 0, 7500},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 1},
}

ObjectTemplates:addTemplate(object_tangible_deed_vehicle_deed_tcg_republic_gunship_deed, "object/tangible/deed/vehicle_deed/tcg_republic_gunship_deed.iff")
