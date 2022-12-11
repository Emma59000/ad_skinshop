local elements, index, change, get_max = {}, {}, {}, {}
local PlayerComponents = false
local NombreClothing = nil
for k,v in ipairs(ConfigBarber.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    get_max[v.name] = false
end

RMenu.Add('barber', 'main', RageUI.CreateMenu("Coiffeur", " "))
RMenu:Get('barber', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('barber', 'main').EnableMouse = false
RMenu:Get('barber', 'main').Closed = function()
    if GetOpenMenu() then
        TriggerEvent("ns_skinshop:OpenShopMenuForClose", 'barber', 'main')
    end
end;

RMenu.Add('barber', 'buy', RageUI.CreateSubMenu(RMenu:Get('barber', 'main'),"Coiffeur", '~b~Choisissez ce que vous voulez faire'))

RageUI.CreateWhile(1.0, RMenu:Get('barber', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('barber', 'main'), true, true, true, function()
        if (not PlayerComponents) then
            get_max, index = getPlayerComponents(ConfigBarber.Components, PlayerComponents, get_max, index)
            PlayerComponents = true
        end
        RageUI.Button("Passer chez le coiffeur", nil, { RightLabel = "Suivant →" }, true, function(Hovered, Active, Selected)
        end, RMenu:Get('barber', 'buy'))
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
                RageUI.Visible(RMenu:Get('barber', 'main'), false)
                FreezeEntityPosition(PlayerPedId(), false)
                PutOpenMenu(false)
            end
        end)
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('barber', 'buy'), true, true, true, function()
        PlayerComponents = false
        for k,v in ipairs(ConfigBarber.Components) do
            buildMenuBuy(k, v, get_max, index)
        end

        RageUI.Button("Valider l'achat", "Permet de valider votre coiffure.", { RightLabel = ConfigBarber.Price.."~g~$", Color = {BackgroundColor = {102, 204, 255}} }, true, function(_, _, Selected)
            if (Selected) then
                ESX.TriggerServerCallback('ns_skinshop:buyClothes', function(bought)
                    if bought then
                        RageUI.Visible(RMenu:Get('barber', 'buy'), false)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PutOpenMenu(false)
                        PutOpenMenuAccessories()
                        ESX.ShowAdvancedNotification('~r~Coiffeur', '~c~Info', 'Votre coiffure est enregistrée avec succès.', 'CHAR_ANTONIA', 1)
                    else
                        ESX.ShowAdvancedNotification('~r~Coiffeur', '~c~Info', 'Vous n\'avez pas l\'argent.', 'CHAR_ANTONIA', 1)
                    end
                end, ConfigBarber.Price)
            end
        end)
    end, function()
    end)
end)
