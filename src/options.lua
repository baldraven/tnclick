local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local back = {
	x=9, y=108, w=38, h=12,
	go_to = 1,
	no_sound = true
}

local to_video = {
	x=9, y=84, w=65, h=12,
	go_to = 3,
	no_sound = true
}

local to_audio = {
	x=9, y=60, w=49, h=12,
	go_to = 4,
	no_sound = true
}

local options = {back, to_audio, to_video}

return options