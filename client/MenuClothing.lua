local elements, index, get_max = {}, {}, {}
local GetPlayerDressing, PlayerComponents = false, false
local NombreClothing = nil
for k,v in ipairs(ConfigClothes.Components) do
    index[v.name] = 1
    get_max[v.name] = false
end

RMenu.Add('clothes', 'main', RageUI.CreateMenu("Magasin de vêtements", " "))
RMenu:Get('clothes', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('clothes', 'main').EnableMouse = false
RMenu:Get('clothes', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'clothes', 'main')
    end
end;


RMenu.Add('clothes', 'buy', RageUI.CreateSubMenu(RMenu:Get('clothes', 'main'),"Magasin de vêtements", '~b~Faites votre tenue'))
RMenu.Add('clothes', 'mainmanage', RageUI.CreateSubMenu(RMenu:Get('clothes', 'main'),"Magasin de vêtements", '~b~Sélectionnez ce que vous voulez faire.'))
RMenu.Add('clothes', 'manage', RageUI.CreateSubMenu(RMenu:Get('clothes', 'mainmanage'),"Magasin de vêtements", '~b~Sélectionnez la tenue que vous voulez porter.'))
RMenu.Add('clothes', 'delmanage', RageUI.CreateSubMenu(RMenu:Get('clothes', 'mainmanage'),"Magasin de vêtements", '~b~Sélectionnez la tenue que vous voulez supprimer.'))

RageUI.CreateWhile(1.0, RMenu:Get('clothes', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('clothes', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigClothes.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter une tenue", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('clothes', 'buy'))
        RageUI.Button("Gérer les tenues", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('clothes', 'mainmanage'))
        RageUI.Button("Fermer le menu", nil, { Color = {BackgroundColor = {169, 11, 11}} }, true, function(Hovered, Active, Selected)
            if (Selected) then
                GetPlayerDressing = false
                PlayerComponents = false
                TriggerEvent('ns_skinshop:getInitialSkin', function(_Skin)
                    TriggerEvent('skinchanger:loadClothes', _Skin, _Skin)
                    TriggerEvent('esx_skin:setLastSkin', _Skin)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                    end)
                end)
                RageUI.Visible(RMenu:Get('clothes', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('clothes', 'mainmanage'), true, true, true, function()
        PlayerComponents = false
        RageUI.Button("Prendre une tenue", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('clothes', 'manage'))
        RageUI.Button("Supprimer une tenue", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('clothes', 'delmanage'))
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('clothes', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigClothes.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider la tenue", "Permet de valider votre tenue.", { RightLabel = ConfigClothes.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'ns_skinshop', {
                            css      = 'skinshop',
                            title = "Nom de votre tenue"
                        }, function(data2, menu2)
                            local AddSkin = data2.value

                            if AddSkin == nil then
                                ESX.ShowAdvancedNotification('~r~Magasin de vêtements', '~c~Info', 'Vous n\'avez pas inséré un texte valide !', 'CHAR_ANTONIA', 1)
                            else
                                GetPlayerDressing = false
                                RageUI.Visible(RMenu:Get('clothes', 'buy'), false)
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('ns_skinshop:saveOutfit', AddSkin, skin)
                                end)
                                FreezeEntityPosition(PlayerPedId(), false)
                                ESX.ShowAdvancedNotification('~r~Magasin de vêtements', '~c~Info', 'Votre tenue est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                                PutOpenMenu(false)
                                menu2.close()
                                Citizen.Wait(300)
                            end
                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    else
                        ESX.ShowAdvancedNotification('~r~Coiffeur', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigClothes.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('clothes', 'manage'), true, true, true, function()
        if not GetPlayerDressing then
            TriggerEvent('ns_skinshop:GetPlayerDressing')
            GetPlayerDressing = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Prendre →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.Visible(RMenu:Get('clothes', 'manage'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
                                TriggerEvent('skinchanger:loadClothes', skin, clothes)
                                TriggerEvent('esx_skin:setLastSkin', skin)
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)
                                end)
                            end, v.value)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('clothes', 'delmanage'), true, true, true, function()
        if not GetPlayerDressing then
            TriggerEvent('ns_skinshop:GetPlayerDressing')
            GetPlayerDressing = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerDressing = false
                        RageUI.Visible(RMenu:Get('clothes', 'delmanage'), false)
                        TriggerServerEvent('esx_property:removeOutfit', v.value)
                        ESX.ShowAdvancedNotification('~r~Magasin de vêtements', '~c~Info', 'Votre tenue ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
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
