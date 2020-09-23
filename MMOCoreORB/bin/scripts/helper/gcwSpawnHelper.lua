-- Author: Matthias Muente (matthias.muente@gmx.de)
-- https://revelationonline.net 

local gcwSpawnHelper = {}

local ObjectManager = require("managers.object.object_manager")
local ScreenplayHelper = require("helper.screenplayHelper")

function gcwSpawnHelper:despawnCityDefender(spawnMap, varStringID, faction)
    local count = 0
  
    for i,v in ipairs(spawnMap) do
        ScreenplayHelper:destroy(readData("gcw_defender:" .. varStringID .. faction .. ":CreatureID_" .. count), false)
        writeData("gcw_defender:" .. varStringID.. faction .. ":CreatureID_" .. count, 0)
        count = count + 1  
    end
    return 0
end

function gcwSpawnHelper:spawnCityDefender(spawnMap, varStringID, faction, planetName)
    local count = 0
    for i,v in ipairs(spawnMap) do
        local objectID = readData("gcw_defender:" .. varStringID .. faction .. ":CreatureID_" .. count)
        local checkCreature = getCreatureObject(objectID)
        local needRespawn = false
        if objectID == 0 then
            needRespawn = true
        end
        
        if checkCreature ~= nil and objectID > 0 then
            ObjectManager.withCreatureObject(checkCreature, function(creature)
                if creature:isInCombat() == false then
                     ScreenplayHelper:destroy(objectID,false)
                     writeData("gcw_defender:" .. varStringID .. faction .. ":CreatureID_" .. count, 0)
                     needRespawn = true
                end
            end)
        else
            needRespawn = true
        end            
         
        if needRespawn == true then
            local pCreature
            local cellID = 0
            local rotate = 0
        
            if v[6] == 999 then
                rotate = math.random(360)
            else
                rotate = v[6]
            end
        
            if v[7] > 0 then
                if v[7] > 1000 then
                    cellID = v[7]
                else
                    cellID = readData("gcw_defender:" .. varStringID .. ":CellID:" .. v[7])
                end
            end
        
            if v[8] == 0 then
                pCreature = spawnMobile(planetName, v[1], 0, v[3], v[4], v[5], rotate, cellID )
            else
                pCreature = ScreenplayHelper:spawnMobileAndIdle(planetName, v[1], 0, v[3], v[4], v[5], rotate, cellID )
            end
        
            ObjectManager.withCreatureObject(pCreature, function(mobile)
                writeData("gcw_defender:" .. varStringID .. faction .. ":CreatureID_" .. count, mobile:getObjectID())
            end)
        end
        count = count + 1
    end
    return 0
end

return gcwSpawnHelper
