local lastDamage = 0.0
local curDamage = 0.0
local vehicle = nil

Citizen.CreateThread(function()
  local sleep = 1000
	while true do
        local veh2 = GetVehiclePedIsIn(PlayerPedId(), false)
        vehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
        if DoesEntityExist(vehicle) and vehicle then
            sleep = 100
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
			      local shakeRate = GetEntitySpeed(veh) / 250.0
            lastdamage = curdamage
            curdamage = GetVehicleBodyHealth(vehicle)
            if curdamage ~= lastdamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end
        else
            sleep = 1000
        end
  Citizen.Wait(sleep)
	end
end)
