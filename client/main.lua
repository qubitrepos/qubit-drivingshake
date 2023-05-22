local lastDamage = 0.0
local curDamage = 0.0
local vehicle = nil

Citizen.CreateThread(function()
    local sleep = 1000
	while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed) then
            sleep = 100
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local shakeRate = GetEntitySpeed(vehicle) / 250.0 -- 250.0 Normal Shake / 100.0 High Shake / 50.0 Maksimum Shake
            local curHealth = GetVehicleBodyHealth(vehicle)
            if curHealth ~= lastDamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end
            lastDamage = curHealth
        else
            sleep = 1000
        end
        Citizen.Wait(sleep)
	end
end)