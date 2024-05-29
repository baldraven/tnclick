local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_portebouthier = {
    go_to = 17
}

local papercode = {
	x=155, y=74,
	img = love.graphics.newImage("assets/bureaubouthier/papercode.png"),
	thumbnail = love.graphics.newImage("assets/bureaubouthier/papercode_tn.png"),
	inventory_text = "Je peux lire un code dessus: \"1412\".",
	id = "papercode"
}

local draweropen = {
	x=147, y=73,
	img = love.graphics.newImage("assets/bureaubouthier/draweropen.png")
}

local drawer = {
	x=147, y=73, w=31, h=42,
	interact_with = {"lockpick"},
	interact_new_item = {papercode},
	replace_item = {draweropen},
	interact_text = "La serrure a été dévérouillée.",
	text = "C'est verouillé.",
	text_duration = 2
}

local examine_medialabfeu = {
	x=88, y=43, w=71, h=56,
	text = "Je ne devrais pas revenir sur la scène du crime.",
	text_duration = 2
}

local bouthier_feu = {
	x=0, y=0,
	img = love.graphics.newImage("assets/bureaubouthier/bouthier.png"),
	condition = "trig2",
	condition_toadd = examine_medialabfeu,
	dialog = {
		"Boothier: Rtelheu a encore mis le feu au projecteur !?",
		"Boothier: J'aurais du voir ça venir..."
	}
}

local bouthier = {
	x=0, y=0, w=240, h=135,
	dialog = {
		"Boothier: Je peux t'aider ?",
		"Boothier: Si tu recherches par hasard les sujets de partiels, je t'invite\n à faire \"cd ..\"."
	},
	dialog_repeat = true
}

local bureaubouthier = {to_portebouthier, bouthier_feu, bouthier, drawer}
return bureaubouthier