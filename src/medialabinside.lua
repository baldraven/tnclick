local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_medialabdoor = {
    go_to = 19
}

local proj = {
    x=103, y=27,
    img = love.graphics.newImage("assets/medialabinside/proj.png"),
	thumbnail = love.graphics.newImage("assets/tektn_inside/proj_mod_tn.png"),
    inventory_text = "Un vidéoprojecteur. Il est facilement bricolable.",
    id = "proj"
}

local proj_mod = {
    x=103, y=27,
    img = love.graphics.newImage("assets/medialabinside/proj.png"),
    text = "Le projecteur défaillant est installé.",
    text_duration = 2
}

local setup_proj = {
    --x=96, y=13, w=45, h=23,
    x=102, y=14, w=33, h=20,
    text_duration = 2,
    interact_with = {"proj", "proj_mod"},
    interact_new_item = {proj, proj_mod},
    interact_inv_rem = {"true", "true"},
    interact_text = "J'ai réinstallé le projecteur.",
    trigger = {nil, 1}
}

local porte = {
    x=198, y=55, w=24, h=42,
    text = "C'est fermé.",
    text_duration = 2
}

local main_room1 = {to_medialabdoor, proj, setup_proj, porte}
return main_room1