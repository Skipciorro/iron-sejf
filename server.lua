ESX = exports['es_extended']:getSharedObject()
local lastRobberyTime = 0
local cooldownTime = Config.CooldownTime


RegisterServerEvent('skiper:reward', function()
   local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local reward = math.random(Config.Reward.min1, Config.Reward.max1)
    xPlayer.addInventoryItem(Config.Reward.item1, reward)
end)

ESX.RegisterServerCallback('skiper:hasitem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local item1 = xPlayer.getInventoryItem(Config.Reward.item2).count

        if item1 > 0 then
            xPlayer.removeInventoryItem(Config.Reward.item2, 1)
            cb(true)
        else
            TriggerClientEvent('ox_lib:notify', source, {
                type = 'error',
                description = Config.OX.Desc.noItem
            })
            cb(false)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('skiper:check', function(soucer, cb)
    local currentTime = GetGameTimer()
    local timeRemaining = cooldownTime - (currentTime - lastRobberyTime)

    if timeRemaining > 0 then
        local minutes = math.floor(timeRemaining / 60000)
        local seconds = math.floor((timeRemaining % 60000) / 1000)
        local timeRemainingFormatted = string.format("%02d:%02d", minutes, seconds)

        cb(false, timeRemainingFormatted)
    else
        lastRobberyTime = currentTime
        cb(true)
    end
end)

RegisterServerEvent('skiper:setCooldown')
AddEventHandler('skiper:setCooldown', function()
    lastRobberyTime = GetGameTimer()
    print("Serwer: Cooldown ustawiony na " .. cooldownTime / 1000 .. " sekund")
end)