local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerMask, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigMask.Accessory
for k,v in ipairs(ConfigMask.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('mask', 'main', RageUI.CreateMenu("Magasin de masques", " "))
RMenu:Get('mask', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('mask', 'main').EnableMouse = false
RMenu:Get('mask', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'mask', 'main')
    end
end;

RMenu.Add('mask', 'buy', RageUI.CreateSubMenu(RMenu:Get('mask', 'main'),"Magasin de masques", '~b~Sélectionnez votre masque'))
RMenu.Add('mask', 'delete', RageUI.CreateSubMenu(RMenu:Get('mask', 'main'),"Magasin de masques", '~b~Sélectionnez le masque à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('mask', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('mask', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigMask.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter un masque", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('mask', 'buy'))
        RageUI.Button("Supprimer un masque", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('mask', 'delete'))
        RageUI.Button("Fermer le menu", nil, { Color = {BackgroundColor = {169, 11, 11}} }, true, function(Hovered, Active, Selected)
            if (Selected) then
                PlayerComponents = false
                TriggerEvent('ns_skinshop:getInitialSkin', function(_Skin)
                    TriggerEvent('skinchanger:loadClothes', _Skin, _Skin)
                    TriggerEvent('esx_skin:setLastSkin', _Skin)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                    end)
                end)
                RageUI.Visible(RMenu:Get('mask', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('mask', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigMask.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre masque.", { RightLabel = ConfigMask.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerMask = false
                        RageUI.Visible(RMenu:Get('mask', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigMask.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de masques', '~c~Info', 'Votre masque est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de masques', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigMask.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('mask', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerMask then
            TriggerEvent('ns_skinshop:GetPlayerMask')
            GetPlayerMask = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerMask = false
                        RageUI.Visible(RMenu:Get('mask', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de masques', '~c~Info', 'Votre masque ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerMask')
AddEventHandler('ns_skinshop:GetPlayerMask', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)