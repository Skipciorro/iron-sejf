ESX = exports["es_extended"]:getSharedObject()
local Loot = {}

Loot.Config = {
    Items = {
        {name = Config.Loot.Item.one, min = 1, max = 2, chance = 20 },
        {name = Config.Loot.Item.two, min = 1, max = 2, chance = 20 },
        {name = Config.Loot.Item.three, min = 1, max = 2, chance = 20 },
        {name = Config.Loot.Item.four, min = 1, max = 2, chance = 20 },
        {name = Config.Loot.Item.five, min = 1, max = 2, chance = 20 },
        {name = Config.Loot.Item.six, min = 1, max = 2, chance = 20 },
    },
    Chance = 80
}

function Loot.GenerateLoot()
    local loot = {}
    if math.random(1, 100) <= Loot.Config.Chance then
        local totalChance = 0
        for _, item in pairs(Loot.Config.Items) do
            totalChance = totalChance + item.chance
        end
        local randomChance = math.random(1, totalChance)
        local cumulativeChance = 0
        for _, item in pairs(Loot.Config.Items) do
            cumulativeChance = cumulativeChance + item.chance
            if randomChance <= cumulativeChance then
                local amount = math.random(item.min, item.max)
                table.insert(loot, {name = item.name, amount = amount})
                break
            end
        end
    end
    return loot
end

RegisterServerEvent('skiper:collectLoot')
AddEventHandler('skiper:collectLoot', function()
    print('Serwer: Otrzymano event (skiper:collectLoot)')
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then print('Błąd: xPlayer nie został znaleziony !') return end

    local loot = Loot.GenerateLoot()
    if #loot > 0 then
        for _, item in pairs(loot) do
            xPlayer.addInventoryItem(item.name, item.amount)
            print('Serwer: Dodano przedmiot: ' .. item.name .. ' w ilości: ' .. item.amount)
        end
    else
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = Config.Loot.Message.noLoot
        })
        print('Serwer: Nie otrzymano żadnego przedmiotu')
    end
end)

return Loot
