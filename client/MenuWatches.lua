local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerWatches, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigWatches.Accessory
for k,v in ipairs(ConfigWatches.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('watches', 'main', RageUI.CreateMenu("Magasin de montre", " "))
RMenu:Get('watches', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('watches', 'main').EnableMouse = false
RMenu:Get('watches', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'watches', 'main')
    end
end;

RMenu.Add('watches', 'buy', RageUI.CreateSubMenu(RMenu:Get('watches', 'main'),"Magasin de montre", '~b~Sélectionnez votre montre'))
RMenu.Add('watches', 'delete', RageUI.CreateSubMenu(RMenu:Get('watches', 'main'),"Magasin de montre", '~b~Sélectionnez la montre à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('watches', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('watches', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigWatches.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter une montre", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('watches', 'buy'))
        RageUI.Button("Supprimer une montre", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('watches', 'delete'))
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
                RageUI.Visible(RMenu:Get('watches', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('watches', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigWatches.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre montre.", { RightLabel = ConfigWatches.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerWatches = false
                        RageUI.Visible(RMenu:Get('watches', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigWatches.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        ESX.ShowAdvancedNotification('~r~Magasin de montre', '~c~Info', 'Votre montre est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de montre', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigWatches.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('watches', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerWatches then
            TriggerEvent('ns_skinshop:GetPlayerWatches')
            GetPlayerWatches = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerWatches = false
                        RageUI.Visible(RMenu:Get('watches', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de vêtements', '~c~Info', 'Votre montre ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                        PutOpenMenuAccessories()
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerWatches')
AddEventHandler('ns_skinshop:GetPlayerWatches', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)