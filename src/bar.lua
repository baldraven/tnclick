local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)
local porte = {
    x=59, y=41, w=125, h=94,
    text = "Le bar c'était mieux avant.",
    text_duration = 2
}

local to_couloir = {
    go_to = 10,
    no_sound = true,
    footstep = true
}

local to_tektn= {
    x=197, y=0, w=47, h=135,
    go_to = 13,
    no_sound = true,
    footstep = true
}

local main_room1 = {to_couloir, to_tektn, porte}
return main_room1