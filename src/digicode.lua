local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_previous = {
    x=85, y=121, w=79, h=20,
    go_back = true
}

local to_festor = {
	x=130, y=29, w=15, h=24,
	dialog = {"TGD{12@3uu8-plUs2}"},
	dialog_repeat = true
}

local c0 = {
	x=116, y=98, w=9, h=11,
	digicode_input = 0
}
local c1 = {
	x=104, y=84, w=9, h=11,
	digicode_input = 1
}
local c2 = {
	x=116, y=84, w=9, h=11,
	digicode_input = 2
}
local c3 = {
	x=128, y=84, w=9, h=11,
	digicode_input = 3
}
local c4 = {
	x=104, y=70, w=9, h=11,
	digicode_input = 4
}
local c5 = {
	x=116, y=70, w=9, h=11,
	digicode_input = 5
}
local c6 = {
	x=128, y=70, w=9, h=11,
	digicode_input = 6
}
local c7 = {
	x=104, y=56, w=9, h=11,
	digicode_input = 7
}
local c8 = {
	x=116, y=56, w=9, h=11,
	digicode_input = 8
}
local c9 = {
	x=128, y=56, w=9, h=11,
	digicode_input = 9
}

local enter = {
	x=128, y=98, w=9, h=9,
	digicode_enter = "7878"
}

local main_room1 = {to_previous, c1,c2,c3,c4,c5,c6,c7,c8,c9,c0, enter}
return main_room1