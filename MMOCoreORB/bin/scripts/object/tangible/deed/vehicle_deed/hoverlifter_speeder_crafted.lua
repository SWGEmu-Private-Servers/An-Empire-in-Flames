--Copyright (C) 2017 <SWG EiF>


--This File is part of SWG: Empire in Flames. It is not designed to be redistributed or used in other SWGEMU based emulators or any other emulators.
--If you wish to use this file, please contact the Empire in Flames team for permission to do so.
--This software is distributed without any warranty; without an implied warranty of merchantability or fitness for a particular purpose.
--this exception also makes it possible to release a modified version


object_tangible_deed_vehicle_deed_hoverlifter_speeder_crafted = object_tangible_deed_vehicle_deed_shared_hoverlifter_speeder_crafted:new {

	templateType = VEHICLEDEED,

	controlDeviceObjectTemplate = "object/intangible/vehicle/hoverlifter_speeder_crafted_pcd.iff",
	generatedObjectTemplate = "object/mobile/vehicle/hoverlifter_speeder_crafted.iff",

	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "SR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hit_points"},
	experimentalMin = {0, 0, 1000},
	experimentalMax = {0, 0, 2500},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 1},
}

ObjectTemplates:addTemplate(object_tangible_deed_vehicle_deed_hoverlifter_speeder_crafted, "object/tangible/deed/vehicle_deed/hoverlifter_speeder_crafted.iff")
