-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(ConfigClothes.Blip) do
		local blip = AddBlipForCoord(v)

        SetBlipSprite(blip, 73)
        SetBlipScale(blip, 0.70)
        SetBlipColour(blip, 47)
        SetBlipCategory(blip, 7)
        SetBlipDisplay(blip, 8)
        SetBlipAsShortRange(blip, 1)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('vêtements')
        EndTextCommandSetBlipName(blip)
    end
    
	for k,v in ipairs(ConfigBarber.Blip) do
		local blip = AddBlipForCoord(v)

        SetBlipSprite(blip, 71)
        SetBlipScale(blip, 0.70)
        SetBlipColour(blip, 51)
        SetBlipCategory(blip, 7)
        SetBlipDisplay(blip, 8)
        SetBlipAsShortRange(blip, 1)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Coiffeur")
        EndTextCommandSetBlipName(blip)
    end
    
	for k,v in ipairs(ConfigMask.Blip) do
		local blip = AddBlipForCoord(v)

        SetBlipSprite(blip, 362)
        SetBlipScale(blip, 0.70)
        SetBlipColour(blip, 2)
        SetBlipCategory(blip, 7)
        SetBlipDisplay(blip, 8)
        SetBlipAsShortRange(blip, 1)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Coiffeur")
        EndTextCommandSetBlipName(blip)
    end
end)