local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)


local to_bdabds = {
    x=136, y=25, w=22, h=65,
    go_to = 11,
    no_sound = true,
    footstep = true
}

local to_animest = {
    x=122, y=33, w=10, h=49,
    go_to = 12,
    no_sound = true,
    footstep = true
}

local to_studio = {
    x=114, y=34, w=8, h=39,
    go_to = 22,
    no_sound = true,
    footstep = true
}

local to_tektn = {
    x=108, y=36, w=8, h=27,
    go_to = 13,
    no_sound = true,
    footstep = true
}

local to_bar = {
    x=93, y=32, w=15, h=23,
    go_to = 14,
    no_sound = true,
    footstep = true
}

local feuille_dechiree = {
    x=24, y=71, w=18, h=25,
    text = "C'est une affiche déchirée de TEK'TN. On y déchiffre les chiffres \"78\".",
    text_duration = 2
}

local to_main_room1 = {
    go_to = 5,
    no_sound = true,
    footstep = true
}

local affiche_haut = {
    x=18, y=2, w=19, h=30,
    text = "\"Soirée H4KITAINExTGDxALGO: à ne pas manquer !\"",
    text_duration = 2
}

local affiche_bas = {
    x=20, y=38, w=20, h=29,
    text = "\"After partiels discoloc !\"",
    text_duration = 2
}

local main_room1 = {to_bdabds, to_main_room1, to_animest, to_bar, to_tektn, feuille_dechiree, affiche_bas, affiche_haut, to_studio}
return main_room1