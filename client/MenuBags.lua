local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerBags, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigBags.Accessory
for k,v in ipairs(ConfigBags.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('bags', 'main', RageUI.CreateMenu("Magasin de sacs", " "))
RMenu:Get('bags', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('bags', 'main').EnableMouse = false
RMenu:Get('bags', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'bags', 'main')
    end
end;

RMenu.Add('bags', 'buy', RageUI.CreateSubMenu(RMenu:Get('bags', 'main'),"Magasin de sacs", '~b~Sélectionnez votre sac'))
RMenu.Add('bags', 'delete', RageUI.CreateSubMenu(RMenu:Get('bags', 'main'),"Magasin de sacs", '~b~Sélectionnez la sac à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('bags', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('bags', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigBags.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter une sac", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('bags', 'buy'))
        RageUI.Button("Supprimer une sac", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('bags', 'delete'))
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
                RageUI.Visible(RMenu:Get('bags', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('bags', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigBags.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre barbe.", { RightLabel = ConfigBags.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerBags = false
                        RageUI.Visible(RMenu:Get('bags', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigBags.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de sacs', '~c~Info', 'Votre sac est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de sacs', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigBags.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('bags', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerBags then
            TriggerEvent('ns_skinshop:GetPlayerBags')
            GetPlayerBags = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerBags = false
                        RageUI.Visible(RMenu:Get('bags', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de sacs', '~c~Info', 'Votre sac ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerBags')
AddEventHandler('ns_skinshop:GetPlayerBags', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)
