local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_tektn = {
    go_to = 13
}

local lockpick = {
	x=30, y=37,
	img = love.graphics.newImage("assets/tektn_inside/lockpick.png"),
	thumbnail = love.graphics.newImage("assets/tektn_inside/lockpick_tn.png"),
	inventory_text = "Cela peut me permettre de crocheter des serrures simples",
	id = "lockpick"
}

local proj_mod = {
	x=158, y=79,
	img = love.graphics.newImage("assets/tektn_inside/proj_mod.png"),
	thumbnail = love.graphics.newImage("assets/tektn_inside/proj_mod_tn.png"),
	inventory_text = "Un projecteur avec une alimentation défectueuse.",
	id = "proj_mod",
}

local alim = {
	x=162, y=80,
	img = love.graphics.newImage("assets/tektn_inside/alim.png"),
	interact_with = {"proj"},
	replace_item = {proj_mod},
	interact_inv_rem = {"true"},
	text = "C'est une alimentation défaillante. Elle risque de prendre feu à la moindre utilisation.",
	interact_text = {"J'ai installé l'alimentation déféctueuse dans le projecteur."},
	text_duration = 2
}

local pince = {
	x=192, y=79, w=9, h=9,
	text = "Une pince.",
	text_duration = 2
}

local tournevis = {
	x=135, y=80, w=6, h=8,
	text = "Un tournevis.",
	text_duration = 2
}


local main_room1 = {to_tektn, lockpick, alim, tournevis, pince}
return main_room1