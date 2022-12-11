local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerBracelets, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigBracelets.Accessory
for k,v in ipairs(ConfigBracelets.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('bracelets', 'main', RageUI.CreateMenu("Magasin de bracelets", " "))
RMenu:Get('bracelets', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('bracelets', 'main').EnableMouse = false
RMenu:Get('bracelets', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'bracelets', 'main')
    end
end;

RMenu.Add('bracelets', 'buy', RageUI.CreateSubMenu(RMenu:Get('bracelets', 'main'),"Magasin de bracelets", '~b~Sélectionnez votre bracelet'))
RMenu.Add('bracelets', 'delete', RageUI.CreateSubMenu(RMenu:Get('bracelets', 'main'),"Magasin de bracelets", '~b~Sélectionnez le bracelet à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('bracelets', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('bracelets', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigBracelets.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter un bracelet", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('bracelets', 'buy'))
        RageUI.Button("Supprimer un bracelet", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('bracelets', 'delete'))
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
                RageUI.Visible(RMenu:Get('bracelets', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('bracelets', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigBracelets.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider bracelets.", { RightLabel = ConfigBracelets.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerBracelets = false
                        RageUI.Visible(RMenu:Get('bracelets', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigBracelets.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de bracelets', '~c~Info', 'Votre bracelet est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de bracelets', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigBracelets.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('bracelets', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerBracelets then
            TriggerEvent('ns_skinshop:GetPlayerBracelets')
            GetPlayerBracelets = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerBracelets = false
                        RageUI.Visible(RMenu:Get('bracelets', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de bracelets', '~c~Info', 'Votre bracelet ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerBracelets')
AddEventHandler('ns_skinshop:GetPlayerBracelets', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)
