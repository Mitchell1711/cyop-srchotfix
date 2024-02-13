function scr_initinput(argument0) //gml_Script_scr_initinput
{
    if (argument0 == undefined)
        argument0 = 1
    if argument0
        ini_open("saveData.ini")
    //new input system reads button array from the input settings, allowing multiple keys to be binded to an input
    global.key_up_arr = scr_deserialize_input("player_up", "0,38,")
    global.key_right_arr = scr_deserialize_input("player_right", "0,39,")
    global.key_left_arr = scr_deserialize_input("player_left", "0,37,")
    global.key_down_arr = scr_deserialize_input("player_down", "0,40,")
    global.key_jump_arr = scr_deserialize_input("player_jump", "0,90,")
    global.key_slap_arr = scr_deserialize_input("player_slap", "0,88,")
    global.key_taunt_arr = scr_deserialize_input("player_taunt", "0,67,")
    global.key_attack_arr = scr_deserialize_input("player_attack", "0,16,")
    global.key_superjump_arr = scr_deserialize_input("player_superjump", "")
    global.key_groundpound_arr = scr_deserialize_input("player_groundpound", "")
    global.key_upC_arr = scr_deserialize_input("player_upC", "2,32786,-1,1,32781,")
    global.key_rightC_arr = scr_deserialize_input("player_rightC", "2,32785,1,1,32784,")
    global.key_leftC_arr = scr_deserialize_input("player_leftC", "2,32785,-1,1,32783,")
    global.key_downC_arr = scr_deserialize_input("player_downC", "2,32786,1,1,32782,")
    global.key_jumpC_arr = scr_deserialize_input("player_jumpC", "1,32769,")
    global.key_slapC_arr = scr_deserialize_input("player_slapC", "1,32771,")
    global.key_tauntC_arr = scr_deserialize_input("player_tauntC", "1,32772,")
    global.key_attackC_arr = scr_deserialize_input("player_attackC", "1,32776,1,32774,")
    global.key_startC_arr = scr_deserialize_input("menu_startC", "1,32778,")
    global.key_superjumpC_arr = scr_deserialize_input("player_superjumpC", "")
    global.key_groundpoundC_arr = scr_deserialize_input("player_groundpoundC", "")
    //menu binds
    global.key_menu_delete = scr_deserialize_input("menu_delete", "0,67,")
    global.key_menu_quit = scr_deserialize_input("menu_quit", "0,88,")
    global.key_menu_back = scr_deserialize_input("menu_back", "0,88,0,27,")
    global.key_menu_select = scr_deserialize_input("menu_select", "0,90,0,32,")
    global.key_menu_start = scr_deserialize_input("menu_start", "0,27,")
    global.key_menu_left = scr_deserialize_input("menu_left", "0,37,")
    global.key_menu_right = scr_deserialize_input("menu_right", "0,39,")
    global.key_menu_up = scr_deserialize_input("menu_up", "0,38,")
    global.key_menu_down = scr_deserialize_input("menu_down", "0,40,")
    global.key_menu_deleteC = scr_deserialize_input("menu_deleteC", "1,32772,")
    global.key_menu_quitC = scr_deserialize_input("menu_quitC", "1,32771,")
    global.key_menu_backC = scr_deserialize_input("menu_backC", "1,32770,")
    global.key_menu_selectC = scr_deserialize_input("menu_selectC", "1,32769,")
    global.key_menu_startC = scr_deserialize_input("menu_startC", "1,32778,")
    global.key_menu_leftC = scr_deserialize_input("menu_leftC", "2,32785,-1,1,32783,")
    global.key_menu_rightC = scr_deserialize_input("menu_rightC", "2,32785,1,1,32784,")
    global.key_menu_upC = scr_deserialize_input("menu_upC", "2,32786,-1,1,32781,")
    global.key_menu_downC = scr_deserialize_input("menu_downC", "2,32786,1,1,32782,")
    global.gamepad_deadzone = ini_read_real("InputConfig", "deadzone", 0.4)
    global.gamepad_deadzone_vertical = ini_read_real("InputConfig", "deadzone_vert", 0.65)
    global.gamepad_deadzone_horizontal = ini_read_real("InputConfig", "deadzone_horiz", 0.5)
    global.gamepad_deadzone_press = ini_read_real("InputConfig", "deadzonepress", 0.5)
    global.gamepad_deadzone_superjump = ini_read_real("InputConfig", "deadzonesuperjump", 0.56)
    global.gamepad_deadzone_crouch = ini_read_real("InputConfig", "deadzonecrouch", 0.46)
    global.gamepad_superjump = ini_read_real("InputConfig", "superjump", 1)
    global.gamepad_groundpound = ini_read_real("InputConfig", "groundpound", 1)
    global.keyboard_superjump = ini_read_real("InputConfig", "kb_superjump", 1)
    global.keyboard_groundpound = ini_read_real("InputConfig", "kb_groundpound", 1)
    //old binding code so everything that reads it directly doesn't break
    global.key_up = ini_read_string("ControlsKeys", "up", 38)
    global.key_right = ini_read_string("ControlsKeys", "right", 39)
    global.key_left = ini_read_string("ControlsKeys", "left", 37)
    global.key_down = ini_read_string("ControlsKeys", "down", 40)
    global.key_jump = ini_read_string("ControlsKeys", "jump", 90)
    global.key_slap = ini_read_string("ControlsKeys", "slap", 88)
    global.key_taunt = ini_read_string("ControlsKeys", "taunt", 67)
    global.key_shoot = ini_read_string("ControlsKeys", "shoot", 65)
    global.key_attack = ini_read_string("ControlsKeys", "attack", 16)
    global.key_start = ini_read_string("ControlsKeys", "start", 27)
    global.key_chainsaw = ini_read_string("ControlsKeys", "chainsaw", 86)
    global.key_upC = ini_read_string("ControllerButton", "up", 32781)
    global.key_rightC = ini_read_string("ControllerButton", "right", 32784)
    global.key_leftC = ini_read_string("ControllerButton", "left", 32783)
    global.key_downC = ini_read_string("ControllerButton", "down", 32782)
    global.key_jumpC = ini_read_string("ControllerButton", "jump", 32769)
    global.key_slapC = ini_read_string("ControllerButton", "slap", 32771)
    global.key_tauntC = ini_read_string("ControllerButton", "taunt", 32772)
    global.key_shootC = ini_read_string("ControllerButton", "shoot", 32770)
    global.key_attackC = ini_read_string("ControllerButton", "attack", 32776)
    global.key_startC = ini_read_string("ControllerButton", "start", 32778)
    global.key_chainsawC = ini_read_string("ControllerButton", "chainsaw", 32773)
    global.key_superjumpC = ini_read_string("ControllerButton", "superjump", -4)
    global.key_groundpoundC = ini_read_string("ControllerButton", "groundpound", -4)
    if argument0
        ini_close()
}

//turn array keybind data string into something usable
function scr_deserialize_input(argument0, argument1) //gml_Script_scr_deserialize_input
{
    var str = ini_read_string("Input", argument0, argument1)
    var arr = string_split(str, ",")
    var i = 0
    while (i < array_length(arr))
    {
        if (arr[i] == "")
            break
        else
        {
            arr[i] = real(arr[i])
            i++
            continue
        }
    }
    return arr;
}

