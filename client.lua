ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while not Zones do Wait(100) end
    Zones.Load()
end)