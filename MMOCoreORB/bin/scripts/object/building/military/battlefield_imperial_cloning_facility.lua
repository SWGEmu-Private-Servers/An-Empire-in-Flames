--EiF 2020


object_building_military_battlefield_imperial_cloning_facility = object_building_military_shared_small_imperial_cloning_facility:new {
	planetMapCategory = "cloningfacility",
	faction = "imperial",
	customName = "Imperial Cloning Facility",
	containerComponent = "GCWBaseContainerComponent",
	zoneComponent = "StructureZoneComponent",
	templateType = CLONINGBUILDING,
	facilityType = CLONER_FACTION_IMPERIAL,
	alwaysPublic = 1,

	skillMods = {
		{"private_medical_rating", 100},
		{"private_med_wound_mind", 20},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5}
	},

	spawningPoints = {
		{ x = 3.82471, z = 0.125266, y = -3.7097, ow = -0.70527, ox = 0, oz = 0, oy = 0.708939, cellid = 5 }
	},

	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_cloning.iff", x = -5.5, z = -0.05, y = -3, ox = 0, oy = 0.707106, oz = 0, ow = 0.707106, cellid = 6, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_insurance.iff", x = 0, z = -0.05, y = -5.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = 3, containmentType = -1},
		{templateFile = "object/static/item/item_tapestry_imperial.iff", x = -3.4, z = -0.05, y = 7.5, ox = 0, oy = 0.707106, oz = 0, ow = 0.707106, cellid = -1, containmentType = -1},
		{templateFile = "object/static/item/item_tapestry_imperial.iff", x = 3.4, z = -0.05, y = 7.5, ox = 0, oy = 0.707106, oz = 0, ow = 0.707106, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_battlefield_droid.iff", x = -0.1, z = 0.1, y = 2.0, ox = 0, oy = -0.707106, oz = 0, ow = 0.707106, cellid = 3, containmentType = -1},
	},

--	childCreatureObjects = {
--		{ mobile = "imperial_recruiter", x = -0.1, z = 0.1, y = 2.0, cellid = 3, containmentType = -1, respawn = 60, heading = 3.14},
--	},
}

ObjectTemplates:addTemplate(object_building_military_battlefield_imperial_cloning_facility, "object/building/military/battlefield_imperial_cloning_facility.iff")
