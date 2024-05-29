local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local porte = {
    x=97, y=35, w=45, h=100,
    text = "After effect est encore en train de démarrer.",
    text_duration = 2
}

local to_animest = {
    x=214, y=0, w=26, h=135,
    go_to = 12,
    no_sound = true,
    footstep = true
}

local to_tektn = {
    x=0, y=35, w=29, h=135,
    go_to = 13,
    no_sound = true,
    footstep = true
}

local to_couloir = {
    go_to = 10,
    no_sound = true,
    footstep = true
}

local digicode_gauche = {
    x=82, y=82, w=8, h=12,
    text = "C'est un digicode. Je n'en ai pas besoin pour l'instant.",
    text_duration = 2
}


local main_room1 = {porte, to_tektn, to_couloir, digicode_gauche, to_animest}
return main_room1