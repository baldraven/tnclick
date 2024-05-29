local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_anmimest = {
    go_to = 12
}

local tanuki = {
    x=192, y=73,
    img = love.graphics.newImage("assets/animest_inside/tanuki.png"),
	thumbnail = love.graphics.newImage("assets/animest_inside/tanuki_tn.png"),
    inventory_text = "Un tanuki en peluche qui attendrirait n'importe qui.",
    id = "tanuki"
}

local fiche = {
    x=194, y=110,
    img = love.graphics.newImage("assets/tns_inside/fiche.png"),
    text = "Le papier pour vendre son âme à l'association.",
    text_duration = 2
}


local smash = {
    x=142, y=39, w=28, h=50,
    text = "Un écran pour jouer à Smash.",
    text_duration = 2
}

local tableau = {
    x=0, y=0, w=26, h=83,
    text = "Un tableau blanc où est noté diverses informations sur l'organisation de l'association\nainsi que sur les combos Smash.";
    text_duration = 2
}

local main_room1 = {to_anmimest, tanuki, fiche, smash, tableau}
return main_room1