local elements, index, change = {}, {}, {}
local GetPlayerAccessories = false
local NombreClothing = nil
local get_initial, valuemax, ClothingMax = {}, {}, {}
for k,v in ipairs(ConfigAccessories.Components) do
    index[v.name] = 1
    change[v.name] = v.min
    ClothingMax[v.name] = {}
    valuemax[v.name] = {}
    get_initial[v.name] = {}
end

RMenu.Add('accessories', 'main', RageUI.CreateMenu("Accessoires", " "))
RMenu:Get('accessories', 'main'):SetSubtitle("~b~Sélectionnez ce que vous voulez faire")
RMenu:Get('accessories', 'main').EnableMouse = false
RMenu:Get('accessories', 'main').Closed = function()
end;

for k,v in ipairs(ConfigAccessories.Components) do
    RMenu.Add('accessories', v.name, RageUI.CreateSubMenu(RMenu:Get('accessories', 'main'),"Accessoires", '~b~Sélectionnez ce que vous voulez faire'))
end

RageUI.CreateWhile(1.0, RMenu:Get('accessories', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('accessories', 'main'), true, true, true, function()
        for k,v in ipairs(ConfigAccessories.Components) do
            RageUI.Button(v.label, nil, { RightLabel = "Suivant →" }, true, function(_, _, Selected)
                if Selected then
                    GetPlayerAccessories = false
                end
            end, RMenu:Get('accessories', v.name))
            --[[ if GetPlayerAccessories <= 7 then
                valuemax[v.name] = 0
                table.insert(ClothingMax[v.name], valuemax[v.name])
                GetPlayerAccessories = GetPlayerAccessories + 1
                TriggerEvent('ns_skinshop:GetPlayerAccessories', v.name)
            end
            RageUI.List(v.label, ClothingMax[v.name], index[v.name], nil, {}, true, function(Hovered, Active, Selected, Index)
                index[v.name] = Index;
                if change[v.name] ~= index[v.name] then
                    change[v.name] = index[v.name]
                    plyPed = PlayerPedId()
                    if v.name == 'mask' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            startAnimAction("missfbi4", "takeoff_mask")
                            Citizen.Wait(850)
                            ClearPedTasks(plyPed)
                            if index[v.name] == 1 then
                                local reset = {['mask_1'] = 0, ['mask_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.mask[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'bracelets' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            startAnimAction("clothingtie", "try_tie_neutral_a")
                            Citizen.Wait(1000)
                            ClearPedTasks(plyPed)
                            if index[v.name] == 1 then
                                local reset = { ['bracelets_1'] = -1, ['bracelets_2'] = 0 }
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.bracelets[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'helmet' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            startAnimAction("missfbi4", "takeoff_mask")
                            Citizen.Wait(1000)
                            ClearPedTasks(plyPed)
                            if index[v.name] == 1 then
                                local reset = {['helmet_1'] = -1, ['helmet_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.helmet[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'watches' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            startAnimAction("clothingtie", "try_tie_neutral_a")
                             Citizen.Wait(1000)
                            ClearPedTasks(plyPed)
                            if index[v.name] == 1 then
                                local reset = {['watches_1'] = -1, ['watches_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.watches[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'ears' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            if index[v.name] == 1 then
                                local reset = {['eans_1'] = -1, ['eans_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.ears[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'bags' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            if index[v.name] == 1 then
                                local reset = {['bags_1'] = 0, ['bags_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.bags[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'glasses' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            startAnimAction("clothingspecs", "try_glasses_positive_a")
                            Citizen.Wait(1000)
                            ClearPedTasks(plyPed)
                            if index[v.name] == 1 then
                                local reset = {['glasses_1'] = 0, ['glasses_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.glasses[index[v.name]-1])
                            end
                        end)
                    elseif v.name == 'chain' then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            if index[v.name] == 1 then
                                local reset = {['chain_1'] = -1, ['chain_2'] = 0}
                                TriggerEvent('skinchanger:loadClothes', skin, reset)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, allacce.chain[index[v.name]-1])
                            end
                        end)
                    end
                end
            end) ]]
        end
    end, function()
    end)

    for k,v in ipairs(ConfigAccessories.Components) do
        RageUI.IsVisible(RMenu:Get('accessories', v.name), true, true, true, function()
            if not GetPlayerAccessories then
                ClothingMax[v.name] = {}
                valuemax[v.name] = 0
                table.insert(ClothingMax[v.name], valuemax[v.name])
                GetPlayerAccessories = true
                TriggerEvent('ns_skinshop:GetPlayerAccessories', v.name)
            end
            for _,info in ipairs(ClothingMax[v.name]) do  
                RageUI.Button(v.label.." "..info, nil, { RightLabel = "Mettre →" }, true, function(_, _, Selected)
                    if Selected then
                        plyPed = PlayerPedId()
                        if v.name == 'mask' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                startAnimAction("missfbi4", "takeoff_mask")
                                Citizen.Wait(850)
                                ClearPedTasks(plyPed)
                                if info == 0 then
                                    local reset = {['mask_1'] = 0, ['mask_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.mask[info])
                                end
                            end)
                        elseif v.name == 'bracelets' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                startAnimAction("clothingtie", "try_tie_neutral_a")
                                Citizen.Wait(1000)
                                ClearPedTasks(plyPed)
                                if info == 0 then
                                    local reset = { ['bracelets_1'] = -1, ['bracelets_2'] = 0 }
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.bracelets[info])
                                end
                            end)
                        elseif v.name == 'helmet' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                startAnimAction("missfbi4", "takeoff_mask")
                                Citizen.Wait(1000)
                                ClearPedTasks(plyPed)
                                if info == 0 then
                                    local reset = {['helmet_1'] = -1, ['helmet_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.helmet[info])
                                end
                            end)
                        elseif v.name == 'watches' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                startAnimAction("clothingtie", "try_tie_neutral_a")
                                 Citizen.Wait(1000)
                                ClearPedTasks(plyPed)
                                if info == 0 then
                                    local reset = {['watches_1'] = -1, ['watches_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.watches[info])
                                end
                            end)
                        elseif v.name == 'ears' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                if info == 0 then
                                    local reset = {['eans_1'] = -1, ['eans_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.ears[info])
                                end
                            end)
                        elseif v.name == 'bags' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                if info == 0 then
                                    local reset = {['bags_1'] = 0, ['bags_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.bags[info])
                                end
                            end)
                        elseif v.name == 'glasses' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                startAnimAction("clothingspecs", "try_glasses_positive_a")
                                Citizen.Wait(1000)
                                ClearPedTasks(plyPed)
                                if info == 0 then
                                    local reset = {['glasses_1'] = 0, ['glasses_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.glasses[info])
                                end
                            end)
                        elseif v.name == 'chain' then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                if info == 0 then
                                    local reset = {['chain_1'] = -1, ['chain_2'] = 0}
                                    TriggerEvent('skinchanger:loadClothes', skin, reset)
                                else
                                    TriggerEvent('skinchanger:loadClothes', skin, allacce.chain[info])
                                end
                            end)
                        end
                    end
                end)
            end
        end, function()
        end)
    end
end)

RegisterNetEvent('ns_skinshop:GetPlayerAccessories')
AddEventHandler('ns_skinshop:GetPlayerAccessories', function(accessory)
    elements = {}
    if get_initial[accessory] then
        get_initial[accessory] = false
    end
    ESX.TriggerServerCallback('ns_skinshop:getPlayerAcc', function(dressing)
        for i = 1, #dressing, 1 do
            valuemax[accessory] = i
            table.insert(ClothingMax[accessory], valuemax[accessory])
        end
    end, accessory)
    ESX.TriggerServerCallback('ns_skinshop:getaccessories', function(allaccereturn) 
		allacce = allaccereturn 
    end)
end)

function PutOpenMenuAccessories()
    GetPlayerAccessories = false
end

function startAnimAction(lib, anim)
    plyPed = PlayerPedId()
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
	end)
end