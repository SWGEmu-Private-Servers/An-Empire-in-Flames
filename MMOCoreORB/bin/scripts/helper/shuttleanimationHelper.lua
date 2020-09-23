
-- Author: Matthias Muente (matthias.muente@gmx.de)

local ObjectManager = require("managers.object.object_manager")

local shuttleanimationHelper = ScreenPlay:new {
	numberOfActs = 1,
	questString = "shuttleanimationHelper",
	states = {},
	planetName = "talus",
	mobileName = "lambda_shuttle",
	x = 0,
	z = 200,
	y = 0,
	direction = 0,
	scriptName = "shuttleanimationHelper",
	waitingtime = 60000,
}

function shuttleanimationHelper:start()
	if (isZoneEnabled(self.planetName)) then
		local pShuttle = spawnMobile(self.planetName, self.mobileName, 0, self.x, self.z, self.y, self.direction, 0)
		ObjectManager.withCreatureObject(pShuttle, function(shuttle)
			writeData("shuttleanimation:" .. self.scriptName .. ":objectID", shuttle:getObjectID())
			shuttle:setOptionsBitmask(256)
			shuttle:setPosture(PRONE)
			createEvent(self.waitingtime, self.scriptName, "launchferry", shuttle)
		end)
	end
end

function shuttleanimationHelper:launchferry(shuttle)
	local pShuttle = getCreatureObject(readData("shuttleanimation:" .. self.scriptName .. ":objectID"))
	ObjectManager.withCreatureObject(pShuttle, function(shuttle)
		shuttle:setPosture(FLYING)
		createEvent(self.waitingtime, self.scriptName, "landferry", shuttle)
	end)
end

function shuttleanimationHelper:landferry(shuttle)
	local pShuttle = getCreatureObject(readData("shuttleanimation:" .. self.scriptName .. ":objectID"))
	ObjectManager.withCreatureObject(pShuttle, function(shuttle)
		shuttle:setPosture(PRONE)
		createEvent(self.waitingtime, self.scriptName, "launchferry", shuttle)
	end)
end

return shuttleanimationHelper
