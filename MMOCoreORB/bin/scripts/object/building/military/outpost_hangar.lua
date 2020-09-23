--EiF


object_building_military_outpost_hangar = object_building_military_shared_outpost_hangar:new {
--	gameObjectType = 521,
	gameObjectType = 515,
	pvpStatusBitmask = 0,
	alwaysPublic = 1,
	planetMapCategory = "starport",
	dataObjectComponent = "DestructibleBuildingDataComponent",
	containerComponent = "GCWBaseContainerComponent",
	factionBaseType = 2,
	childObjects = {
--		{templateFile = "object/tangible/terminal/terminal_travel.iff", x = -3.12, z = 0.14659503, y = -17.57, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = 1, containmentType = -1},
--		{templateFile = "object/tangible/travel/ticket_collector/ticket_collector.iff", x = 1, z = 0, y = -10, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
--		{templateFile = "object/mobile/player_transport.iff", x = 0, z = 7, y = 0, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1}
	}
}

ObjectTemplates:addTemplate(object_building_military_outpost_hangar, "object/building/military/outpost_hangar.iff")
