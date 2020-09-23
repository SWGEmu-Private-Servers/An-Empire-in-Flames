--EiF

object_building_player_city_shuttleport_dathomir = object_building_player_city_shared_shuttleport_dathomir:new {
	planetMapCategory = "shuttleport",
	lotSize = 0,
	baseMaintenanceRate = 0,
	allowedZones = {"dathomir"},
	length = 5,
	width = 5,
	cityRankRequired = 4,
	uniqueStructure = true,
	cityMaintenanceBase = 25000,
	gameObjectType = 4103,
	abilityRequired = "place_shuttleport",
	zoneComponent = "ShuttleInstallationZoneComponent",
	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 10.122, z = 0.0, y = 2.0, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_travel.iff", x = -8.848, z = 2.75, y = -2.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/travel/ticket_collector/ticket_collector.iff", x = 10.122, z = 5.119, y = 3.081, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
		{templateFile = "object/creature/npc/theme_park/rim_shuttle.iff", x = 8.622, z = 5.119, y = -4.5, ox = 0, oy = 0.707, oz = 0, ow = 0.707, cellid = -1, containmentType = -1}
	}

}

ObjectTemplates:addTemplate(object_building_player_city_shuttleport_dathomir, "object/building/player/city/shuttleport_dathomir.iff")
