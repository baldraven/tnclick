
local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_chambre = {
	go_to = 8,
	no_sound = true
}

local c0 = {
	x=116, y=98, w=9, h=11,
	code = 0
}
local c1 = {
	x=104, y=84, w=9, h=11,
	code = 1
}
local c2 = {
	x=116, y=84, w=9, h=11,
	code = 2
}
local c3 = {
	x=128, y=84, w=9, h=11,
	code = 3
}
local c4 = {
	x=104, y=70, w=9, h=11,
	code = 4
}
local c5 = {
	x=116, y=70, w=9, h=11,
	code = 5
}
local c6 = {
	x=128, y=70, w=9, h=11,
	code = 6
}
local c7 = {
	x=104, y=56, w=9, h=11,
	code = 7
}
local c8 = {
	x=116, y=56, w=9, h=11,
	code = 8
}
local c9 = {
	x=128, y=56, w=9, h=11,
	code = 9
}

local enter = {
	x=135, y=44, w=9, h=9,
	enter = true
}

local ctf = {
	x=130+32, y=29+16, w=15, h=24,
	dialog = {"TGD{Il0v3b3@rsrlYn0tKid2iNG/?}"},
	dialog_repeat = true
}

local wallpaper = {
	x=32, y=16,
	img = love.graphics.newImage("assets/pc/wallpaper.png")
}

local banane = {
	x=130+32, y=29+16, w=15, h=24,
	dialog = {"TGD{Il0v3kIlliNgmyd4dy/?}"},
	dialog_repeat = true
}


local desenchinte = {
	x=55+32, y=25+16, w=27, h=34,
	change_layer = 3
}

local site_inte = {
	x=32, y=16,
	img = love.graphics.newImage("assets/pc/inte.png")
}

local cross = {
	x=193, y=16, w=15, h=16,
	change_layer = 2
}

local pomme = {
	x=130+32, y=29+16, w=15, h=24,
	dialog = {"TGD{lU@i$j0y,B3@r$rl0v3}"},
	dialog_repeat = true
}

local pc_data = {
	{to_chambre, c1,c2,c3,c4,c5,c6,c7,c8,c9,c0, enter},
	{wallpaper, desenchinte, pomme},
	{site_inte, cross}
}

return pc_data