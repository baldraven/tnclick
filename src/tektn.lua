local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local tektn = {
    x=46, y=36, w=45, h=100,
    text = "C'est verouillé.",
    text_duration = 2
}

local tns = {
    x=141, y=34, w=45, h=101,
    text = "Je n'ai pas encore d'argent à blanchir.",
    text_duration = 2
}

local to_animest = {
    x=214, y=0, w=26, h=135,
    go_to = 22,
    no_sound = true,
    footstep = true
}

local to_digicode = {
    x=29, y=81, w=8, h=12,
    go_to = 15,
    no_sound = true,
    footstep = true
}

local digicode_droite = {
    x=141, y=81, w=8, h=12,
    text = "C'est un digicode. Je n'en ai pas besoin pour l'instant.",
    text_duration = 2
}

local to_bar = {
    x=0, y=35, w=29, h=135,
    go_to = 14,
    no_sound = true,
    footstep = true
}

local to_couloir = {
    go_to = 10,
    no_sound = true,
    footstep = true
}
 
local main_room1 = {
    tektn, --tektn first, gets accessed with digicode
    tns, to_animest, to_bar, to_couloir, to_digicode, digicode_droite
}
return main_room1