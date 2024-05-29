local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local go_back = {
    go_to = 5,
    no_sound = true
}

local pass = {
    inventory_text = "Le pass de Laplace.",
	thumbnail = love.graphics.newImage("assets/medialabdoor/pass_tn.png"),
	id = "pass"
}

local dial_chill = {
    x=91, y=25,
	img = love.graphics.newImage("assets/medialabdoor/tomzak.png"),
    dialog = {
        "Laplace: Il est vraiment mignon...",
        "Laplace: Tu peux prendre ma carte si tu as vraiment une affaire urgente\nau Medialab.",
        "Laplace: Mais n'oublie pas de me la ramener."
    },
    dialog_inventoryadd = pass,
}

local tomzak = {
    x=91, y=25,
	img = love.graphics.newImage("assets/medialabdoor/tomzak.png"),
    interact_text = {"Le tanuki a l'air de l'avoir apaisé."},
    text_duration = 2,
    interact_with = {"tanuki"},
    interact_remove = {3},
    replace_item = {dial_chill}
}

local dial_harsh = {
    x=91, y=25, w=64, h=110,
    dialog = {
        "LAPLACE: CE QUE TU M'AS FAIT AU DERNIER TD",
        "LAPLACE: C'ETAIT DE LA MERDE !\nTU ES NUL.",
        "LAPLACE: HEIN ? TU AS OUBLIE TON PASS ?",
        "LAPLACE: EH BIEN VAS REVISER LE PARTIEL AU LIEU\nDE TRAINER AU MEDIALAB."
    },
    dialog_font = love.graphics.newFont("assets/font_oxygene.ttf", 3.5*4),
    dialog_repeat = true
}

local to_medialabinside = {
    x=88, y=43, w=71, h=56,
    go_to = 20
}

local badge = {
    x=164, y=68, w=10, h=13,
    interact_with = {"pass"},
	replace_item = {to_medialabinside},
    text = "Il me faut une carte.",
    interact_text = {"La porte s'est ouverte."},
    text_duration = 2,
}

local to_downstaris = {
    x=0, y=22, w=33, h=106,
    go_to = 6,
    no_sound = true
}


local main_room1 = {go_back, tomzak, dial_harsh, badge, to_downstaris}


return main_room1