local lastdamage = 0.0
local curdamage = 0.0
local curspeed = 0.0
local vehicle

Citizen.CreateThread(function()
	while true do
        local veh2 = GetVehiclePedIsIn(PlayerPedId(), false)
        vehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
        if DoesEntityExist(vehicle) and vehicle then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
			local shakeRate = GetEntitySpeed(veh) / 250.0
            print(shakeRate)
            lastdamage = curdamage
            curdamage = GetVehicleBodyHealth(vehicle)
            if curdamage ~= lastdamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end
        else
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
	end
end)
