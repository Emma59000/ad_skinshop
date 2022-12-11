local elements, index, change, get_max = {}, {}, {}, {}
local GetPlayerGlasses, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigGlasses.Accessory
for k,v in ipairs(ConfigGlasses.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('glasses', 'main', RageUI.CreateMenu("Magasin de lunettes", " "))
RMenu:Get('glasses', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('glasses', 'main').EnableMouse = false
RMenu:Get('glasses', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'glasses', 'main')
    end
end;

RMenu.Add('glasses', 'buy', RageUI.CreateSubMenu(RMenu:Get('glasses', 'main'),"Magasin de lunettes", '~b~Sélectionnez votre lunette'))
RMenu.Add('glasses', 'delete', RageUI.CreateSubMenu(RMenu:Get('glasses', 'main'),"Magasin de lunettes", '~b~Sélectionnez la lunette à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('glasses', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('glasses', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigGlasses.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter une lunette", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('glasses', 'buy'))
        RageUI.Button("Supprimer une lunette", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('glasses', 'delete'))
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
                RageUI.Visible(RMenu:Get('glasses', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('glasses', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigGlasses.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider vos lunettes.", { RightLabel = ConfigGlasses.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerGlasses = false
                        RageUI.Visible(RMenu:Get('glasses', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigGlasses.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin de lunettes', '~c~Info', 'Votre lunette est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin de lunettes', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigGlasses.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('glasses', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerGlasses then
            TriggerEvent('ns_skinshop:GetPlayerGlasses')
            GetPlayerGlasses = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerGlasses = false
                        RageUI.Visible(RMenu:Get('glasses', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin de lunettes', '~c~Info', 'Votre lunette ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerGlasses')
AddEventHandler('ns_skinshop:GetPlayerGlasses', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)