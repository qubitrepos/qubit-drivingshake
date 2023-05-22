local lastDamage = 0.0
local curDamage = 0.0
local vehicle = nil

Citizen.CreateThread(function()
    local sleep = 1000
	while true do
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if DoesEntityExist(vehicle) then
            sleep = 100
            local shakeRate = GetEntitySpeed(vehicle) / 250.0
            if vehicle ~= nil and vehicle ~= 0 then
                local curHealth = GetVehicleBodyHealth(vehicle)
                if curHealth ~= lastDamage then
                    ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
                end
                lastDamage = curHealth
            end
        else
            sleep = 1000
        end
        Citizen.Wait(sleep)
	end
end)