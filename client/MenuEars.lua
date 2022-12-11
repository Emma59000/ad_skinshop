local elements, index, get_max = {}, {}, {}
local GetPlayerEars, PlayerComponents = false, false
local NombreClothing = nil
local accessory = ConfigEars.Accessory
for k,v in ipairs(ConfigEars.Components) do
    index[v.name] = 1
    get_max[v.name] = false
end

RMenu.Add('ears', 'main', RageUI.CreateMenu("Magasin d'Accessoire d'oreilles", " "))
RMenu:Get('ears', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('ears', 'main').EnableMouse = false
RMenu:Get('ears', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'ears', 'main')
    end
end;

RMenu.Add('ears', 'buy', RageUI.CreateSubMenu(RMenu:Get('ears', 'main'),"Magasin d'Accessoire d'oreilles", '~b~Sélectionnez votre accessoire d\'oreilles'))
RMenu.Add('ears', 'delete', RageUI.CreateSubMenu(RMenu:Get('ears', 'main'),"Magasin d'Accessoire d'oreilles", '~b~Sélectionnez l\'accessoire d\'oreilles à supprimer'))

RageUI.CreateWhile(1.0, RMenu:Get('ears', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('ears', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigEars.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Acheter un accessoire d'oreilles", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('ears', 'buy'))
        RageUI.Button("Supprimer un accessoire d'oreilles", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('ears', 'delete'))
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
                RageUI.Visible(RMenu:Get('ears', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('ears', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigEars.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre accessoire.", { RightLabel = ConfigEars.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        GetPlayerEars = false
                        RageUI.Visible(RMenu:Get('ears', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerServerEvent('ns_skinshop:save', skin, accessory, ConfigEars.Price)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Magasin d\'Accessoire d\'oreilles', '~c~Info', 'Votre accessoire d\'oreilles est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Magasin d\'Accessoire d\'oreilles', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigEars.Price)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('ears', 'delete'), true, true, true, function()
        PlayerComponents = false
        if not GetPlayerEars then
            TriggerEvent('ns_skinshop:GetPlayerEars')
            GetPlayerEars = true
        end
        if not elements then
            RageUI.Button("Vous n'avez pas de tenue !", nil, {}, true, function(Hovered, Active, Selected)
            end)
        else
            for k,v in ipairs(elements) do
                RageUI.Button(v.label, nil, { RightLabel = "Supprimer →" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        GetPlayerEars = false
                        RageUI.Visible(RMenu:Get('ears', 'delete'), false)
                        TriggerServerEvent('ns_skinshop:deleteOutfit', v.value, accessory)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            accessory = string.lower(accessory)
                            table.remove(allacce[accessory], v.value)
                        end)
                        ESX.ShowAdvancedNotification('~r~Magasin d\'Accessoire d\'oreilles', '~c~Info', 'Votre accessoire d\'oreilles ~r~'..v.label..' ~w~est supprimée avec succès.', 'CHAR_ANTONIA', 1)
                        FreezeEntityPosition(PlayerPedId(), false)
						PutOpenMenu(false)
                    end
                end)
            end
        end
    end, function()
    end)
end)

RegisterNetEvent('ns_skinshop:GetPlayerEars')
AddEventHandler('ns_skinshop:GetPlayerEars', function()
    elements = {}
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
    end, accessory)
end)