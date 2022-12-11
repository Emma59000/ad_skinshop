local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerDressing, PlayerComponents = false, false
local NombreClothing = nil
for k,v in ipairs(ConfigRegister.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('register', 'main', RageUI.CreateMenu("Register", " "))
RMenu:Get('register', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('register', 'main').EnableMouse = false
RMenu:Get('register', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'register', 'main')
    end
end;

RMenu.Add('register', 'buy', RageUI.CreateSubMenu(RMenu:Get('register', 'main'),"Register", '~b~Faites votre tenue'))

RageUI.CreateWhile(1.0, RMenu:Get('register', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('register', 'main'), true, true, true, function()

        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigRegister.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Register", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('register', 'buy'))
        RageUI.Button("Fermer le menu", nil, { Color = {BackgroundColor = {169, 11, 11}} }, true, function(Hovered, Active, Selected)
            if (Selected) then
                GetPlayerDressing = false
                PlayerComponents = false
                TriggerEvent('ns_skinshop:getInitialSkin', function(_Skin)
                    TriggerEvent('skinchanger:loadregister', _Skin, _Skin)
                    TriggerEvent('esx_skin:setLastSkin', _Skin)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                    end)
                end)
                RageUI.Visible(RMenu:Get('register', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('register', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigRegister.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider la tenue", "Permet de valider votre tenue.", { RightLabel = ConfigRegister.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                GetPlayerDressing = false
                RageUI.Visible(RMenu:Get('register', 'buy'), false)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
                FreezeEntityPosition(PlayerPedId(), false)
                ESX.ShowAdvancedNotification('~r~Register', '~c~Info', 'Votre tenue est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerDressing')
AddEventHandler('ns_skinshop:GetPlayerDressing', function()
    elements = {}
    ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
        if dressing and dressing[1] ~= nil then
            for i=1, #dressing, 1 do
                table.insert(elements, {label = dressing[i], value = i})
            end
        end
    end)
end)