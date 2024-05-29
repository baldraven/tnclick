local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local porte = {
    x=46, y=36, w=45, h=100,
    go_to = 21
}

local tableau = {
    x=132, y=57, w=82, h=40,
    text = "La convention Anim'est arrive très bientôt.",
    text_duration = 2
}

local to_bdabds = {
    x=214, y=0, w=26, h=135,
    go_to = 11,
    no_sound = true,
    footstep = true
}

local to_tektn = {
    x=0, y=35, w=29, h=135,
    go_to = 22,
    no_sound = true,
    footstep = true
}

local to_couloir = {
    go_to = 10,
    no_sound = true,
    footstep = true
}

local digicode_gauche = {
    x=29, y=81, w=8, h=12,
    text = "C'est déjà ouvert.",
    text_duration = 2
}


local main_room1 = {porte, to_bdabds, to_tektn, tableau, to_couloir, digicode_gauche}
return main_room1