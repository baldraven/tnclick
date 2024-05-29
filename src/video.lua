local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local back = {
	x=9, y=108, w=38, h=12,
	go_to = 2,
	no_sound = true
}

local fullscreen = {
	x=9, y=60, w=59, h=27,
	toggle_fulscreen = true
}

local video = {back, fullscreen}

return video