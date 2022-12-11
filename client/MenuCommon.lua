function getPlayerComponents(Components, PlayerComponents, get_max, index)
    if not PlayerComponents then
        for k,v in ipairs(Components) do
            TriggerEvent('skinchanger:getSkin', function(skin)
                ApplySkin(skin)
                index[v.name] = skin[v.name] ~= nill and skin[v.name] or v.min
            end)
            TriggerEvent('ns_skinshop:getData2', v.name, v.label, v.min)
            get_max[v.name] = true
        end
        return get_max, index
    else
        return get_max, index
    end
end

function buildMenuBuy(k, v, get_max, index)

    if not get_max[v.name] then
        TriggerEvent('skinchanger:getSkin', function(skin)
            ApplySkin(skin)
            index[v.name] = skin[v.name] ~= nil and skin[v.name] or v.min
        end)
        TriggerEvent('ns_skinshop:getData2', v.name, v.label, v.min)
        get_max[v.name] = true
    else
        if ClothingMax[v.name] ~= nil and ClothingMax[v.name] - v.min ~= 0 then

            RageUI.IncrementList(
                v.label,
                v.min,                        -- Start value
                ClothingMax[v.name],          -- End Value
                index[v.name],                -- Current Value
                function(Value)               -- Callback for display label
                    return exports['mpClothes']:valueInContinue(Character.sex, v.name, Value) - v.min
                end,
                "Utilisé les flèches pour vous déplacer dans le menu. Entrer pour aller directement à une valeur.", -- Description
                {}, true,                              -- Style, Active
                function(hovered, active, selected)    -- Main callback
                    if selected then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'ad_creation', {
                            css   = 'skinshop',
                            title = "Entrer un numero",
                            noValidate = true,
                        }, function(data, menu)

                            local value = tonumber(data.value);

                            if value ~= nil then
                                value = exports['mpClothes']:continueToValue(Character.sex, v.name, math.floor(value) + v.min);
                                
                                if (value < v.min) then
                                    value = exports['mpClothes']:skipValue(Character.sex, v.name, ClothingMax[v.name], direction)
                                end
                                if (value > ClothingMax[v.name]) then
                                    value = exports['mpClothes']:skipValue(Character.sex, v.name, v.min, direction)
                                end
                                index[v.name]  = value;
                                TriggerEvent("skinchanger:change", v.name, index[v.name])
                                Character[v.name] = index[v.name]
                                ApplySkin(Character)

                                if v.sname then
                                    TriggerEvent("skinchanger:change", v.sname, 0)
                                    Character[v.sname] = 0
                                    index[v.sname] = 0
                                    ApplySkin(Character)
                                    get_max[v.sname] = false
                                end
                                
                                menu.close()
                                Citizen.Wait(300)
                            end

                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    end
                end,
                function(Value, Direction)    -- Callback on change

                    Value = exports['mpClothes']:skipValue(Character.sex, v.name, Value, Direction)
                    if (Value < v.min) then
                        Value = exports['mpClothes']:skipValue(Character.sex, v.name, ClothingMax[v.name], Direction)
                    end
                    if (Value > ClothingMax[v.name]) then
                        Value = exports['mpClothes']:skipValue(Character.sex, v.name, v.min, Direction)
                    end

                    index[v.name] = Value

                    TriggerEvent("skinchanger:change", v.name, index[v.name])
                    Character[v.name] = index[v.name]
                    ApplySkin(Character)

                    if v.sname then
                        TriggerEvent("skinchanger:change", v.sname, 0)
                        Character[v.sname] = 0
                        index[v.sname] = 0
                        ApplySkin(Character)
                        get_max[v.sname] = false
                    end

                end
            );
            
        else
            RageUI.Button(v.label, nil, { RightLabel = "~r~Article non disponible" }, true, function(_, _, Selected)
                if Selected then
                    TriggerEvent("skinchanger:change", v.name, #ClothingMax[v.name])
                    Character[v.name] = #ClothingMax[v.name]
                    ApplySkin(Character)
                    change[v.name] = #ClothingMax[v.name]
                    get_max[v.name] = false
                end
            end)
        end
    end

end