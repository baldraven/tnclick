local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local bda = {
    x=46, y=36, w=45, h=100,
    text = "Des sons exotiques sortent de la porte.",
    text_duration = 2
}

local bds = {
    x=141, y=34, w=45, h=101,
    text = "C'est vide.",
    text_duration = 2
}

local to_animest = {
    x=0, y=35, w=29, h=135,
    go_to = 12,
    no_sound = true,
    footstep = true
}
local to_couloir = {
    go_to = 10,
    no_sound = true,
    footstep = true
}

local to_couloir2 = {
    x=214, y=0, w=26, h=135,
    go_to = 10,
    no_sound = true,
    footstep = true
}

local digicode_gauche = {
    x=29, y=81, w=8, h=12,
    text = "C'est un digicode. Je n'en ai pas besoin pour l'instant.",
    text_duration = 2
}

local digicode_droite = {
    x=193, y=81, w=8, h=12,
    text = "C'est un digicode. Je n'en ai pas besoin pour l'instant.",
    text_duration = 2
}


local main_room1 = {bda, bds, to_couloir, to_animest, to_couloir, to_couloir2, digicode_gauche, digicode_droite}
return main_room1