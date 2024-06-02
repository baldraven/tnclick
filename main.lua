local love =    require("love")
local Timer =   require("lib.timer")

--room items&sensors
local menu              = require("src.menu")
local options           = require("src.options")
local video             = require("src.video")
local audio             = require("src.audio")
local main_room1        = require("src.main_room1")
local downstairs        = require("src.downstairs")
local dualdoors_upstairs= require("src.dualdoors_upstairs")
local directionetude    = require("src.directionetude")
local pc                = require("src.pc")
local pc_data =           require("src.pc_data")
local couloir =           require("src.couloir")
local bdabds =            require("src.bdabds")
local animest =        require("src.animest")
local tektn =        require("src.tektn")
local bar =        require("src.bar")
local digicode =        require("src.digicode")
local tektn_inside =        require("src.tektn_inside")
local portebouthier =        require("src.portebouthier")
local bureaubouthier =        require("src.bureaubouthier")
local medialabdoor =        require("src.medialabdoor")
local medialabinside =        require("src.medialabinside")
local animest_inside =        require("src.animest_inside")
local tns_inside =        require("src.studio")
local entities = {
    menu, options, video, audio, main_room1, downstairs, dualdoors_upstairs, directionetude,
    pc, couloir, bdabds, animest, tektn, bar, digicode, tektn_inside,
    portebouthier, bureaubouthier, medialabdoor, medialabinside, animest_inside,
    tns_inside
} --ordrer relevant

--room BG images
love.graphics.setDefaultFilter("nearest", "nearest", 0)
local MENU_BG =      love.graphics.newImage("assets/menu/bg.png")
local OPTIONS_BG =   love.graphics.newImage("assets/options/bg.png")
local VIDEO_BG =   love.graphics.newImage("assets/video/bg.png")
local AUDIO_BG =   love.graphics.newImage("assets/audio/bg.png")
local MAIN_ROOM1_BG =   love.graphics.newImage("/assets/main_room1/bg.png")
local DOWNSTAIRS_BG =   love.graphics.newImage("/assets/downstairs/bg.png")
local DUALDOORS_UPSTAIRS_BG =   love.graphics.newImage("/assets/dualdoors_upstairs/bg.png")
local DIRECTIONETUDE_BG     =   love.graphics.newImage("/assets/directionetude/bg.png")
local PC_BG =        love.graphics.newImage("assets/pc/bg.png")
local COULOIR_BG =        love.graphics.newImage("assets/couloir/bg.png")
local BDABDS_BG =        love.graphics.newImage("assets/bdabds/bg.png")
local ANIMEST_BG =        love.graphics.newImage("assets/animest/bg.png")
local TEKTN_BG =        love.graphics.newImage("assets/tektn/bg.png")
local BAR_BG =        love.graphics.newImage("assets/bar/bg.png")
local DIGICODE_BG =        love.graphics.newImage("assets/digicode/bg.png")
local TEKTN_INSIDE_BG =        love.graphics.newImage("assets/tektn_inside/bg.png")
local PORTEBOUTHIER_BG =        love.graphics.newImage("assets/portebouthier/bg.png")
local BUREAUBOUTHIER_BG =        love.graphics.newImage("assets/bureaubouthier/bg.png")
local MEDIALABDOOR_BG =        love.graphics.newImage("assets/medialabdoor/bg.png")
local MEDIALABINSIDE_BG =        love.graphics.newImage("assets/medialabinside/bg.png")
local ANIMEST_INSIDE_BG =        love.graphics.newImage("assets/animest_inside/bg.png")
local TNS_INSIDE_BG =        love.graphics.newImage("assets/studio/bg.png")
local ROOM_BG = {
    MENU_BG, OPTIONS_BG, VIDEO_BG, AUDIO_BG, MAIN_ROOM1_BG, DOWNSTAIRS_BG, DUALDOORS_UPSTAIRS_BG, DIRECTIONETUDE_BG,
    PC_BG, COULOIR_BG, BDABDS_BG, ANIMEST_BG, TEKTN_BG, BAR_BG, DIGICODE_BG, TEKTN_INSIDE_BG,
    PORTEBOUTHIER_BG, BUREAUBOUTHIER_BG, MEDIALABDOOR_BG, MEDIALABINSIDE_BG, ANIMEST_INSIDE_BG, TNS_INSIDE_BG, TNS_INSIDE_BG
}

--screen scalling from 240*135
local S = 4

--inventory
local INVENTORY = love.graphics.newImage("/assets/inventory.png")
local INV_X = 3
local INV_Y = 3
local INV_H = INVENTORY:getHeight()
local INV_PADDING_Y = 2
local INV_PADDING_X = 2
local TN_SIZE = 15
local INV_X_BETWEEN_ITEMS = INV_PADDING_X + TN_SIZE
local TOPMARGIN = INV_Y + INV_PADDING_Y
local item_selected
local inventory
local first_pickup = false

--cursors
local CURSOR = love.mouse.newCursor("/assets/cursor.png", 15, 15)  --15 is half of cursor size, sets origin
local ITEM_CURSOR = love.mouse.newCursor("/assets/item_cursor.png", 15, 15)
local gx,gy = 0,0
local do_clear_cursor

--icon (notworking)
local ico = love.image.newImageData("assets/icon.png")
local success = love.window.setIcon(ico)

--audio
love.audio.setVolume(1) --mute game with 0 (for testing purposes)
local volume = 1
local audio_pause = false
local jukebox = love.audio.newSource("assets/music/step_cloth.mp3", "stream") 
local jk_current_index = 0
local sound_door = love.audio.newSource("assets/music/door.wav", "static")
sound_door:setVolume(0.7)
local sound_pickup = love.audio.newSource("assets/music/pickup.wav", "static")
sound_pickup:setVolume(0.7)
local bgm = love.audio.newSource("assets/music/menu_bgm.mp3", "stream")
local upper_bgm = love.audio.newSource("assets/music/Red_Curtain.mp3", "stream")
upper_bgm:setVolume(0.3)
local ending_bgm = love.audio.newSource("assets/music/happy_bgm.mp3", "stream")
ending_bgm:setVolume(0.6)
local footstep = love.audio.newSource("assets/music/step_cloth.mp3", "static")
local button = love.audio.newSource("assets/music/Clic03.mp3.flac", "static")
button:setVolume(0.7)
local button_success = love.audio.newSource("assets/music/clic02.mp3.flac", "static")

--dialog
local dialog_current
local dialog_text
local dialog_toprint
local dialog_itemindex
local dialog_on
local dialog_next
local dialog_movee

--to remove
local dark_room = {0,0,0,0,0,0,0,0,0,0,0,0}

--password input
local star = love.graphics.newImage("assets/pc/star.png")
local password_state = ""
local digicode_state = ""
local diode = love.graphics.newImage("assets/pc/diode.png")

--fonts
local font = love.graphics.newFont("assets/orangekid.ttf", 3.5*S)
local defautl_font = love.graphics.newFont("assets/orangekid.ttf", 3.5*S)

--player location
local item_room
local current_room
local previous_room

--general variables
local triggers = {0,0,0,0,0,0,0,0} -- {computer, note, screwd, battery_set, fuse_asc, nuclear door, cake, fullnote}
local text_buffer = {}
local did_interact
function love.load()
    item_selected = {}
    love.mouse.setCursor(CURSOR)
    inventory = {}
    current_room = 1
    item_room = menu
end
love.load()


---------------------------------------------------------------------------------------------

--completes item definitions from other files
local function get_item_dim() --so item with img dont need manual info on size
    for i=1, #entities do
        local room = entities[i]
        for j=1, #entities[i] do
            local item = room[j]
            if item ~= 0 then
                if item.go_to ~= nil and item.x == nil then
                    --item.x, item.y, item.w, item.h = 85,121,78,20 --for going backward
                    item.x, item.y, item.w, item.h = 62,114,113,21 --for going backward
                else
                    item.h = item.h or item.img:getHeight()
                    item.w = item.w or item.img:getWidth()
                end
            end
        end
    end
end
get_item_dim()

local function draw_S(img, x, y) --love draws but applies scalling to parameters
    if dark_room[current_room] == 1 then
        love.graphics.setColor(0.2, 0.2, 0.2, 1)
    else
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.draw(img, x*S, y*S, 0, S, S)
end

local function pickup(id) --pick up an item to inventory
    local item = item_room[id]
    if item ~= 0 and item.inventory_text ~= nil then
        if not first_pickup then
            first_pickup = true
        end
        sound_pickup:play()
        table.insert(inventory, item)
        item_room[id] = 0 --nil used to bug the # operator
    end
end

local function outline_text(text, x, y, s)
    love.graphics.print(text, x, y, 0, s)
    love.graphics.print(text, x+1, y, 0, s)
    love.graphics.print(text, x-1, y, 0, s)
    love.graphics.print(text, x, y+1, 0, s)
    love.graphics.print(text, x, y-1, 0, s)
    love.graphics.print(text, x+1, y+1, 0, s)
    love.graphics.print(text, x+1, y-1, 0, s)
    love.graphics.print(text, x-1, y+1, 0, s)
    love.graphics.print(text, x-1, y-1, 0, s)
end

local function text_queue(duration, text)
    Timer.clear()
    text_buffer = text
    Timer.after(
        duration,
        function()
            text_buffer = nil
        end
    )
end

local textbox = love.graphics.newImage("assets/textbox.png")
local function text_print()
    if text_buffer ~= nil then
        --love.graphics.setColor(0,0.9,0)
        love.graphics.setColor(0,0,0)
        outline_text(text_buffer, 10*S, 100*S, 2)
        love.graphics.setColor(1,1,1)
        love.graphics.print(text_buffer, 10*S, 100*S,0, 2,2)
    end
    if dialog_on then
        draw_S(textbox, 3, 96+2)
        love.graphics.setColor(0,0,0)
        love.graphics.print(dialog_toprint, 10*S, 100*S, 0, 2, 2)
    end
end

local function cursor_in_retangle(x, y, w, h)
    return (gx >= x) and (gy >= y) and (gx <= x + w) and (gy <= y + h)
end

local function fuse_switch(room, X) --bug: if u fuse a alreadt fused slot
    if room ~= nil then
        if room == "tp" then
            dark_room[6] = X
            dark_room[10] = X
        elseif room == "fille" then
            dark_room[7] = X
        elseif room == "storage" then
            dark_room[8] = X
            dark_room[11] = X
        elseif room == "ascenseur" then
            if X == 1 then
                triggers[5] = 0
            else
                triggers[5] = 1
            end
        end
    end
end

local function interact(j)
    local item = item_room[j]
    if item.interact_with ~= nil then
        for i=1, #item.interact_with do
            if item.interact_with[i] == item_selected.id then
                did_interact = true
                --verif some trigger --confusing name to change
                if item.id == "girl_interact" then
                    if dark_room[7] ~= 1 and item_selected.id == "knife" then
                        break
                    elseif item_selected.id == "pot_corrosive"  or item_selected.id == "pot_failed" then
                        text_queue(2, item.pot_text)
                        break
                    end
                end

                --sound itneract
                if item.interact_sound ~= nil and item.interact_sound[i] ~= nil then
                    if item.interact_sound_stop then
                        bgm:stop()
                        audio_pause = true
                    end
                    item.interact_sound[i]:play()
                end

                --switch on triggers
                if item.trigger ~= nil and item.trigger[i] ~= nil then
                    triggers[item.trigger[i]] = 1
                end

                fuse_switch(item.interact_fuse, 0)

                local give = item.interact_gives
                if give ~= nil and give[i] ~= nil then
                    table.insert(inventory, give[i])
                end

                local replace = item.replace_item
                if replace ~= nil and replace[i] ~= nil then
                    table.insert(item_room, replace[i])
                    item_room[j] = 0
                    get_item_dim()
                end

                local new_item = item.interact_new_item
                if new_item ~= nil and new_item[i] ~= nil then
                    table.insert(item_room, new_item[i])
                    get_item_dim()
                end

                local new_item2 = item.interact_new_item2 --spaghetti code but ok
                if new_item2 ~= nil and new_item2[i] ~= nil then
                    table.insert(item_room, new_item2[i])
                    get_item_dim()
                end

                if item.interact_text ~= nil then
                    text_buffer = nil
                    text_queue(item.text_duration, item.interact_text)
                end

                if item.interact_remove ~= nil then
                    item_room[item.interact_remove[i]] = 0 --deletes item in the same room, in the table order
                end

                local inv_rem = item.interact_inv_rem
                if inv_rem ~= nil and inv_rem[i] then
                    table.remove(inventory, item_selected.i)
                end

            end
        end
    end
end

local function password_input(item)
    if item.code ~= nil and #password_state < 4 then
        password_state = password_state..item.code
    end

    if item.enter then
        if password_state == "1412" then
            entities[9] = pc_data[2]
            item_room = pc_data[2]
            get_item_dim()
            password_state = ""
            bgm:stop()
            bgm = ending_bgm
        else
            password_state = ""
        end
    end

    local new_layer = item.change_layer
    if new_layer ~= nil  then
        entities[9] = pc_data[new_layer]
        item_room = pc_data[new_layer]
        get_item_dim()
    end
end

local function remove(item)
    local rem_list = item.rem
    if item.rem ~= nil then
        for i=1, #item.rem do
            item_room[rem_list[i]] = 0
        end
    end
end

local function dialog(item, i)
    if item.dialog_font ~= nil then
        font = item.dialog_font
    end
    dialog_text = item.dialog
    dialog_toprint = dialog_text[1]
    dialog_current = 1
    dialog_itemindex = i
    dialog_next = item.dialog_nex
    dialog_movee = item.dialog_move
    dialog_on = true
end

local function toggle_screen()
    local fullscreen_state = love.window.getFullscreen( )
    love.window.setFullscreen(not fullscreen_state, "desktop")
    if fullscreen_state then
        S = 4
        font = love.graphics.newFont("assets/orangekid.ttf", 3.5*S)
    else
        S = 8
        font = love.graphics.newFont("assets/orangekid.ttf", 3*S)
    end
end

local function sensors()
    did_interact = false
    for i=1, #item_room do
        local item = item_room[i]
        if item ~= 0 and item ~= nil and cursor_in_retangle(item.x, item.y, item.w, item.h) then
            fuse_switch(item.fuse_room, 1)

            if item.condilast == "radio" then
                if jukebox:isPlaying() then
                    break
                end
            end

            --play sound
            if item.sound ~= nil then
                if item.sound_condition == nil or dark_room[6] == 1 then
                    item.sound:play()
                    if item.sound_once then
                        item.sound = nil
                    end
                end
            end

            --add elements to a distant room
            local elements = item.room
            if elements ~= nil then
                local option = 1
                local dest_room = item.whichroom
                if item.room_condition ~= nil and item.room_condition == "projo" and triggers[1] == 1 then --check wheter proj is modded
                    option = 2
                end
                for i=1, #elements[option] do
                    table.insert(entities[dest_room], 1, elements[option][i])
                end
                get_item_dim()
            end

            --turn on trigger but without inventory interaction
            local trig = item.trigger_noninteract
            if trig ~= nil then
                triggers[trig] = 1
            end

            --dialog
            if item_room[i] ~= 0 and item.dialog ~= nil and item_selected.id == nil then
                if item.dialog_inventoryadd ~= nil then
                    dialog(item, i)
                    sound_pickup:play()
                    table.insert(inventory, item.dialog_inventoryadd)
                    break
                elseif item.trigger_noninteract ~= nil and item.trigger_noninteract == 2 then
                    entities[5][1] = 0 --remove heurtel still in room after movin
                    dialog(item, i)
                    break
                elseif item.condition == "trig2" and triggers[2] == 1 then --pour que boutheir s'en aille
                    dialog(item, i)
                    table.remove(entities[18], 3) --removes bouthier
                    table.remove(entities[19], #entities[19]) --removes access to medialab
                    table.insert(entities[19], item.condition_toadd) --add desc in medialab
                    break
                elseif item.condition == nil then
                    dialog(item, i)
                    break
                end
            end

            --print text
            if item_room[i] ~= 0 and item.text ~= nil then
                text_queue(item.text_duration, item.text)
            end
            interact(i)     --trigger is _interact_with

            pickup(i)       --trigger is "inventory_text"

            --move (not made into function because of break, be careful of its other occurences when changing)
            local dest = item.go_to
            if dest ~= nil then
                if item.no_sound == nil then
                    sound_door:stop()
                    sound_door:play()
                elseif item.footstep ~= nil then
                    footstep:stop()
                    footstep:play()
                end
                previous_room  = current_room
                current_room = dest
                item_room = entities[dest]
                break
            end

            --remove last item (useful for zoomed notes)
            if item.rem_last then
                item_room[#item_room] = 0
            end

            --discard
            if item.discard then
                item_room[i] = 0
                --break
            end

            remove(item) -- trigger is "rem", removes given items in the room

            password_input(item)

            --digicode inputs
            if item.digicode_input ~= nil and #digicode_state < 4 then
                digicode_state = digicode_state..item.digicode_input
                button:stop()
                button:play()
            end
            if item.digicode_enter ~= nil then
                if digicode_state == item.digicode_enter then
                    entities[13][1] = {
                        x=46, y=36, w=45, h=101,
                        go_to = 16
                    }
                    table.insert(item_room, {
                        x=102, y=107, w=3, h=3,
                        img = diode
                    })
                    digicode_state = ""
                    button_success:stop()
                    button_success:play()
                else
                    digicode_state = ""
                end
            end
            
            --go back to previous room
            if item.go_back then
                current_room = previous_room
                item_room = entities[previous_room]
                digicode_state = ""
                break
            end

            --jukebox
            if item.id == "jukebox" then
                jukebox:stop()
                if jk_current_index > #item.musics - 1 then
                    jk_current_index = 0
                end
                jk_current_index = jk_current_index + 1
                jukebox = item.musics[jk_current_index]
                bgm:pause()
                jukebox:play()
            end

            --break to prevent some items overlapping
            if item.no_overlap == true then
                break
            end

            --toggle fullscreen
         --[[    if item.toggle_fulscreen then
                toggle_screen()
            end ]]

            --sound control
            if item.volume_slide then
                local w = item.w
                local x = item.x
                local relative_x = gx-x
                volume = relative_x / w
                love.audio.setVolume(volume)
                sound_pickup:play()
            end

            if item.quit then
                love.event.quit()
            end
        end
    end
end


local function inventory_select()
    local previous_item = item_selected
    for i=1, #inventory do
    local item = inventory[i]
        if cursor_in_retangle((INV_X+INV_PADDING_X+(i-1)*INV_X_BETWEEN_ITEMS), TOPMARGIN, TN_SIZE, TN_SIZE) then
            if item.zoom ~= nil then
                if item_selected.id == "note_left" then
                    --fuse notes
                    table.remove(inventory, i)
                    table.remove(inventory, item_selected.i-1)
                    table.insert(inventory, 1, item.merge)
                else
                    --zoom on notes
                    if item.id == "note_shelf" and item.sound_shelf ~= nil and current_room ~= 9 then
                        --creepy noise upon reading for the first time left note
                        item.sound_shelf:play()
                        item.sound_shelf = nil
                    end
                    if (item_room[#item_room] ~= 0 and item_room[#item_room].id ~= "iszoom")
                    or item_room[#item_room] == 0 then
                        table.insert(item_room, item.zoom1)
                        table.insert(item_room, 1, item.zoom2)
                        get_item_dim()
                    end
                end
            elseif (item.id == "wire" and item_selected.id == "battery")
            or (item_selected.id == "wire" and item.id == "battery") then
                table.remove(inventory, i)
                local j = item_selected.i
                if inventory[j-1].id == "battery" or inventory[j-1].id == "wire" then
                    table.remove(inventory, item_selected.i-1)
                else
                    table.remove(inventory, item_selected.i)
                end
                table.insert(inventory, item.merge)
            else
                love.mouse.setCursor(ITEM_CURSOR)
                item_selected = {}
                item_selected.id = item.id
                item_selected.i = i
            end
        end
    end
    if item_selected == previous_item then --if the same item is clicked or none it unselect item
        do_clear_cursor = true
    end
end

local function clear_cursor()
    if do_clear_cursor then
        if not did_interact and next(item_selected) ~= nil then
            text_queue(1, "Je ne peux pas faire ça.")
        end
        item_selected = {}
        love.mouse.setCursor(CURSOR)
        do_clear_cursor = false
    end
end

function love.keypressed(key)
--[[     if key == "escape" then
        toggle_screen()
    end ]]
end


function love.mousepressed()
    --order matters for priorities
    if dialog_on then
        local item = item_room[dialog_itemindex]
        dialog_current = dialog_current + 1
        
        if dialog_current > #dialog_text then
            dialog_on = false
            font = defautl_font
            if item.dialog_repeat == nil then
                item_room[dialog_itemindex] = 0
            end
            if item.set_bgm == "upper" then
                bgm:stop()
                bgm = upper_bgm
            end
            if dialog_movee ~= nil then
                --item_room[dialog_itemindex] = 0 --lets ppl alive after
                current_room = dialog_movee
                item_room = entities[dialog_movee]
            end
            if dialog_next ~= nil then
                item_room[dialog_itemindex] = dialog_next
                --launches the dialog right away!
                dialog(item_room[dialog_itemindex], dialog_itemindex)
                get_item_dim()
            end
        else
            dialog_toprint = dialog_text[dialog_current]
        end
    else
        inventory_select()
        sensors()
        clear_cursor()
    end
end

function love.update(dt)
    Timer.update(dt) -- update timer module
    local x, y = love.mouse.getPosition()
    gx,gy = x/S, y/S  --global cursor position (scaled to window)
    if not jukebox:isPlaying() and not audio_pause then
		love.audio.play(bgm)
	end
end

local function draw_inventory()
    local inv_w = (INV_PADDING_X+(#inventory)*INV_X_BETWEEN_ITEMS+2)
    local inv_show_condition = (cursor_in_retangle(INV_X, INV_Y, inv_w, INV_H) and #inventory > 0)
    if inv_show_condition or first_pickup then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", INV_X*S, INV_Y*S, inv_w*S, INV_H*S)
        love.graphics.setColor(0, 0, 0, 0.4)
        love.graphics.rectangle("fill", INV_X*S, INV_Y*S, inv_w*S, INV_H*S)
        for i=#inventory, 1, -1  do                           --draws thumbnails
            local item = inventory[i]
            local item_x = (INV_X+INV_PADDING_X+(i-1)*INV_X_BETWEEN_ITEMS)
            draw_S(item.thumbnail, item_x, TOPMARGIN)
            if cursor_in_retangle(item_x, TOPMARGIN, TN_SIZE, TN_SIZE) then --draws hover text
                text_buffer = nil
                love.graphics.setColor(0,0,0)
                outline_text(item.inventory_text, 10*S, 100*S, 2)
                love.graphics.setColor(1,1,1)
                love.graphics.print(item.inventory_text, 10*S, 100*S,0, 2,2) --hardcoded values bad
            end
        end
        if first_pickup and inv_show_condition then
            first_pickup = nil
        end
    end
end

local function draw_item()
    for i=1, #item_room do
        local item = item_room[i]
        if item ~= 0 and item.img ~= nil then
            draw_S(item.img, item.x, item.y)
        end
    end
end

local function draw_password()
    if current_room == 9 then
        for i=1, #password_state do
           draw_S(star, (100 + 8*(i-1)), 46)
        end
    end
    if current_room == 15 then
        for i=1, #digicode_state do
           draw_S(star, (104 + 8*(i-1)), 46)
        end
    end
end

local function draw_sound()
    if current_room == 4 then
        local vol = audio[2]
        love.graphics.setColor(0, 0, 1, 1)
        love.graphics.rectangle("fill", vol.x*S, vol.y*S, volume*vol.w*S, vol.h*S)
    end
end

function love.draw()
    love.graphics.setFont(font)
    draw_S(ROOM_BG[current_room], 0, 0)
    draw_item()
    draw_inventory()
    draw_password()
    text_print()
    draw_sound()
end

--a faire:
--cliquer sur la porte du bda fait entendre des nouvelles musiques
--echap retourne au menu principal (puis retour en jeu permis)
--dessiner TNservices et mettre la feuille d'entreprise dedans
--remplir la salle direction des etudes
--mettre en valeur le projecteur

--known issues:
--manque local TNstudio
--heurtel fait cours sans videoproj
--fullscreen only works for 1080p
