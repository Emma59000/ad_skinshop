ESX = nil

TriggerEvent('esx:getSh4587poiaredObj4587poiect', function(obj) ESX = obj end)

RegisterServerEvent('ns_skinshop:saveOutfit')
AddEventHandler('ns_skinshop:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  =  exports['mpClothes']:toCustomSkin(skin)
		})

		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('ns_skinshop:buyClothes', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('ns_skinshop:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)

ESX.RegisterServerCallback('ns_skinshop:getPlayerAcc', function(source, cb, accessory)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
	  	local count    = store.count('skin')
	  	local labels   = {}
		for i=1, count, 1 do
			local entry = store.get('skin', i)
			table.insert(labels, i)
		end
		cb(labels)
	end)
end)

RegisterServerEvent('ns_skinshop:deleteOutfit')
AddEventHandler('ns_skinshop:deleteOutfit', function(label, accessory)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		local dressing = store.get('skin')
		if dressing == nil then
			dressing = {}
		end
		label = label
		table.remove(dressing, label)
		store.set('skin', dressing)
	end)
end)

RegisterServerEvent('ns_skinshop:save')
AddEventHandler('ns_skinshop:save', function(skinplayer, accessory, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		local count    = store.count('skin')
		if count < 16 then
			local accesor = store.get('skin')
			local temp = {}
			if accesor == nil then
				accesor = {}
			end
			if accessory == "Ears" then
				accessory = "eans"
			end
			skinplayer =  exports['mpClothes']:toCustomSkin(skinplayer)
			local item1 = string.lower(accessory) .. '_1'
			local item2 = string.lower(accessory) .. '_2'
			temp[item1] = skinplayer[item1]
			temp[item2] = skinplayer[item2]
			temp[item1..'_custom'] = skinplayer[item1..'_custom']
			temp[item2..'_custom'] = skinplayer[item2..'_custom']
			table.insert(accesor, temp)
			store.set('skin', accesor)
		else
			TriggerClientEvent('esx:showAdvancedNotification', _source, "~r~Magasin", "~c~Info", "Vous avez trop d\'accessoires de ce type, Vous avez était remboursé", "CHAR_ANTONIA", 1,5)
			xPlayer.addMoney(price)
		end
	end)
end)


local allaccesories = {}
ESX.RegisterServerCallback('ns_skinshop:getaccessories', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_mask', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasMask') and store.get('hasmask') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['mask'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_helmet', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasHelmet') and store.get('hasHelmet') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['helmet'] = entry

	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_watches', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasWatches') and store.get('hasWatches') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['watches'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_ears', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasEars') and store.get('hasEars') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['ears'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_bags', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasBags') and store.get('hasBags') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['bags'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_glasses', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasGlasses') and store.get('hasGlasses') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['glasses'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_bracelets', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasBracelets') and store.get('hasBracelets') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['bracelets'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_chain', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasChain') and store.get('hasChain') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count   = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = exports['mpClothes']:fromCustomSkin(store.get('skin', i))
		end

		allaccesories['chain'] = entry


	end)


	cb(allaccesories)
end)
