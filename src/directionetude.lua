local love = require ("love")
love.graphics.setDefaultFilter("nearest", "nearest", 0)

local to_pc = {
    x=78, y=78, w=25, h=15,
    go_to = 9,
    no_sound = true
}

local to_dualdoors_upstairs = {
    go_to = 7
}

local main_room1 = {to_pc, to_dualdoors_upstairs}
return main_room1