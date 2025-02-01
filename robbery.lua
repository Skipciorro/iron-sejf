
ESX = exports["es_extended"]:getSharedObject()
local chance = 0
local hack = 0
local loot = 0

function HackValue()
    return hack
end

exports('HackValue', HackValue)

local maxChance = 3
function FirstHack(gabID)
    ESX.TriggerServerCallback('skiper:check', function(canRob, timeRemaining)
        if not canRob then
            TriggerEvent('ox_lib:notify', {
                type = 'error',
                description = Config.Cooldown.Time .. timeRemaining
            }) return
        end
    
        if chance >= maxChance then
            TriggerEvent('ox_lib:notify', {
                type = 'error',
                description = Config.OX.Desc.errorgame
            })
            return
        end
        ESX.TriggerServerCallback('skiper:hasitem', function(hasItem)
            if hasItem then
                if exports.ox_lib:progressCircle({
                    duration = Config.OX.Duration.first,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        combat = true,
                        car = true,
                    },
                    anim = exports['iron-sejf']:animations(gabID)
                })
                then
                    exports['iron-sejf']:StopAnimation()
                    local gamesuccess = exports['shinyx_crack']:StartGame()
                    if gamesuccess then
                        hack = math.min(hack + 1, 3)
                        TriggerServerEvent('skiper:setCooldown')
                        TriggerEvent('ox_lib:notify', {
                            type = 'success',
                            description = Config.OX.Desc.success
                        })
                        exports['iron-sejf']:UpdateZones()
                    else
                        chance = chance + 1
                        TriggerEvent('ox_lib:notify', {
                            type = 'error',
                            description = Config.OX.Desc.error
                        })
                    end
                else
                    TriggerEvent('ox_lib:notify', {
                        type = 'error',
                        description = Config.OX.Desc.errorprog
                    })
                    exports['iron-sejf']:StopAnimation()
                    return
                end
            end
        end)
    end)
end

function SkiperLoot(caseID)

    if Zones.LootedCase[caseID] then
        TriggerEvent('ox_lib:notify', {
            type = 'error',
            description = Config.Loot.Message.looted
        })
        return
    end

    local success = exports.ox_lib:progressCircle({
        duration = Config.OX.Duration.first,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            combat = true,
            car = true,
        },
        anim = exports['iron-sejf']:loot()
    })
    if success then
        exports['iron-sejf']:StopAnimation()
        Zones.LootedCase[caseID] = true
        exports.ox_target:removeZone(caseID)
        TriggerServerEvent('skiper:collectLoot')
        loot = loot + 1
    else
        TriggerEvent('ox_lib:notify', {
            type = 'error',
            description = Config.Loot.Message.error
        })
        exports['iron-sejf']:StopAnimation()
        return
    end
end

exports('SkiperLoot', SkiperLoot)
exports('FirstHack', FirstHack)