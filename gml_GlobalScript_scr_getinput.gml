function scr_init_input() //gml_Script_scr_init_input
{
    key_up = 0
    key_up2 = 0
    key_right = 0
    key_right2 = 0
    key_left = 0
    key_left2 = 0
    key_down = 0
    key_down2 = 0
    key_jump = 0
    key_jump2 = 0
    key_slap = 0
    key_slap2 = 0
    key_taunt = 0
    key_taunt2 = 0
    key_attack = 0
    key_attack2 = 0
    key_shoot = 0
    key_shoot2 = 0
    key_start = 0
    key_escape = 0
    key_chainsaw = 0
    key_chainsaw2 = 0
    key_select = 0
    stickpressed = 0
    stickpressed_horizontal = 0
    stickpressed_vertical = 0
    _dvc = 0
    verticaldeadzone = 0
    horizontaldeadzone = 0
    vertpress_dz = 0
    horizpress_dz = 0
}

function scr_check_superjump() //gml_Script_scr_check_superjump
{
    var sj = global.gamepad_superjump
    if (obj_inputAssigner.player_input_device[0] < 0)
        sj = global.keyboard_superjump
    return ((sj && key_up) || key_superjump);
}

function scr_check_groundpound() //gml_Script_scr_check_groundpound
{
    var gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = global.keyboard_groundpound
    return ((gp && key_down2) || key_groundpound);
}

function scr_check_groundpound2() //gml_Script_scr_check_groundpound2
{
    var gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = global.keyboard_groundpound
    return ((gp && key_down) || key_groundpound2);
}

//functions for reading the new array input data, if an input from the list is found to be held down it will return true
function src_key_check(argument0) //gml_Script_src_key_check
{
    for (var i = 1; i < array_length(argument0); i += 2)
    {
        if keyboard_check(argument0[(i + 1)])
            return 1;
    }
    return 0;
}

//same as previous except it checks whether it was pressed
function src_key_press_check(argument0) //gml_Script_src_key_press_check
{
    for (var i = 1; i < array_length(argument0); i += 2)
    {
        if keyboard_check_pressed(argument0[(i + 1)])
            return 1;
    }
    return 0;
}

//function for reading controller inputs with the new array input system, type 2 is the analog stick
function src_gamepad_check(argument0) //gml_Script_src_gamepad_check
{
    for (var i = 1; i < array_length(argument0); i += 2)
    {
        var type = argument0[i]
        var bttn = argument0[(i + 1)]
        if (type == 2)
        {
            var dir = argument0[(i + 2)]
            if (bttn == gp_axislh || bttn == gp_axisrv)
            {
                if (dir == -1)
                {
                    if (gamepad_axis_value(_dvc, bttn) < (-horizontaldeadzone))
                        return 1;
                }
                else if (gamepad_axis_value(_dvc, bttn) > horizontaldeadzone)
                    return 1;
            }
            else if (bttn == gp_axislv || bttn == gp_axisrh)
            {
                if (dir == -1)
                {
                    if (gamepad_axis_value(_dvc, bttn) < (-verticaldeadzone))
                        return 1;
                }
                else if (gamepad_axis_value(_dvc, bttn) > verticaldeadzone)
                    return 1;
            }
            i++
        }
        else if gamepad_button_check(_dvc, bttn)
            return 1;
    }
    return 0;
}

//same as previous function except it checks for a press instead
function src_gamepad_press_check(argument0) //gml_Script_src_gamepad_press_check
{
    for (var i = 1; i < array_length(argument0); i += 2)
    {
        var type = argument0[i]
        var bttn = argument0[(i + 1)]
        if (type == 2)
        {
            var dir = argument0[(i + 2)]
            if (bttn == gp_axislh || bttn == gp_axisrv)
            {
                if (dir == -1)
                {
                    if (gamepad_axis_value(_dvc, bttn) < (-horizpress_dz) && stickpressed_horizontal == 0)
                        return 1;
                }
                else if (gamepad_axis_value(_dvc, bttn) > horizpress_dz && stickpressed_horizontal == 0)
                    return 1;
            }
            else if (bttn == gp_axislv || bttn == gp_axisrh)
            {
                if (dir == -1)
                {
                    if (gamepad_axis_value(_dvc, bttn) < (-vertpress_dz) && stickpressed_vertical == 0)
                        return 1;
                }
                else if (gamepad_axis_value(_dvc, bttn) > vertpress_dz && stickpressed_vertical == 0)
                    return 1;
            }
            i++
        }
        else if gamepad_button_check_pressed(_dvc, bttn)
            return 1;
    }
    return 0;
}

//mostly for ghost movement, reads axis from analog stick and returns that value
function src_get_move_axis(argument0) //gml_Script_src_get_move_axis
{
    for (var i = 1; i < array_length(argument0); i += 2)
    {
        var type = argument0[i]
        var bttn = argument0[(i + 1)]
        if (type == 2)
        {
            var dir = argument0[(i + 2)]
            var axis_value = gamepad_axis_value(_dvc, bttn)
            if (dir == -1 && axis_value > 0)
                axis_value = 0
            else if (dir == 1 && axis_value < 0)
                axis_value = 0
            if (axis_value != 0)
                return axis_value;
        }
        else
            return 0;
    }
}

//menu input binds for the pause menu, not any other menus because they break when edited in UTMT
function src_menu_getinput() //gml_Script_src_menu_getinput
{
    verticaldeadzone = global.gamepad_deadzone_vertical
    horizontaldeadzone = global.gamepad_deadzone_horizontal
    vertpress_dz = global.gamepad_deadzone_press
    horizpress_dz = global.gamepad_deadzone_press
    key_up = (src_key_check(global.key_menu_up) || src_gamepad_check(global.key_upC_arr))
    key_up2 = (src_key_press_check(global.key_menu_up) || src_gamepad_press_check(global.key_upC_arr))
    key_down = (src_key_check(global.key_menu_down) || src_gamepad_check(global.key_downC_arr))
    key_down2 = (src_key_press_check(global.key_menu_down) || src_gamepad_press_check(global.key_downC_arr))
    key_left = (-((src_key_check(global.key_menu_left) || src_gamepad_check(global.key_menu_leftC))))
    key_left2 = (-((src_key_press_check(global.key_menu_left) || src_gamepad_press_check(global.key_menu_leftC))))
    key_right = (src_key_check(global.key_menu_right) || src_gamepad_check(global.key_menu_rightC))
    key_right2 = (src_key_press_check(global.key_menu_right) || src_gamepad_press_check(global.key_menu_rightC))
    key_start = (src_key_press_check(global.key_menu_start) || src_gamepad_press_check(global.key_menu_startC))
    key_back = (src_key_press_check(global.key_menu_back) || src_gamepad_press_check(global.key_menu_backC))
    key_select = (src_key_press_check(global.key_menu_select) || src_gamepad_press_check(global.key_menu_selectC))
    key_delete = (src_key_press_check(global.key_menu_delete) || src_gamepad_press_check(global.key_menu_deleteC))
    key_quit = (src_key_press_check(global.key_menu_quit) || src_gamepad_press_check(global.key_menu_quitC))
    key_jump = (src_key_press_check(global.key_menu_select) || src_gamepad_press_check(global.key_menu_selectC))
    key_jump2 = (src_key_check(global.key_menu_select) || src_gamepad_check(global.key_menu_selectC))
    key_escape = (src_key_press_check(global.key_menu_quit) || src_gamepad_press_check(global.key_menu_quitC))
    src_check_gamepad_press()
}

//the standard input reading function used for gameplay and other stuff
function scr_getinput() //gml_Script_scr_getinput
{
    if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
        return;
    _dvc = obj_inputAssigner.player_input_device[0]
    gamepad_set_axis_deadzone(_dvc, global.gamepad_deadzone)
    verticaldeadzone = global.gamepad_deadzone_vertical
    horizontaldeadzone = global.gamepad_deadzone_horizontal
    vertpress_dz = global.gamepad_deadzone_press
    horizpress_dz = global.gamepad_deadzone_press
    key_up = (src_key_check(global.key_up_arr) || src_gamepad_check(global.key_upC_arr))
    key_up2 = (src_key_press_check(global.key_up_arr) || src_gamepad_press_check(global.key_upC_arr))
    key_right = (src_key_check(global.key_right_arr) || src_gamepad_check(global.key_rightC_arr))
    key_right2 = (src_key_press_check(global.key_right_arr) || src_gamepad_press_check(global.key_rightC_arr))
    key_left = (-((src_key_check(global.key_left_arr) || src_gamepad_check(global.key_leftC_arr))))
    key_left2 = (-((src_key_press_check(global.key_left_arr) || src_gamepad_press_check(global.key_leftC_arr))))
    key_down = (src_key_check(global.key_down_arr) || src_gamepad_check(global.key_downC_arr))
    key_down2 = (src_key_press_check(global.key_down_arr) || src_gamepad_press_check(global.key_downC_arr))
    key_jump = (src_key_press_check(global.key_jump_arr) || src_gamepad_press_check(global.key_jumpC_arr))
    key_jump2 = (src_key_check(global.key_jump_arr) || src_gamepad_check(global.key_jumpC_arr))
    key_slap = (src_key_check(global.key_slap_arr) || src_gamepad_check(global.key_slapC_arr))
    key_slap2 = (src_key_press_check(global.key_slap_arr) || src_gamepad_press_check(global.key_slapC_arr))
    key_taunt = (src_key_check(global.key_taunt_arr) || src_gamepad_check(global.key_tauntC_arr))
    key_taunt2 = (src_key_press_check(global.key_taunt_arr) || src_gamepad_press_check(global.key_tauntC_arr))
    key_attack = (src_key_check(global.key_attack_arr) || src_gamepad_check(global.key_attackC_arr))
    key_attack2 = (src_key_press_check(global.key_attack_arr) || src_gamepad_press_check(global.key_attackC_arr))
    key_escape = (src_key_press_check(global.key_menu_quit) || src_gamepad_press_check(global.key_menu_quitC))
    key_shoot = 0
    key_shoot2 = 0
    key_start = (src_key_press_check(global.key_menu_start) || src_gamepad_press_check(global.key_menu_startC))
    key_escape = (src_key_press_check(global.key_menu_quit) || src_gamepad_press_check(global.key_menu_quitC))
    key_chainsaw = (keyboard_check(global.key_chainsaw) || gamepad_button_check(_dvc, global.key_chainsawC))
    key_chainsaw2 = (keyboard_check_pressed(global.key_chainsaw) || gamepad_button_check_pressed(_dvc, global.key_chainsawC))
    key_superjump = (src_key_check(global.key_superjump_arr) || src_gamepad_check(global.key_superjumpC_arr))
    key_groundpound = (src_key_press_check(global.key_groundpound_arr) || src_gamepad_press_check(global.key_groundpoundC_arr))
    key_groundpound2 = (src_key_check(global.key_groundpound_arr) || src_gamepad_check(global.key_groundpoundC_arr))
    key_left_axis = src_get_move_axis(global.key_leftC_arr)
    key_right_axis = src_get_move_axis(global.key_rightC_arr)
    key_up_axis = src_get_move_axis(global.key_upC_arr)
    key_down_axis = src_get_move_axis(global.key_downC_arr)
    key_select = (src_key_press_check(global.key_menu_select) || src_gamepad_press_check(global.key_menu_selectC))
    src_check_gamepad_press()
    if (object_index == obj_player1)
    {
        if (state == states.Sjumpprep || state == states.crouch || state == states.ratmountcrouch)
        {
            var haxis = gamepad_axis_value(_dvc, gp_axislh)
            var vaxis = gamepad_axis_value(_dvc, gp_axislv)
            if (haxis != 0 || vaxis != 0)
            {
                var _deadzone = floor((global.gamepad_deadzone_superjump * 120))
                if (state == states.crouch || state == states.ratmountcrouch)
                {
                    vaxis *= -1
                    _deadzone = floor((global.gamepad_deadzone_crouch * 120))
                }
                var _dir = point_direction(0, 0, haxis, vaxis)
                trace(_dir, ":", _deadzone)
                if ((_dir <= (120 + _deadzone) && _dir >= (60 - _deadzone)) || _dir >= (420 - _deadzone))
                {
                    if (state == states.Sjumpprep)
                        key_up = 1
                    else if ((state == states.crouch && uncrouch <= 0) || state == states.ratmountcrouch)
                        key_down = 1
                }
            }
        }
    }
}

//differentiates if the stick is pressed or held, mostly relevant for menu scrolling
function src_check_gamepad_press() //gml_Script_src_check_gamepad_press
{
    stickpressed_horizontal = (gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz || gamepad_axis_value(_dvc, gp_axislh) <= (-horizpress_dz))
    stickpressed_vertical = (gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz || gamepad_axis_value(_dvc, gp_axislv) <= (-vertpress_dz))
}

