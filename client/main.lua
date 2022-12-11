ESX = nil
Character = {}
allacce = {}
local OpenMenu = false
local InitialSkin = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSh4587poiaredObj4587poiect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    Wait(3000)
    ESX.TriggerServerCallback('ns_skinshop:getaccessories', function(allaccereturn) 
		allacce = allaccereturn
    end)
end)

ClothingMax = {};
for k,v in ipairs(ConfigRegister.Components) do
    ClothingMax[v.name] = 0
end

function GetMaxVals()
	local playerPed = PlayerPedId()

	local data = {
		sex				= 1,
		face			= 45,
		skin			= 45,
		age_1			= GetNumHeadOverlayValues(3)-1,
		age_2			= 10,
		beard_1			= GetNumHeadOverlayValues(1)-1,
		beard_2			= 10,
		beard_3			= GetNumHairColors()-1,
		beard_4			= GetNumHairColors()-1,
		hair_1			= GetNumberOfPedDrawableVariations		(playerPed, 2) - 1,
		hair_2			= GetNumberOfPedTextureVariations		(playerPed, 2, Character['hair_1']) - 1,
		hair_color_1	= GetNumHairColors()-1,
		hair_color_2	= GetNumHairColors()-1,
		eye_color		= 31,
		eyebrows_1		= GetNumHeadOverlayValues(2)-1,
		eyebrows_2		= 10,
		eyebrows_3		= GetNumHairColors()-1,
		eyebrows_4		= GetNumHairColors()-1,
		makeup_1		= GetNumHeadOverlayValues(4)-1,
		makeup_2		= 10,
		makeup_3		= GetNumHairColors()-1,
		makeup_4		= GetNumHairColors()-1,
		lipstick_1		= GetNumHeadOverlayValues(8)-1,
		lipstick_2		= 10,
		lipstick_3		= GetNumHairColors()-1,
		lipstick_4		= GetNumHairColors()-1,
		blemishes_1		= GetNumHeadOverlayValues(0)-1,
		blemishes_2		= 10,
		blush_1			= GetNumHeadOverlayValues(5)-1,
		blush_2			= 10,
		blush_3			= GetNumHairColors()-1,
		complexion_1	= GetNumHeadOverlayValues(6)-1,
		complexion_2	= 10,
		sun_1			= GetNumHeadOverlayValues(7)-1,
		sun_2			= 10,
		moles_1			= GetNumHeadOverlayValues(9)-1,
		moles_2			= 10,
		chest_1			= GetNumHeadOverlayValues(10)-1,
		chest_2			= 10,
		chest_3			= GetNumHairColors()-1,
		bodyb_1			= GetNumHeadOverlayValues(11)-1,
		bodyb_2			= 10,
		eans_1			= GetNumberOfPedPropDrawableVariations	(playerPed, 1) - 1,
		eans_2			= GetNumberOfPedPropTextureVariations	(playerPed, 1, Character['eans_1'] - 1),
		tshirt_1		= GetNumberOfPedDrawableVariations		(playerPed, 8) - 1,
		tshirt_2		= GetNumberOfPedTextureVariations		(playerPed, 8, Character['tshirt_1']) - 1,
		torso_1			= GetNumberOfPedDrawableVariations		(playerPed, 11) - 1,
		torso_2			= GetNumberOfPedTextureVariations		(playerPed, 11, Character['torso_1']) - 1,
		decals_1		= GetNumberOfPedDrawableVariations		(playerPed, 10) - 1,
		decals_2		= GetNumberOfPedTextureVariations		(playerPed, 10, Character['decals_1']) - 1,
		arms			= GetNumberOfPedDrawableVariations		(playerPed, 3) - 1,
		arms_2			= 10,
		pants_1			= GetNumberOfPedDrawableVariations		(playerPed, 4) - 1,
		pants_2			= GetNumberOfPedTextureVariations		(playerPed, 4, Character['pants_1']) - 1,
		shoes_1			= GetNumberOfPedDrawableVariations		(playerPed, 6) - 1,
		shoes_2			= GetNumberOfPedTextureVariations		(playerPed, 6, Character['shoes_1']) - 1,
		mask_1			= GetNumberOfPedDrawableVariations		(playerPed, 1) - 1,
		mask_2			= GetNumberOfPedTextureVariations		(playerPed, 1, Character['mask_1']) - 1,
		bproof_1		= GetNumberOfPedDrawableVariations		(playerPed, 9) - 1,
		bproof_2		= GetNumberOfPedTextureVariations		(playerPed, 9, Character['bproof_1']) - 1,
		chain_1			= GetNumberOfPedDrawableVariations		(playerPed, 7) - 1,
		chain_2			= GetNumberOfPedTextureVariations		(playerPed, 7, Character['chain_1']) - 1,
		bags_1			= GetNumberOfPedDrawableVariations		(playerPed, 5) - 1,
		bags_2			= GetNumberOfPedTextureVariations		(playerPed, 5, Character['bags_1']) - 1,
		helmet_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 0) - 1,
		helmet_2		= GetNumberOfPedPropTextureVariations	(playerPed, 0, Character['helmet_1']) - 1,
		glasses_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 1) - 1,
		glasses_2		= GetNumberOfPedPropTextureVariations	(playerPed, 1, Character['glasses_1'] - 1),
		watches_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 6) - 1,
		watches_2		= GetNumberOfPedPropTextureVariations	(playerPed, 6, Character['watches_1']) - 1,
		bracelets_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 7) - 1,
		bracelets_2		= GetNumberOfPedPropTextureVariations	(playerPed, 7, Character['bracelets_1'] - 1)
	}

	return data
end

function ApplySkin(skin, clothes)
	local playerPed = PlayerPedId()

	for k,v in pairs(skin) do
		Character[k] = v
	end

	if clothes ~= nil then
		for k,v in pairs(clothes) do
			if
				k ~= 'sex'				and
				k ~= 'face'				and
				k ~= 'skin'				and
				k ~= 'age_1'			and
				k ~= 'age_2'			and
				k ~= 'eye_color'		and
				k ~= 'beard_1'			and
				k ~= 'beard_2'			and
				k ~= 'beard_3'			and
				k ~= 'beard_4'			and
				k ~= 'hair_1'			and
				k ~= 'hair_2'			and
				k ~= 'hair_color_1'		and
				k ~= 'hair_color_2'		and
				k ~= 'eyebrows_1'		and
				k ~= 'eyebrows_2'		and
				k ~= 'eyebrows_3'		and
				k ~= 'eyebrows_4'		and
				k ~= 'makeup_1'			and
				k ~= 'makeup_2'			and
				k ~= 'makeup_3'			and
				k ~= 'makeup_4'			and
				k ~= 'lipstick_1'		and
				k ~= 'lipstick_2'		and
				k ~= 'lipstick_3'		and
				k ~= 'lipstick_4'		and
				k ~= 'blemishes_1'		and
				k ~= 'blemishes_2'		and
				k ~= 'blush_1'			and
				k ~= 'blush_2'			and
				k ~= 'blush_3'			and
				k ~= 'complexion_1'		and
				k ~= 'complexion_2'		and
				k ~= 'sun_1'			and
				k ~= 'sun_2'			and
				k ~= 'moles_1'			and
				k ~= 'moles_2'			and
				k ~= 'chest_1'			and
				k ~= 'chest_2'			and
				k ~= 'chest_3'			and
				k ~= 'bodyb_1'			and
				k ~= 'bodyb_2'
			then
				Character[k] = v
			end
		end
	end

	SetPedHeadBlendData			(playerPed, Character['face'], Character['face'], Character['face'], Character['skin'], Character['skin'], Character['skin'], 1.0, 1.0, 1.0, true)

	SetPedHairColor				(playerPed,			Character['hair_color_1'],		Character['hair_color_2'])					-- Hair Color
	SetPedHeadOverlay			(playerPed, 3,		Character['age_1'],				(Character['age_2'] / 10) + 0.0)			-- Age + opacity
	SetPedHeadOverlay			(playerPed, 1,		Character['beard_1'],			(Character['beard_2'] / 10) + 0.0)			-- Beard + opacity
	SetPedEyeColor				(playerPed,			Character['eye_color'], 0, 1)												-- Eyes color
	SetPedHeadOverlay			(playerPed, 2,		Character['eyebrows_1'],		(Character['eyebrows_2'] / 10) + 0.0)		-- Eyebrows + opacity
	SetPedHeadOverlay			(playerPed, 4,		Character['makeup_1'],			(Character['makeup_2'] / 10) + 0.0)			-- Makeup + opacity
	SetPedHeadOverlay			(playerPed, 8,		Character['lipstick_1'],		(Character['lipstick_2'] / 10) + 0.0)		-- Lipstick + opacity
	SetPedComponentVariation	(playerPed, 2,		Character['hair_1'],			Character['hair_2'], 2)						-- Hair
	SetPedHeadOverlayColor		(playerPed, 1, 1,	Character['beard_3'],			Character['beard_4'])						-- Beard Color
	SetPedHeadOverlayColor		(playerPed, 2, 1,	Character['eyebrows_3'],		Character['eyebrows_4'])					-- Eyebrows Color
	SetPedHeadOverlayColor		(playerPed, 4, 1,	Character['makeup_3'],			Character['makeup_4'])						-- Makeup Color
	SetPedHeadOverlayColor		(playerPed, 8, 1,	Character['lipstick_3'],		Character['lipstick_4'])					-- Lipstick Color
	SetPedHeadOverlay			(playerPed, 5,		Character['blush_1'],			(Character['blush_2'] / 10) + 0.0)			-- Blush + opacity
	SetPedHeadOverlayColor		(playerPed, 5, 2,	Character['blush_3'])														-- Blush Color
	SetPedHeadOverlay			(playerPed, 6,		Character['complexion_1'],		(Character['complexion_2'] / 10) + 0.0)		-- Complexion + opacity
	SetPedHeadOverlay			(playerPed, 7,		Character['sun_1'],				(Character['sun_2'] / 10) + 0.0)			-- Sun Damage + opacity
	SetPedHeadOverlay			(playerPed, 9,		Character['moles_1'],			(Character['moles_2'] / 10) + 0.0)			-- Moles/Freckles + opacity
	SetPedHeadOverlay			(playerPed, 10,		Character['chest_1'],			(Character['chest_2'] / 10) + 0.0)			-- Chest Hair + opacity
	SetPedHeadOverlayColor		(playerPed, 10, 1,	Character['chest_3'])														-- Torso Color
	SetPedHeadOverlay			(playerPed, 11,		Character['bodyb_1'],			(Character['bodyb_2'] / 10) + 0.0)			-- Body Blemishes + opacity

	if Character['eans_1'] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex			(playerPed, 2,		Character['eans_1'],			Character['eans_2'], 2)						-- Ears Accessories
	end

	SetPedComponentVariation	(playerPed, 8,		Character['tshirt_1'],			Character['tshirt_2'], 2)					-- Tshirt
	SetPedComponentVariation	(playerPed, 11,		Character['torso_1'],			Character['torso_2'], 2)					-- torso parts
	SetPedComponentVariation	(playerPed, 3,		Character['arms'],				Character['arms_2'], 2)						-- Amrs
	SetPedComponentVariation	(playerPed, 10,		Character['decals_1'],			Character['decals_2'], 2)					-- decals
	SetPedComponentVariation	(playerPed, 4,		Character['pants_1'],			Character['pants_2'], 2)					-- pants
	SetPedComponentVariation	(playerPed, 6,		Character['shoes_1'],			Character['shoes_2'], 2)					-- shoes
	SetPedComponentVariation	(playerPed, 1,		Character['mask_1'],			Character['mask_2'], 2)						-- mask
	SetPedComponentVariation	(playerPed, 9,		Character['bproof_1'],			Character['bproof_2'], 2)					-- bulletproof
	SetPedComponentVariation	(playerPed, 7,		Character['chain_1'],			Character['chain_2'], 2)					-- chain
	SetPedComponentVariation	(playerPed, 5,		Character['bags_1'],			Character['bags_2'], 2)						-- Bag

	if Character['helmet_1'] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex			(playerPed, 0,		Character['helmet_1'],			Character['helmet_2'], 2)					-- Helmet
	end

	if Character['glasses_1'] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex			(playerPed, 1,		Character['glasses_1'],			Character['glasses_2'], 2)					-- Glasses
	end

	if Character['watches_1'] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex			(playerPed, 6,		Character['watches_1'],			Character['watches_2'], 2)					-- Watches
	end

	if Character['bracelets_1'] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex			(playerPed, 7,		Character['bracelets_1'],		Character['bracelets_2'], 2)				-- Bracelets
	end
end

AddEventHandler('ns_skinshop:getData', function(cb)
    cb(GetMaxVals())
end)

Citizen.CreateThread(function()
    while true do
        local _Wait = 500

        for k,v in pairs(ConfigClothes.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 2.0 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de vêtements")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('clothes', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
		end
		
        for k,v in pairs(ConfigBarber.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 3.0 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le coiffeur")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('barber', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigMask.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 3.0 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de masques")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('mask', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigWatches.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de montres")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('watches', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigBracelets.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de bracelets")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('bracelets', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigChain.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de chaînes")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('chain', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigBags.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de sacs")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('bags', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigEars.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin d'accessoire d'oreilles")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('ears', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigHelmet.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de casques")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('helmet', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
                end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigGlasses.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le magasin de lunettes")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('glasses', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
				end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
		
        for k,v in pairs(ConfigRegister.Shops) do
            local dst = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v, true)
            if dst <= 1.3 then
                _Wait = 1
				ShowHelpNotification("Appuyez sur ~b~E~w~ pour ouvrir le système de chirurgie")
                if IsControlJustPressed(1, 38) then
					if not OpenMenu then
						TriggerEvent('skinchanger:getSkin', function(skin)
							InitialSkin = skin
						end)
						PutOpenMenu(true)
					end
					RageUI.Visible(RMenu:Get('register', 'main'), true)
					FreezeEntityPosition(PlayerPedId(), true)
				end
			elseif dst <= Config.DrawDistance then 
				DrawMarker(Config.Type, v, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                _Wait = 1
            end
        end
        Citizen.Wait(_Wait)
    end
end)

-- Key controls 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IsControlJustReleased(0, 288) then
			RageUI.Visible(RMenu:Get('accessories', 'main'), not RageUI.Visible(RMenu:Get('accessories', 'main')))
        end
    end
end)

ShowHelpNotification = function(msg)
	AddTextEntry('HelpNotif', msg)
	DisplayHelpTextThisFrame('HelpNotif', false)
end

function PutOpenMenu(result)
	OpenMenu = result
end

function GetOpenMenu()
	return OpenMenu
end

AddEventHandler('ns_skinshop:getInitialSkin', function(cb)
    cb(InitialSkin)
end)

RegisterNetEvent('ns_skinshop:OpenShopMenuForClose')
AddEventHandler('ns_skinshop:OpenShopMenuForClose', function(menu, indexMenu)
    Citizen.Wait(100)
    RageUI.Visible(RMenu:Get(menu, indexMenu), true)
end)

RegisterNetEvent('ns_skinshop:OpenShopMenu')
AddEventHandler('ns_skinshop:OpenShopMenu', function()
	if not OpenMenu then
		TriggerEvent('skinchanger:getSkin', function(skin)
			InitialSkin = skin
		end)
		PutOpenMenu(true)
	end
	RageUI.Visible(RMenu:Get('clothes', 'main'), true)
	FreezeEntityPosition(PlayerPedId(), true)
end)

RegisterNetEvent('ns_skinshop:OpenMenuAccessories')
AddEventHandler('ns_skinshop:OpenMenuAccessories', function()
	RageUI.Visible(RMenu:Get('accessories', 'main'), not RageUI.Visible(RMenu:Get('accessories', 'main')))
end)

RegisterNetEvent('ns_skinshop:getData2')
AddEventHandler('ns_skinshop:getData2', function(name, label, min)
    ClothingMax[name] = {}

    TriggerEvent('ns_skinshop:getData', function(maxClothing)
        for k,v in ipairs(ConfigClothes.Components) do
        	ClothingMax[name] = maxClothing[name] ~= nil and maxClothing[name] or min
        end
    end)
end)