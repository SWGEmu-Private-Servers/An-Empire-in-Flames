--EiF


object_building_player_player_garage_dathomir_style_01 = object_building_player_shared_player_garage_dathomir_style_01:new {
	gameObjectType = 4102,
	planetMapCategory = "garage",
	lotSize = 0,
	baseMaintenanceRate = 0,
	allowedZones = {"dathomir"},
	cityRankRequired = 2,
	abilityRequired = "place_garage",
	uniqueStructure = true,
	cityMaintenanceBase = 20000,
	zoneComponent = "StructureZoneComponent",
	length = 5,
	width = 5,
	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_player_structure_nosnap_mini.iff", x = 1.1134, z = 2.45, y = 0.131, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1}
	}
}

ObjectTemplates:addTemplate(object_building_player_player_garage_dathomir_style_01, "object/building/player/player_garage_dathomir_style_01.iff")
