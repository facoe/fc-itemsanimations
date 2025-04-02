local QBCore = exports['qb-core']:GetCoreObject()
local isPlayingAnimation = false
local currentAnimation = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.CheckInterval) -- Comprobación cada X segundos

        local hasItem = false
        local animation = nil

        -- Verifica si el jugador tiene alguno de los ítems configurados
        for itemName, anim in pairs(Config.ItemsWithAnimations) do
            QBCore.Functions.TriggerCallback('giftbox:hasItem', function(hasItemCallback)
                if hasItemCallback then
                    hasItem = true
                    animation = anim
                end
            end, itemName)

            Citizen.Wait(200) -- Espera corta para evitar spam de llamadas al servidor
        end

        if hasItem and animation then
            if not isPlayingAnimation or animation ~= currentAnimation then
                ExecuteCommand('e c') -- Cancela animaciones anteriores
                Citizen.Wait(500) -- Pequeño delay para evitar cortes bruscos
                ExecuteCommand(animation)
                isPlayingAnimation = true
                currentAnimation = animation
            end
        elseif not hasItem and isPlayingAnimation then
            ExecuteCommand('e c') -- Cancela animaciones si el jugador ya no tiene los ítems
            isPlayingAnimation = false
            currentAnimation = nil
        end
    end
end)



--[[ 
local QBCore = exports['qb-core']:GetCoreObject()
local isPlayingAnimation = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Cada 5 segundos

        QBCore.Functions.TriggerCallback('giftbox:hasItem', function(hasItem)
            if hasItem and not isPlayingAnimation then
                -- Activa la animación solo si no se está ejecutando
                ExecuteCommand('e box')
                QBCore.Functions.Notify("¡Abriendo regalo!", "success")
                isPlayingAnimation = true
            elseif not hasItem and isPlayingAnimation then
                -- Detiene la animación si ya no tienes el objeto
                ExecuteCommand('e c') -- Comando para cancelar animaciones
                isPlayingAnimation = false
            end
        end, "gift3")
    end
end)
 ]]
