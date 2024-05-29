local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_downstaris = {
	go_to = 6,
	no_sound = true,
    footstep = true
}

local to_portebouthier = {
	x=182, y=42, w=10, h=29,
	go_to = 17,
	no_sound = true,
    footstep = true
}

local examine_ailenord = {
	x=62, y=34, w=20, h=05,
    text = "\"Aile nord\"",
    text_duration = 2
}

local examine_directionetude = {
	x=35, y=27, w=10, h=09,
    text = "\"Direction des etudes\"",
    text_duration = 2
}

local examine_serviceinformatique = {
	x=184, y=33, w=6, h=08,
    text = "\"Service informatique\"",
    text_duration = 2
}

local to_directionetude = {
	x=31, y=38, w=17, h=31,
	go_to = 8,
}

local affiches = {
	x=8, y=35, w=16, h=24,
	text = "Il y a diverses affiches administratives.",
	text_duration = 2
}

local ascenseur = {
	x=100, y=38, w=32, h=39,
	text = "C'est un ascenseur interdit.",
	text_duration = 2
}

local portegauche = {
	x=55, y=41, w=28, h=36,
	text = "Je n'ai rien à faire de l'autre côté.",
	text_duration = 2
}

local portedroite = {
	x=150, y=41, w=28, h=35,
	text = "Je n'ai rien à faire de l'autre côté.",
	text_duration = 2
}

local tgd_code = {
	x=130, y=29, w=15, h=24,
	ctf = {"TGD{12@3uu8-plUs2}"},

}

local fiche = {
    x=192, y=71,
    img = love.graphics.newImage("assets/dualdoors_upstairs/fiche.png"),
	thumbnail = love.graphics.newImage("assets/tns_inside/fiche_tn.png"),
    inventory_text = "Une feuille technique détaillant une entreprise.",
    id = "fiche"
}

local main_room1 = {
    to_downstaris, examine_ailenord, examine_directionetude,
    examine_serviceinformatique, to_portebouthier, to_directionetude,
	ascenseur, affiches, portegauche, portedroite, fiche, tgd_code
}


return main_room1