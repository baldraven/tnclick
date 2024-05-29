local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local start = {
	x=9, y=60, w=49, h=12,
	go_to = 5,
	no_sound = true
}

local options = {
	x=9, y=84, w=65, h=12,
	go_to = 2,
	no_sound = true
}

local quit = {
	x=9, y=108, w=38, h=12,
	quit = true
}


local menu = {start, options, quit}

return menu