local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_chambre = {
	go_to = 8,
	no_sound = true
}

local digital_bg = {
	x=32, y=16,
	img = love.graphics.newImage("assets/pc/digital_bg.png")
}

local digital_button = {
	x=116, y=56, w=9, h=11,
	change_layer = 1
}

local pc = {to_chambre, digital_bg, digital_button}

return pc