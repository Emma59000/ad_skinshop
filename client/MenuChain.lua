local elements, index, get_max = {}, {}, {}
local GetPlayerChain, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigChain.Accessory
for k,v in ipairs(ConfigChain.Components) do
    index[v.name] = 1
    get_max[v.name] = false
end

RMenu.Add('chain', 'main', RageUI.CreateMenu("Magasin de Chaînes", " "))
RMenu:Get('chain', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('chain', 'main').EnableMouse = false
RMenu:Get('chain', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'chain', 'main')
    end
end;

RMenu.Add('chain', 'buy', RageUI.CreateSubMenu(RMenu:Get('chain', 'main'),"Magasin de Chaînes", '~b~Sélectionnez votre chaîne'))
RMenu.Add('chain', 'delete', RageUI.CreateSubMenu(RMenu:Get('chain', 'main'),"Magasin de Chaînes", '~b~Sélectionnez la chaîne à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('chain', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('chain', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigChain.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter une Chaîne", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('chain', 'buy'))
        RageUI.Button("Supprimer une Chaîne", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('chain', 'delete'))
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
                RageUI.Visible(RMenu:Get('chain', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('chain', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigChain.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre chaîne.", { RightLabel = ConfigChain.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerChain = false
                        RageUI.Visible(RMenu:Get('chain', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigChain.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de Chaînes', '~c~Info', 'Votre Chaîne est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de Chaînes', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigChain.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('chain', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerChain then
            TriggerEvent('ns_skinshop:GetPlayerChain')
            GetPlayerChain = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerChain = false
                        RageUI.Visible(RMenu:Get('chain', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de Chaînes', '~c~Info', 'Votre Chaîne ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerChain')
AddEventHandler('ns_skinshop:GetPlayerChain', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)
