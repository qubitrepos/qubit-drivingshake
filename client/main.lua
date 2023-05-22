local lastDamage = 0.0
local curDamage = 0.0
local vehicle = nil

Citizen.CreateThread(function()
    local sleep = 1000
	while true do
        vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            sleep = 100
			local shakeRate = GetEntitySpeed(vehicle) / 250.0
            curdamage = GetVehicleBodyHealth(vehicle)
            if curdamage ~= lastdamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end
            lastdamage = curdamage
        else
            sleep = 1000
        end
        Citizen.Wait(sleep)
	end
end)
