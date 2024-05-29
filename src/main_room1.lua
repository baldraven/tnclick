local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local go_downstairs = {
	x=0, y=30, w=54, h=51,
	go_to = 6,
	no_sound = true,
    footstep = true
}

local to_couloir = {
	x=190, y=45, w=47, h=33,
	go_to = 10,
	no_sound = true,
    footstep = true
}
local dialog_2 = {
	x=0, y=0, w=240, h=135,
	dialog = {
		"Moi: Mince...",
        "Moi: J'aurais pas du passer la nuit à Narnia...",
        "Moi: Je dois trouver une solution."
	},
	set_bgm = "upper"
}

local dialog_1 = {
	x=0, y=0,
	img = love.graphics.newImage("assets/main_room1/festor.png"),
	dialog = {
        "Sir Foster: C'est la kiffance!",
        "Sir Foster: La semaine des partiels est enfin arrivé.",
        "Sir Foster: J'espere que vous avez bien revisé,\nsi vous ne souhaitez pas redoubler."
	},
	dialog_nex = dialog_2
}

local ecran = {
	x=163, y=39, w=19, h=38,
	text = "\"Inspire ton futur dig... numérique.\"",
	text_duration = 2
}

local medialab = {
	x=130, y=41, w=21, h=29,
	go_to = 19,
	no_sound = true
}

------------------------------------------------------------

local heurtel_dial1 = {
	x=67, y=56, w=8, h=30,
	dialog = {
		"Rtelheu: As-tu rattrapé le CM dans lequel tu dormais ?",
		"Rtelheu: ...",
		"Rtelheu: Tu n'aura aucune chance au partiel si tu n'as pas les bases de management."
	},
	dialog_repeat = true
	--condition = "white_room"
}

--local heurtel_cache = {
--	x=67, y=56, w=8, h=30,
--	img = love.graphics.newImage("assets/main_room1/heurtel_cache.png"),
--	no_overlap = true
--}

local heurtel_drawed = {
	x=184, y=62,
	img = love.graphics.newImage("assets/medialabinside/heurtel_grande.png"),
	text = "Elle est agitée.",
	text_duration = 2
}

local burnt_lecture = {
	x=0, y=0,
	img = love.graphics.newImage("assets/medialabinside/heurtel_grande_fs.png"),
	dialog = {
		"Rtelheu: Kyaaa!",
		"Rtelheu: Le projecteur s'est mis a fumer quand je l'ai allumé !",
		"Rtelheu: Vas vite chercher M. Boothier !"
	},
	trigger_noninteract = 2,
}

local burnt_proj = {
    x=102, y=14,
    img = love.graphics.newImage("assets/medialabinside/burnt_proj.png"),
	text = "Il y a de la fumée qui sort.",
	text_duration = 2
}

local lecture_interlude = {
	x=0, y=0, w=240, h=135,
	img = love.graphics.newImage("assets/medialabinside/heurtel_grande_fs.png"),
	dialog = {
		"Rtelheu: ...et c'est pourquoi il est intéressant de cibler les jeunes consommateurs.",
		"Rtelheu: Tu devrais pouvoir t'en sortir avec ça.",
	},
	
}

local heurtel_interlude = {
	x=67, y=56, w=8, h=30,
	img = love.graphics.newImage("assets/main_room1/heurtel.png"),
	dialog = {
		"Rtelheu: Quoi ? Tu veux encore un cours ?",
		"Rtelheu: Bon, si tu me ramène un pain au chocolat la prochaine fois,\non peut s'arranger."
	},
	room_condition = "projo",
	room = {
		{lecture_interlude,},
		{burnt_proj, burnt_lecture, heurtel_drawed}
	},
	whichroom = 20,
	dialog_move = 20,
	dialog_repeat = true,
	debug = true
}

local lecture = {
	--x=0, y=0, w=240, h=135,
	--img = love.graphics.newImage("assets/medialabinside/heurtel_fullscreen.png"),
	x=0, y=0,
	img = love.graphics.newImage("assets/medialabinside/heurtel_grande_fs.png"),
	dialog = {
		"Rtelheu: ...et c'est pourquoi il est intéressant de cibler les jeunes consommateurs.",
		"Rtelheu: Tu devrais pouvoir t'en sortir avec ça.",
	},
	room = {{heurtel_interlude}},
	whichroom = 5
	--condition = "white_room"
}

local heurtel_prelude = {
	x=67, y=56, w=8, h=30,
	img = love.graphics.newImage("assets/main_room1/heurtel.png"),
	dialog = {
		"Rtelheu: Tu n'es pas capable d'analyser ce document ?",
		"Rtelheu: Bon... la seule solution est que je te fasse un cours en urgence.",
		"Rtelheu: Rejoins-moi au Medialab, il devrait y avoir un projecteur là-bas."
	},
	room_condition = "projo",
	room = {
		{lecture},
		{burnt_proj, burnt_lecture}
	},
	whichroom = 20
}

local heurtel = {
	x=67, y=56, w=8, h=30,
	img = love.graphics.newImage("assets/main_room1/heurtel.png"),
	interact_with = {"fiche"},
	replace_item = {heurtel_prelude},
	interact_text = {"Elle examine le document d'un air inquiet."},
	text_duration = 2,
	interact_remove = {7},
}

local main_room1 = {dialog_1, go_downstairs, ecran, to_couloir, medialab, heurtel, heurtel_dial1}
return main_room1