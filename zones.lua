ESX = exports["es_extended"]:getSharedObject()

Zones = {
    Jewelry = {},
    LootedCase = {}
}

function Zones.UpdateZones()
    Zones.LootedCases = {}
    if not Zones.Jewelry then Zones.Jewelry = {} end
    for _, zone in pairs(Zones.Jewelry) do
        exports.ox_target:removeZone(zone.id)
    end
    Zones.Jewelry = {} 


    local hack = exports['iron-sejf']:HackValue()
    print("HackValue: ", hack)


    table.insert(Zones.Jewelry, {
        coords = Config.Zones.Location.t1,
        rotation = Config.Zones.rotation,
        debug = false,
        options = {
            {
                name = Config.Zones.Name.t1,
                icon = Config.Zones.Icon.t1,
                label = Config.Zones.Label.t1,
                distance = 1,
                onSelect = function()
                    exports['iron-sejf']:FirstHack('gab1')
                end
            }
        }
    })

    if hack >= 1 then
        table.insert(Zones.Jewelry, {
            coords = Config.Zones.Location.t2,
            rotation = Config.Zones.rotation,
            debug = false,
            options = {
                {
                    name = Config.Zones.Name.t2,
                    icon = Config.Zones.Icon.t2,
                    label = Config.Zones.Label.t2,
                    distance = 1,
                    onSelect = function()
                        exports['iron-sejf']:FirstHack('gab2')
                    end
                }
            }
        })
    end

    if hack >= 2 then
        table.insert(Zones.Jewelry, {
            coords = Config.Zones.Location.t3,
            rotation = Config.Zones.rotation,
            debug = false,
            options = {
                {
                    name = Config.Zones.Name.t3,
                    icon = Config.Zones.Icon.t3,
                    label = Config.Zones.Label.t3,
                    distance = 1,
                    onSelect = function()
                        exports['iron-sejf']:FirstHack('gab3')
                    end
                }
            }
        })
    end
    if hack >= 3 then
        local locations = {"t4", "t5", "t6", "t7", "t8", "t9", "t10", "t11", "t12"}
        local loot = Config.Zones

        for i, loc in ipairs(locations) do
            if not Zones.LootedCases[loc] then
                table.insert(Zones.Jewelry, {
                    coords = loot.Location[loc],
                    rotation = loot.rotation,
                    debug = false,
                    options = {
                        {
                            name = loot.Name[loc],
                            icon = loot.Icon[loc],
                            label = loot.Label.tx,
                            distance = 1,
                            onSelect = function()
                                if exports['iron-sejf'] and exports['iron-sejf'].SkiperLoot then
                                    exports['iron-sejf']:SkiperLoot(loc)
                                else
                                    print('Błąd: Nie znaleziono funkcji SkiperLoot')
                                end
                            end
                        }
                    }
                })
            end
        end
    end
        for _, zone in pairs(Zones.Jewelry) do
            zone.id = exports.ox_target:addBoxZone(zone)
        end
end


exports('UpdateZones', function()
    Zones.UpdateZones()
end)

function Zones.Load()
    Zones.UpdateZones()
end

return Zones