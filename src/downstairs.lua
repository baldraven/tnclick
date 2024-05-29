local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_dualdoors_upstairs = {
	x=31, y=30, w=97, h=84,
	go_to = 7,
	no_sound = true,
    footstep = true
}

local extincteur = {
	x=219, y=63, w=5, h=09,
    text = "Un extincteur.",
    text_duration = 2
}

local halfpage = {
	x=164, y=85,
	text = "Il y avait un morceau de papier dans le sable.",
	text_duration = 2,
	img = love.graphics.newImage("assets/main_room1/halfpage.png"),
	thumbnail = love.graphics.newImage("assets/main_room1/halfpage_tn.png"),
	inventory_text = "Il y a écrit \"78\", mais il manque un bout.",
	id = "halfpage"
}

local to_main_room1= {
	go_to = 5,
	no_sound = true,
    footstep = true
}

local to_medialabdoor= {
	x=225, y=30, w=15, h=92,
	go_to = 19,
	no_sound = true,
    footstep = true
}

local main_room1 = {to_dualdoors_upstairs, to_main_room1, extincteur, halfpage, to_medialabdoor}
return main_room1