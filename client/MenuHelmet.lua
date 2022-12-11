local elements, index, get_max = {}, {}, {}
local GetPlayerHelmet, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigHelmet.Accessory
for k,v in ipairs(ConfigHelmet.Components) do
    index[v.name] = 1
    get_max[v.name] = false
end

RMenu.Add('helmet', 'main', RageUI.CreateMenu("Magasin de casques", " "))
RMenu:Get('helmet', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('helmet', 'main').EnableMouse = false
RMenu:Get('helmet', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'helmet', 'main')
    end
end;

RMenu.Add('helmet', 'buy', RageUI.CreateSubMenu(RMenu:Get('helmet', 'main'),"Magasin de casques", '~b~Sélectionnez votre casque'))
RMenu.Add('helmet', 'delete', RageUI.CreateSubMenu(RMenu:Get('helmet', 'main'),"Magasin de casques", '~b~Sélectionnez le casque à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('helmet', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('helmet', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigHelmet.Components, PlayerComponents, get_max, index)
            PlayerComponents = tru
        end
        RageUI.Button("Acheter un casque", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('helmet', 'buy'))
        RageUI.Button("Supprimer un casque", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('helmet', 'delete'))
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
                RageUI.Visible(RMenu:Get('helmet', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('helmet', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigHelmet.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre casque.", { RightLabel = ConfigHelmet.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerHelmet = false
                        RageUI.Visible(RMenu:Get('helmet', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigHelmet.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de casques', '~c~Info', 'Votre casque est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de casques', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigHelmet.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('helmet', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerHelmet then
            TriggerEvent('ns_skinshop:GetPlayerHelmet')
            GetPlayerHelmet = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerHelmet = false
                        RageUI.Visible(RMenu:Get('helmet', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de casques', '~c~Info', 'Votre casque ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerHelmet')
AddEventHandler('ns_skinshop:GetPlayerHelmet', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)