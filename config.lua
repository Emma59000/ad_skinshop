Config = {}
ConfigRegister = {}
ConfigClothes = {}
ConfigBarber = {}
ConfigMask = {}
ConfigWatches = {}
ConfigBracelets = {}
ConfigChain = {}
ConfigBags = {}
ConfigEars = {}
ConfigHelmet = {}
ConfigGlasses = {}
ConfigAccessories = {}

Config.DrawDistance = 10.0
Config.Size   = {x = 1.5, y = 2.0, z = 1.5}
Config.Color  = {r = 255, g = 255, b = 255}
Config.Type   = 6

ConfigRegister.Price = 0
ConfigClothes.Price = 40
ConfigBarber.Price = 30
ConfigMask.Price = 60
ConfigWatches.Price = 60
ConfigBracelets.Price = 60
ConfigChain.Price = 60
ConfigBags.Price = 60
ConfigEars.Price = 60
ConfigHelmet.Price = 60
ConfigGlasses.Price = 60
ConfigMask.Accessory = 'Mask'
ConfigWatches.Accessory = 'Watches'
ConfigBracelets.Accessory = 'Bracelets'
ConfigChain.Accessory = 'Chain'
ConfigBags.Accessory = 'Bags'
ConfigEars.Accessory = 'Ears'
ConfigHelmet.Accessory = 'Helmet'
ConfigGlasses.Accessory = 'Glasses'

ConfigAccessories.Components = {
	{name = 'mask', label = "Masque"},
	{name = 'bracelets', label = "Bracelet"},
	{name = 'helmet', label = "Casque / Chapeau"},
	{name = 'watches', label = "Montre"},
	{name = 'ears', label = "Accessoire oreilles"},
	{name = 'bags', label = "Sac"},
	{name = 'glasses', label = "Lunette"},
	{name = 'chain', label = "Chaîne"},
}
-- -- -- -- -- -- -- -- --
-- -- -- Register -- -- --
-- -- -- -- -- -- -- -- --

ConfigRegister.Shops = {
	vector3(402.77, -998.42, -100.004),
}

ConfigRegister.Components = {   
	{ label = 'Sexe',                   name = 'sex',          sname = nil,            value = 0,    min = 0,    zoomOffset = 0.6,   camOffset = 0.65 },
	{ label = 'Visage',                 name = 'face',         sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Peau',                   name = 'skin',         sname = nil,            value = 0,    min = 0,    zoomOffset = 0.5,   camOffset = 0.65 },
	{ label = 'Cheveux 1',              name = 'hair_1',       sname = 'hair_2',       value = 0,    min = 0,    zoomOffset = 0.5,   camOffset = 0.65 },
	{ label = 'Cheveux 2',              name = 'hair_2',       sname = nil,            value = 0,    min = 0,    zoomOffset = 0.5,   camOffset = 0.65 },
	{ label = 'Couleur cheveux 1',      name = 'hair_color_1', sname = 'hair_color_2', value = 0,    min = 0,    zoomOffset = 0.5,   camOffset = 0.65 },
	{ label = 'Couleur cheveux 2',      name = 'hair_color_2', sname = nil,            value = 0,    min = 0,    zoomOffset = 0.5,   camOffset = 0.65 },
	{ label = 'T-Shirt 1',              name = 'tshirt_1',     sname = 'tshirt_2',     value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'T-Shirt 2',              name = 'tshirt_2',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'tshirt_1' },
	{ label = 'Torse 1',                name = 'torso_1',      sname = 'torso_2',      value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Torse 2',                name = 'torso_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'torso_1' },
	{ label = 'Calques 1',              name = 'decals_1',     sname = 'decals_2',     value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Calques 2',              name = 'decals_2',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'decals_1' },
	{ label = 'Bras',                   name = 'arms',         sname = 'arms_2',       value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Bras 2',                 name = 'arms_2',       sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Jambes 1',               name = 'pants_1',      sname = 'pants_2',      value = 0,    min = 0,    zoomOffset = 0.8,   camOffset = -0.5 },
	{ label = 'Jambes 2',               name = 'pants_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.8,   camOffset = -0.5, textureof = 'pants_1' },
	{ label = 'Chaussures 1',           name = 'shoes_1',      sname = 'shoes_2',      value = 0,    min = 0,    zoomOffset = 0.8,   camOffset = -0.8},
	{ label = 'Chaussures 2',           name = 'shoes_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.8,   camOffset = -0.8, textureof = 'shoes_1' },
	{ label = 'Masque 1',               name = 'mask_1',       sname = 'mask_2',       value = 0,    min = 0,    zoomOffset = 0.6,   camOffset = 0.65 },
	{ label = 'Masque 2',               name = 'mask_2',       sname = nil,            value = 0,    min = 0,    zoomOffset = 0.6,   camOffset = 0.65, textureof = 'mask_1' },
	{ label = 'Gilet pare-balle 1',     name = 'bproof_1',     sname = 'bproof_2',     value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Gilet pare-balle 2',     name = 'bproof_2',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'bproof_1' },
	{ label = 'Chaine 1',               name = 'chain_1',      sname = 'chain_2',      value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Chaine 2',               name = 'chain_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'chain_1' },
	{ label = 'Casque 1',               name = 'helmet_1',     sname = 'helmet_2',     value = -1,   min = -1,   zoomOffset = 0.4,   camOffset = 0.65, componentId = 0 },
	{ label = 'Casque 2',               name = 'helmet_2',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65, textureof = 'helmet_1' },
	{ label = 'Lunettes 1',             name = 'glasses_1',    sname = 'glasses_2',    value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Lunettes 2',             name = 'glasses_2',    sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65, textureof = 'glasses_1'},
	{ label = 'Montre 1',               name = 'watches_1',    sname = 'watches_2',    value = -1,   min = -1,   zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Montre 2',               name = 'watches_2',    sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'watches_1'},
	{ label = 'Bracelet 1',             name = 'bracelets_1',  sname = 'bracelets_2',  value = -1,   min = -1,   zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Bracelet 2',             name = 'bracelets_2',  sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'bracelets_1' },
	{ label = 'Sac',                    name = 'bags_1',       sname = 'bags_2',       value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Couleur sac',            name = 'bags_2',       sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15, textureof = 'bags_1' },
	{ label = 'Lentilles colorées',     name = 'eye_color',    sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Taille sourcils',        name = 'eyebrows_2',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Type sourcils',          name = 'eyebrows_1',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur sourcils 1',     name = 'eyebrows_3',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur sourcils 2',     name = 'eyebrows_4',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Type maquillage',        name = 'makeup_1',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Epaisseur maquillage',   name = 'makeup_2',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur maquillage 1',   name = 'makeup_3',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur maquillage 2',   name = 'makeup_4',     sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Type lipstick',          name = 'lipstick_1',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Epaisseur lipstick',     name = 'lipstick_2',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur lipstick 1',     name = 'lipstick_3',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Couleur lipstick 2',     name = 'lipstick_4',   sname = nil,            value = 0,    min = 0,    zoomOffset = 0.35,  camOffset = 0.65 },
	{ label = 'Accessoire oreilles',    name = 'eans_1',       sname = 'eans_2',       value = -1,   min = -1,   zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Couleur accessoire',     name = 'eans_2',       sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65, textureof = 'eans_1'},
	{ label = 'Pillositée torse',       name = 'chest_1',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Opacité pillositée',     name = 'chest_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Couleur pillositée',     name = 'chest_3',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Imperfections du corps', name = 'bodyb_1',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Opacité imperfections',  name = 'bodyb_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.75,  camOffset = 0.15 },
	{ label = 'Rides',                  name = 'age_1',        sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Epaisseur rides',        name = 'age_2',        sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Boutons',                name = 'blemishes_1',  sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Opacité des boutons',    name = 'blemishes_2',  sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Rougeur',                name = 'blush_1',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Opacité rougeur',        name = 'blush_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Couleur rougeur',        name = 'blush_3',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Teint',                  name = 'complexion_1', sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Opacité teint',          name = 'complexion_2', sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Dommages UV',            name = 'sun_1',        sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Opacité dommages UV',    name = 'sun_2',        sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Taches de rousseur',     name = 'moles_1',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Opacité rousseur',       name = 'moles_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Type barbe',             name = 'beard_1',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Taille barbe',           name = 'beard_2',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Couleur barbe 1',        name = 'beard_3',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
	{ label = 'Couleur barbe 2',        name = 'beard_4',      sname = nil,            value = 0,    min = 0,    zoomOffset = 0.4,   camOffset = 0.65 },
}

-- -- -- -- -- -- -- -- --
-- Magasin de vêtements --
-- -- -- -- -- -- -- -- --

ConfigClothes.Shops = {
	vector3(72.3, -1399.1, 28.4),
	vector3(-703.8, -152.3, 36.4),
	vector3(-167.9, -299.0, 38.7),
	vector3(428.7, -800.1, 28.5),
	vector3(-829.4, -1073.7, 10.3),
	vector3(-1447.8, -242.5, 48.8),
	vector3(11.6, 6514.2, 30.9),
    vector3(123.6, -219.4, 53.6),
	vector3(1696.3, 4829.3, 41.1),
	vector3(618.1, 2759.6, 41.1),
	vector3(1190.6, 2713.4, 37.2),
	vector3(-1193.4, -772.3, 16.3),
	vector3(-3172.5, 1048.1, 19.9),
	vector3(-1108.4, 2708.9, 18.1),
	vector3(4489.4, -4453.17, 3.36), -- Cayo Perico
	vector3(-1093.04, -832.79, 13.28), -- Police
	vector3(-440.39, 6010.48, 30.71), -- Sheriff
	vector3(2128.49, 2925.64, -62.90), -- Fbi
	--vector3(-792.22, -217.75, 36.07), -- Concess
	vector3(108.14, -1304.7, 27.76), -- Unicorn
	vector3(393.64, 279.28, 93.99), -- Galaxy
	vector3(-454.39, 283.07, 82.05), -- Comedy Show
	vector3(-213.56553649902,-1331.8109130859,22.142566680908), -- Mécano
	vector3(-443.64, -310.23, 33.91), -- Hopital
	vector3(922.14, 27.8, 70.83), -- Casino
}

ConfigClothes.Blip = {
	vector3(72.3, -1399.1, 28.4),
	vector3(-703.8, -152.3, 36.4),
	vector3(-167.9, -299.0, 38.7),
	vector3(428.7, -800.1, 28.5),
	vector3(-829.4, -1073.7, 10.3),
	vector3(-1447.8, -242.5, 48.8),
	vector3(11.6, 6514.2, 30.9),
    vector3(123.6, -219.4, 53.6),
	vector3(1696.3, 4829.3, 41.1),
	vector3(618.1, 2759.6, 41.1),
	vector3(1190.6, 2713.4, 37.2),
	vector3(-1193.4, -772.3, 16.3),
	vector3(-3172.5, 1048.1, 19.9),
	vector3(-1108.4, 2708.9, 18.1),
	vector3(4494.49, -4454.85, 3.36), -- Cayo Perico
}

ConfigClothes.Components = {
	{ label = 'T-Shirt 1',     name = 'tshirt_1',  sname = 'tshirt_2',  value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
	{ label = 'T-Shirt 2',     name = 'tshirt_2',  sname = nil,         value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof	= 'tshirt_1' },
	{ label = 'Torse 1',       name = 'torso_1',   sname = 'torso_2',   value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
	{ label = 'Torse 2',       name = 'torso_2',   sname = nil,         value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof	= 'torso_1' },
	{ label = 'Calques 1',     name = 'decals_1',  sname = 'decals_2',  value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
	{ label = 'Calques 2',     name = 'decals_2',  sname = nil,         value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof	= 'decals_1' },
	{ label = 'Bras',          name = 'arms',      sname = 'arms_2',    value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
	{ label = 'Bras 2',        name = 'arms_2',    sname = nil,         value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
	{ label = 'Jambes 1',      name = 'pants_1',   sname = 'pants_2',   value = 0, min = 0, zoomOffset = 0.8,  camOffset = -0.5 },
	{ label = 'Jambes 2',      name = 'pants_2',   sname = nil,         value = 0, min = 0, zoomOffset = 0.8,  camOffset = -0.5, textureof	= 'pants_1' },
	{ label = 'Chaussures 1',  name = 'shoes_1',   sname = 'shoes_2',   value = 0, min = 0, zoomOffset = 0.8,  camOffset = -0.8 },
	{ label = 'Chaussures 2',  name = 'shoes_2',   sname = nil,         value = 0, min = 0, zoomOffset = 0.8,  camOffset = -0.8, textureof	= 'shoes_1' },
}

-- -- -- -- -- -- -- -- --
-- -- -- Coiffeur -- -- --
-- -- -- -- -- -- -- -- --

ConfigBarber.Shops = {
    vector3(-814.308, -183.823, 36.568),
    vector3(136.826, -1708.373, 28.291),
    vector3(-1282.604, -1116.757, 5.99),
    vector3(1931.513, 3729.671, 31.844),
    vector3(1212.84, -473.921, 65.450),
    vector3(-32.885, -152.319, 56.076),
    vector3(-278.077, 6228.463, 30.695),
}

ConfigBarber.Blip = {
    vector3(-814.308, -183.823, 36.568),
    vector3(136.826, -1708.373, 28.291),
    vector3(-1282.604, -1116.757, 5.99),
    vector3(1931.513, 3729.671, 31.844),
    vector3(1212.84, -473.921, 65.450),
    vector3(-32.885, -152.319, 56.076),
    vector3(-278.077, 6228.463, 30.695),
}

ConfigBarber.Components = {
	{label = 'Cheveux 1',					name = 'hair_1',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.5,		camOffset = 0.65},
	{label = 'Cheveux 2',					name = 'hair_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.5,		camOffset = 0.65},
	{label = 'Couleur cheveux 1',			name = 'hair_color_1',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.5,		camOffset = 0.65},
	{label = 'Couleur cheveux 2',			name = 'hair_color_2',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.5,		camOffset = 0.65},
	{label = 'Taille sourcils',				name = 'eyebrows_2',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Type sourcils',				name = 'eyebrows_1',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur sourcils 1',			name = 'eyebrows_3',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur sourcils 2',			name = 'eyebrows_4',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Type maquillage',				name = 'makeup_1',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Epaisseur maquillage',		name = 'makeup_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur maquillage 1',		name = 'makeup_3',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur maquillage 2',		name = 'makeup_4',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Type lipstick',				name = 'lipstick_1',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Epaisseur lipstick',			name = 'lipstick_2',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur lipstick 1',			name = 'lipstick_3',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Couleur lipstick 2',			name = 'lipstick_4',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.35,		camOffset = 0.65},
	{label = 'Pillositée torse',			name = 'chest_1',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Opacité pillositée',			name = 'chest_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Couleur pillositée',			name = 'chest_3',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Type barbe',					name = 'beard_1',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = 'Taille barbe',				name = 'beard_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = 'Couleur barbe 1',				name = 'beard_3',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = 'Couleur barbe 2',				name = 'beard_4',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
}

-- -- -- -- -- -- -- --
-- Magasin de masque --
-- -- -- -- -- -- -- --

ConfigMask.Shops = {
    vector3(-1336.82, -1279.28, 3.86),
    vector3(-680.17, 5833.17, 17.47),
}

ConfigMask.Blip = {
    vector3(-1336.82, -1279.28, 3.86),
    vector3(-680.17, 5833.17, 17.47),
}

ConfigMask.Components = {
	{label = 'Masque 1',					name = 'mask_1',			sname = 'mask_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = 'Masque 2',					name = 'mask_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'mask_1'},
}

-- -- -- -- -- -- -- --
-- Magasin de montre --
-- -- -- -- -- -- -- --

ConfigWatches.Shops = {
    vector3(-626.96, -233.12, 37.05),
    vector3(-711.94, -157.52, 36.42),
    vector3(-1453.5, -239.56, 48.85),
    vector3(-1187.41, -769.76, 16.35),
    vector3(-828.77, -1077.26, 10.34),
    vector3(77.58, -1395.14, 28.4),
    vector3(425.39, -798.89, 28.51),
    vector3(-158.69, -301.89, 38.76),
    vector3(124.01, -213.0, 53.57),
}

ConfigWatches.Components = {
	{label = 'Montre 1',					name = 'watches_1',			sname = 'watches_2',			value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Montre 2',					name = 'watches_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'watches_1'},
}

-- -- -- -- -- -- -- -- --
-- Magasin de bracelets --
-- -- -- -- -- -- -- -- --

ConfigBracelets.Shops = {
    vector3(-624.94, -229.52,  37.05),
    vector3(-714.4, -153.48, 36.42),
    vector3(-1455.29, -237.01, 48.85),
    vector3(-1197.54,  -778.09, 16.35),
    vector3(-823.28, -1076.51, 10.34),
    vector3(75.31, -1400.33, 28.4),
    vector3(423.38, -804.02, 28.51),
    vector3(-158.78, -308.95, 38.76),
    vector3(126.38, -215.97, 53.57),
}

ConfigBracelets.Components = {
	{label = 'Bracelet 1',					name = 'bracelets_1',		sname = 'bracelets_2',			value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Bracelet 2',					name = 'bracelets_2',		sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bracelets_1'},
}

-- -- -- -- -- -- -- --
-- Magasin de chaînes -
-- -- -- -- -- -- -- --

ConfigChain.Shops = {
    vector3(-621.84, -233.98, 37.05),
    vector3(-712.78, -147.68, 36.42),
    vector3(-1452.4, -233.54, 48.85),
    vector3(-1200.07, -773.99, 16.35),
    vector3(-823.11, -1073.93, 10.34),
    vector3(75.33, -1393.35, 28.4),
    vector3(425.51, -805.61, 28.51),
    vector3(-165.77, -308.47, 38.76),
    vector3(125.55, -221.31, 53.57),
}

ConfigChain.Components = {
	{label = 'Chaine 1',					name = 'chain_1',			sname = 'chain_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Chaine 2',					name = 'chain_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'chain_1'},
}

-- -- -- -- -- -- -- --
-- Magasin de Sacs - --
-- -- -- -- -- -- -- --

ConfigBags.Shops = {
    vector3(451.8, -740.15, 26.35),
    vector3(-715.93, -145.88, 36.42),
    vector3(-1445.47, -229.56, 48.85),
    vector3(-1188.14, -772.81, 16.35),
    vector3(-827.87, -1070.52, 10.34),
    vector3(69.85, -1396.13, 28.4),
    vector3(431.12, -803.05, 28.51),
    vector3(-164.92, -312.12, 38.76),
    vector3(122.98, -229.82, 53.57),
    vector3(4492.002, -4461.47, 3.36), -- Cayo Perico
}

ConfigBags.Components = {
	{label = 'Sac',							name = 'bags_1',			sname = 'bags_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = 'Couleur sac',					name = 'bags_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bags_1'},
}

-- -- -- -- -- -- -- -- -- -- -- -- --
-- Magasin d'Accessoire d'oreilles- --
-- -- -- -- -- -- -- -- -- -- -- -- --

ConfigEars.Shops = {
    vector3(80.374,	-1389.493, 28.406),
    vector3(709.426, -153.829, 36.535),
    vector3(-163.093, -302.038, 38.853),
    vector3(420.787, -809.654, 28.611),
    vector3(-817.070, -1075.96, 10.448),
    vector3(-1451.300, -238.254, 48.929),
    vector3(-0.756,	6513.685, 30.997),
    vector3(123.431, -208.060, 53.677),
    vector3(1687.318, 4827.685, 41.183),
    vector3(622.806, 2749.221, 41.208),
    vector3(1200.085, 2705.428, 37.342),
    vector3(-1199.959, -782.534, 16.452),
    vector3(-3171.867, 1059.632, 19.983),
    vector3(-1095.670, 2709.245, 18.227),
    vector3(4500.53, -4457.24, 3.36), -- Coya Perico
}

ConfigEars.Components = {
	{ label = 'Accessoire oreilles', name = 'eans_1', sname = 'eans_2', value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.65 },
	{ label = 'Couleur accessoire',  name = 'eans_2', sname = nil,      value = 0,  min = 0,  zoomOffset = 0.4, camOffset = 0.65, textureof = 'eans_1' },
}

-- -- -- -- -- -- -- --
-- Magasin de casque --
-- -- -- -- -- -- -- --

ConfigHelmet.Shops = {
    vector3(81.576, -1400.602, 28.406),
    vector3(-705.845, -159.015, 36.535),
    vector3(-161.349, -295.774, 38.853),
    vector3(419.319, -800.647, 28.611),
    vector3(-824.362, -1081.741, 10.448),
    vector3(-1454.888, -242.911, 48.931),
    vector3(4.770, 6520.935, 30.997),
    vector3(121.071, -223.266, 53.377),
    vector3(1689.648, 4818.805, 41.183),
    vector3(613.971, 2749.978, 41.208),
    vector3(1189.513, 2703.947, 37.342),
    vector3(-1204.025, -774.439, 16.452),
    vector3(-3164.280, 1054.705, 19.983),
    vector3(-1103.125, 2700.599, 18.227),
    vector3(4499.29, -4454.2, 3.36), -- Cayo Perico
}

ConfigHelmet.Components = {
	{label = 'Casque 1',					name = 'helmet_1',			sname = 'helmet_2',			value = -1,		min = -1,	zoomOffset = 0.4,		camOffset = 0.65,	componentId	= 0 },
	{label = 'Casque 2',					name = 'helmet_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65,	textureof	= 'helmet_1'},
}

-- -- -- -- -- -- -- -- --
-- Magasin de Lunettes- --
-- -- -- -- -- -- -- -- --

ConfigGlasses.Shops = {
    vector3(75.287, -1391.131, 28.406),
    vector3(-713.102, -160.116, 36.535),
    vector3(-156.171, -300.547, 38.853),
    vector3(425.478, -807.866, 28.611),
    vector3(-820.853, -1072.940, 10.448),
    vector3(-1458.052, -236.783, 48.918),
    vector3(3.587, 6511.585, 30.997),
    vector3(131.335, -212.336, 53.677),
    vector3(1694.936, 4820.837, 41.183),
    vector3(613.972, 2768.814, 41.208),
    vector3(1198.678, 2711.011, 37.342),
    vector3(-1188.227, -764.594, 16.452),
    vector3(-3173.192, 1038.228, 19.983),
    vector3(-1100.494, 2712.481, 18.227),
    vector3(4497.84, -4451.62, 3.36), -- Cayo Perico
}

ConfigGlasses.Components = {
	{label = 'Lunettes 1',				name = 'glasses_1',			sname = 'glasses_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = 'Lunettes 2',				name = 'glasses_2',			sname = nil,			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65,	textureof	= 'glasses_1'},
}
