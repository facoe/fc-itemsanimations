local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('giftbox:hasItem', function(source, cb, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local item = Player.Functions.GetItemByName(itemName)
        cb(item ~= nil)
    else
        cb(false)
    end
end)


--[[ 
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('giftbox:hasItem', function(source, cb, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local item = Player.Functions.GetItemByName(itemName)
        cb(item ~= nil)
    else
        cb(false)
    end
end) ]]

