
-- Author: Matthias Muente (matthias.muente@gmx.de)
-- Author: Andreas Rammhold <andreas@rammhold.de>

local patrolHelper = {}
local ObjectManager = require("managers.object.object_manager")
local screenplayHelper = require("helper.screenplayHelper")

function patrolHelper:spawnSquad(squadid, count, linemax, x, z, y, rot, xoffset, yoffset, zone, iff)
	self:spawnSquadwithRespawn(squadid, count, linemax, x, z, y, rot, xoffset, yoffset, zone,iff, 0)
end

--grouped mobile Functions
function patrolHelper:spawnSquadwithRespawn(squadid, count, linemax, x, z, y, rot, xoffset, yoffset, zone, iff, respawn)
	local linecounter = 0
	local linehelper = 0 
	for i = 0 , count - 1 , 1 do
		
		if (linehelper == linemax) then
			linecounter = linecounter +1
			linehelper = 0 
		end
		local pSquad = spawnMobile(zone, iff, respawn, x + (linehelper * xoffset ), z, y +(linecounter * yoffset), rot, 0)
		ObjectManager.withCreatureObject(pSquad, function(squad)
			local stringhelper = (squadid..i)
			writeData(stringhelper..":objectid",squad:getObjectID())
		end) 
	    linehelper = linehelper + 1
	end

end


function patrolHelper:moveSquad(squadid, count, linemax, xoffset, yoffset, zone, patrolPoints, aiTemplate)
	local linecounter = 0
	local linehelper = 0 
	for i = 0 , count - 1 , 1 do
		local stringhelper = (squadid..i)
		if (linehelper == linemax) then
			linecounter = linecounter +1
			linehelper = 0 
		end
		local pSquad = getCreatureObject(readData(stringhelper..":objectid"))

		ObjectManager.withCreatureAiAgent(pSquad, function(aiAgent_Squad)
			aiAgent_Squad:resetBehaviorList()
			aiAgent_Squad:setFollowState(PATROLLING)
			aiAgent_Squad = self:setPath(aiAgent_Squad, linehelper * xoffset, linecounter * yoffset, zone, patrolPoints)
			aiAgent_Squad:setAiTemplate(aiTemplate)
		end)
		linehelper = linehelper + 1
	end
end

--patrolPoints =  {{x,y}, }
function patrolHelper:setPath(oAiAgent, xoffset, yoffset, zone, patrolPoints)
	if (oAiAgent ~= nil) then
		for i,v in ipairs(patrolPoints) do
			-- print("x:" .. v[1] ..  " y: " .. v[2] .. "\n")
			oAiAgent:addPatrolPointAutoZ(v[1] + xoffset, v[2] + yoffset)
			-- oAiAgent:setHomeLocation(v[1], getZoneHeightAt(zone , v[1], v[2]), v[2])
		end
	end
	return oAiAgent
end

function patrolHelper:destroySquad(squadid, count)
	for i = 0 , count - 1 , 1 do
		local stringhelper = (squadid..i)
		screenplayHelper:destroy(readData(stringhelper..":objectid"), true)
	end
end

return patrolHelper
