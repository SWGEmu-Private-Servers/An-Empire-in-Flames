-- Author: Matthias Muente (matthias.muente@gmx.de)

local conversationHelper = {}

local ObjectManager = require("managers.object.object_manager")
local MerchantHelper = require("helper.merchantHelper")

function conversationHelper:setScreen(pConversationTemplate, screenID)
    local convoTemplate = LuaConversationTemplate(pConversationTemplate)
    return convoTemplate:getScreen(screenID)
end

function conversationHelper:SetCustomOptionWithScreenCheck(conversingPlayer, conversationScreen, checkID, customDialogText, optionLink, optionText)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    if (screenID == checkID) then
        return ObjectManager.withCreatureObject(conversingPlayer, function(player)
            local conversationScreen = screen:cloneScreen()
            local clonedConversation = LuaConversationScreen(conversationScreen)
            clonedConversation:setCustomDialogText(customDialogText)
            clonedConversation:addOption(optionText, optionLink)
            return conversationScreen
        end)
    end
    return conversationScreen
end

function conversationHelper:SetCustomDialog(conversingPlayer, conversationScreen, checkID, customDialogText)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    if (screenID == checkID) then
        return ObjectManager.withCreatureObject(conversingPlayer, function(player)
            local conversationScreen = screen:cloneScreen()
            local clonedConversation = LuaConversationScreen(conversationScreen)
            clonedConversation:setCustomDialogText(customDialogText)
            return conversationScreen
        end)
    end
    return conversationScreen
end

function conversationHelper:getNextScreenStandartConversation(pConversationTemplate, pPlayer, selectedOption, pConversingNpc)
    return ObjectManager.withCreatureObject(pPlayer, function(player)
        local pConversationSession = player:getConversationSession()
        local pLastConversationScreen = nil
        if (pConversationSession ~= nil) then
            local conversationSession = LuaConversationSession(pConversationSession)
            pLastConversationScreen = conversationSession:getLastConversationScreen()
        end
        local conversationTemplate = LuaConversationTemplate(pConversationTemplate)
        if (pLastConversationScreen ~= nil) then
            local lastConversationScreen = LuaConversationScreen(pLastConversationScreen)
            local optionLink = lastConversationScreen:getOptionLink(selectedOption)
            return conversationTemplate:getScreen(optionLink)
        end
        return self:setScreen(pConversationTemplate, "first_screen")
    end)
end

function conversationHelper:RemoveAllOptions(conversationScreen)
    local screen = LuaConversationScreen(conversationScreen)
    local conversationScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(conversationScreen)
    clonedConversation:removeAllOptions()
    return conversationScreen
end

function conversationHelper:CheckItemSellAndSetScreenplayState(pConversationTemplate, pPlayer, itemName, itemCount, itemValue, stateName, stateValue, checkScreen)
    local creature = LuaCreatureObject(pPlayer)
    local convosession = creature:getConversationSession()
    local nextConversationScreen
    local lastConversationScreen = nil

    if (pConversationTemplate ~= nil ) then
        local conversation = LuaConversationTemplate(pConversationTemplate)
        local session = LuaConversationSession(convosession)
        if ( session ~= nil ) then
            lastConversationScreen = session:getLastConversationScreen()
        end
        if (lastConversationScreen == nil ) then
            nextConversationScreen = conversation:getInitialScreen()
        else
            local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
            local screen = LuaConversationScreen(nextConversationScreen)
            local screenID = luaLastConversationScreen:getScreenID()
            local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
            nextConversationScreen = conversation:getScreen(optionLink)
            local ret = false
            if (screenID == checkScreen) then
                if (optionLink == itemName) then
                    ret = MerchantHelper:sellItem(pPlayer, itemName, itemCount, itemValue) 
                end
                if (ret == false) then
                    return self:setScreen(pConversationTemplate, "insufficient_items")
                else
                    creature:setScreenPlayStateValue(stateValue, stateName)
                    return self:setScreen(pConversationTemplate, "quest_end")
                end
            end
        end
    end
    return nil
end
return conversationHelper

