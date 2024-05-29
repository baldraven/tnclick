local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local back = {
	x=9, y=108, w=38, h=12,
	go_to = 2,
	no_sound = true
}

local volume = {
	x=19, y=84, w=40, h=3,
	volume_slide = true
}

local audio = {back, volume}


return audio