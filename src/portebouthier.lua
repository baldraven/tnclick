local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_dualdoors_upstairs = {
    x=85, y=122, w=78, h=20,
    go_to = 7,
    no_sound = true,
    footstep = true
}

local to_bureaubouthier = {
    x=108, y=45, w=25, h=57,
    go_to = 18
}

local ddr = {
    x=110, y=104, w=22, h=18,
    text = "Ce sont des stickers DDR ?",
    text_duration = 2
}

local sign = {
    x=134, y=64, w=7, h=6,
    text = "\"Cristophe Boothier\"",
    text_duration = 2
}

local main_room1 = {to_dualdoors_upstairs, to_bureaubouthier, sign, ddr}
return main_room1