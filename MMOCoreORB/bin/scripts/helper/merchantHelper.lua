
-- Author: Matthias Muente (matthias.muente@gmx.de)

local merchantHelper = {}

function merchantHelper:sellItem(conversingPlayer, itemName, count, reward)
    local ret = false
    local creature = LuaCreatureObject(conversingPlayer)
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    local containerSize = inventory:getContainerObjectsSize()
    local itemCounter = 0
    local i = 0 

    for i = 0, containerSize - 1, 1 do
        local pInvObj = inventory:getContainerObject(i)
        local InvObj = LuaSceneObject(pInvObj)
        if (InvObj:getObjectName() == itemName)   then
            itemCounter = itemCounter + 1
        end
    end

    if (itemCounter >= count) then
        for i = containerSize - 1 , 0 , -1 do
            pInvObj = inventory:getContainerObject(i)
            invObj = LuaSceneObject(pInvObj)
            if (invObj:getObjectName() == itemName and count > 0 ) then
                count = count - 1
                invObj:destroyObjectFromWorld()
                invObj:destroyObjectFromDatabase()
                creature:addCashCredits(reward, true)
                ret = true
            end
        end
    end
    return ret
end

function merchantHelper:giveCredits(conversingPlayer, reward)
    local creature = LuaCreatureObject(conversingPlayer)
    creature:addCashCredits(reward, true)
    return true
end

function merchantHelper:deleteItem(conversingPlayer, itemName, count)
    local ret = false
    local creature = LuaCreatureObject(conversingPlayer)
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    local containerSize = inventory:getContainerObjectsSize()
    local itemCounter = 0
    local i = 0 

    for i = 0, containerSize - 1, 1 do
        local pInvObj = inventory:getContainerObject(i)
        local InvObj = LuaSceneObject(pInvObj)
        --printf(InvObj:getObjectName() .. "\n")
        if (InvObj:getObjectName() == itemName)   then
            itemCounter = itemCounter + 1
        end
    end

    if (itemCounter >= count) then
        for i = containerSize - 1 , 0 , -1 do
            pInvObj = inventory:getContainerObject(i)
            invObj = LuaSceneObject(pInvObj)
            if (invObj:getObjectName() == itemName and count > 0 ) then
                count = count - 1
                invObj:destroyObjectFromWorld()
                invObj:destroyObjectFromDatabase()
                ret = true
            end
        end
    end
    return ret
end

function merchantHelper:checkInventoryRoom(conversingPlayer, itemCount)
    local ret = false
    local creature = LuaCreatureObject(conversingPlayer)
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    local containerSize = inventory:getContainerObjectsSize()

    if containerSize < 81 - itemCount then
        ret =  true
    else
        ret = false
    end           
    return ret
end

function merchantHelper:giveItem(conversingPlayer,templatePath)
    local ret = true
    local creature = LuaCreatureObject(conversingPlayer)
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    creature:generateLoot(templatePath,1)
    return ret
end

return merchantHelper
