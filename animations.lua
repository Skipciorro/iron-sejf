local animations = {}
local loot = {}
function animations.PlayAnimations(gabID)
    local animation = {}

    if gabID == 'gab1' then
        animation = {
            dict = Config.Animation.dict1,
            name = Config.Animation.name1,
            flag = 1
        }
    elseif gabID == 'gab2' then
        animation = {
            dict = Config.Animation.dict2,
            name = Config.Animation.name2,
            flag = 1
        }
    elseif gabID == 'gab3' then
        animation = {
            dict = Config.Animation.dict3,
            name = Config.Animation.name3,
            flag = 1
        }
    end
    if not animation.dict then
        print('Błąd: Nie znaleziono animacji dla gabID: ' .. (gabID or "NIEZNANE"))
        return
    end
    RequestAnimDict(animation.dict)
    while not HasAnimDictLoaded(animation.dict) do
        Wait(100)
    end

    TaskPlayAnim(PlayerPedId(), animation.dict, animation.name, 8.0, -8.0, -1, animation.flag, 0, false, false, false)
end

function loot.PlayAnimations()
    local animation = {}
        animation = {
            dict = Config.Animation.ldict1,
            name = Config.Animation.lname1,
            flag = 1
        }
    RequestAnimDict(animation.dict)
    while not HasAnimDictLoaded(animation.dict) do
        Wait(100)
    end

    TaskPlayAnim(PlayerPedId(), animation.dict, animation.name, 8.0, -8.0, -1, animation.flag, 0, false, false, false)
end

function animations.StopAnimation(dict, name)
    ClearPedTasks(PlayerPedId())
end
    
exports('StopAnimation', function(dict, name)
    animations.StopAnimation(dict, name)
end)

exports('animations', function(gabID)
    animations.PlayAnimations(gabID)
end)
exports('loot', function(lootID)
    loot.PlayAnimations()
end)
return animations