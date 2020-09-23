
-- Author: Matthias Muente (matthias.muente@gmx.de)

local ObjectManager = require("managers.object.object_manager")
local screenplayHelper = require("helper.screenplayHelper")
local patrolHelper = require("helper.patrolHelper")

local patrolAnimationTemplate = ScreenPlay:new {
	numberOfActs = 1,
	states = {},
	scriptName = "patrolAnimationTemplate",    
	questString = "patrolAnimationTemplate",
	zone = "talus",
	yOffset = 3,
	xOffset = 3,
	x = 0,
	y = 0,
	z = 0,
	rot = 0,
	patrolPoints = {
		{0, 0},
		{1, 0},
		},
	squadID = "squad_default_id",
	squadCount = 12,
	squadLineCount = 3,
	mobile = "cll_8",
	respawn = 0,
	despawnTimer = 1800,
	aiTemplate = "patrol"

}

function patrolAnimationTemplate:start()
	if (isZoneEnabled(self.zone)) then
		self:spawnSquad()
	end
end

function patrolAnimationTemplate:spawnSquad()
	local pAnchor = spawnSceneObject(self.zone,"object/resource_container/inorganic_minerals.iff", 7990, 500 , 7990, 0, 0, 0, 0, 0)
	ObjectManager.withSceneObject(pAnchor, function(anchor)	
		createEvent(1000 * self.despawnTimer, self.scriptName, "RespawnEvent", pAnchor)
	end)
	patrolHelper:spawnSquadwithRespawn(self.squadID, self.squadCount, self.squadLineCount, self.x, self.z, self.y, self.rot, self.xOffset, self.yOffset, self.zone, self.mobile, self.respawn)
	patrolHelper:moveSquad(self.squadID, self.squadCount, self.squadLineCount, self.xOffset, self.yOffset, self.zone, self.patrolPoints, self.aiTemplate)
end

function patrolAnimationTemplate:RespawnEvent(pAnchor)
	patrolHelper:destroySquad(self.squadID, self.squadCount)
	ObjectManager.withSceneObject(pAnchor, function(anchor)	
		anchor:destroyObjectFromWorld()
		anchor:destroyObjectFromDatabase()
	end)
 	self:spawnSquad()
end

function patrolAnimationTemplate:destroySquad()
    local pSquad = getCreatureObject(readData(self.squadID .. "1:objectid"))
	patrolHelper:destroySquad(self.squadID, self.squadCount)
end

return patrolAnimationTemplate
