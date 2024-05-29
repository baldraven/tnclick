local love = require("love")


function love.conf(t)
    t.window.width = 960
    t.window.height = 540
    t.window.fullscreen = false
    t.modules.joystick = false
    t.modules.physics = false
    t.window.title = "TNClick"
    t.window.icon = "assets/icon.png"
    t.console = false
end