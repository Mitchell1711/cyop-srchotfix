if ((!global.option_timer) || room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || (!global.option_hud))
    return;
if ((!global.option_hud) || (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)))
    return;
draw_set_color(c_white)
var seconds = 0
var minutes = 0
var s_str = ""
var m_str = ""
if (global.option_timer_type == 0)
{
    seconds = global.level_seconds
    minutes = global.level_minutes
}
else if (global.option_timer_type == 1)
{
    seconds = global.tower_seconds
    minutes = global.tower_minutes
}
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(global.smallfont)
draw_set_alpha(1)
draw_set_color(c_white)
var finalstr = src_create_string(seconds, minutes, 1)
draw_text((obj_screensizer.actual_width - ((string_length(finalstr) - 1) * string_width("A"))), (obj_screensizer.actual_height - 8), finalstr)
//debug information when editing a level, shows more than just a timer but I can't be bothered to put it on its own object
if global.editingLevel
{
    var roomsec = (global.room_frames * s)
    var roommin = floor((roomsec / 60))
    roomsec = (roomsec % 60)
    var room_time = src_create_string(roomsec, roommin, 0)
    roomsec = (global.prev_room_frames * s)
    roommin = floor((roomsec / 60))
    roomsec = (roomsec % 60)
    var prev_room_time = src_create_string(roomsec, roommin, 0)
    var room_frames = string(global.prev_room_frames)
    var char_height = (string_height("A") + 4)
    var str_offset = (obj_screensizer.actual_height - 8)
    draw_text(8, str_offset, string(room_time))
    draw_text(8, (str_offset - char_height), concat(prev_room_time, " : ", room_frames))
    with (obj_player1)
    {
        other.Px = x
        other.Py = y
        other.Phsp = hsp
        other.Pvsp = vsp
    }
    draw_text(8, (str_offset - (char_height * 3)), concat("HSP: ", Phsp))
    draw_text(156, (str_offset - (char_height * 3)), concat("VSP: ", Pvsp))
    draw_text(8, (str_offset - (char_height * 4)), concat("X: ", Px))
    draw_text(156, (str_offset - (char_height * 4)), concat("Y: ", Py))
    draw_text(8, (str_offset - (char_height * 5)), concat("ROOM: ", string_upper(global.currentRoom)))
    //debug code that shows all the objects in the room
    /*var objs = []
    draw_set_font(font1)
    with (all)
        array_push(objs, concat(object_get_name(object_index), " "))
    draw_text_ext(8, (str_offset - (char_height * 6)), string(objs), char_height, obj_screensizer.actual_width)*/
    //debug code that shows all objects in saveroom
    /*var objs = []
    draw_set_font(font1)
    for(var i = 0; i < ds_list_size(global.saveroom); i++){
        array_push(objs, concat(ds_list_find_value(global.saveroom, i), " "))
    }
    draw_text_ext(8, (str_offset - (char_height * 6)), string(objs), char_height, obj_screensizer.actual_width)*/
    //debug code that draws the contents of the instanceManager
    //draw_text_ext(8, (str_offset - (char_height * 7)), json_stringify(global.instanceManager, 1), char_height, obj_screensizer.actual_widthx)
}
//create the timer string text, argument2 decides whether to draw hours or not
function src_create_string(argument0, argument1, argument2) //gml_Script_src_create_string
{
    var s_str = string_format(argument0, 2, 3)
    if (argument0 < 10)
    {
        s_str = string_copy(s_str, 2, string_length(s_str))
        s_str = concat("0", s_str)
    }
    argument1 = floor(argument1)
    if ((argument1 % 60) < 10)
        var m_str = concat(0, (argument1 % 60))
    else
        m_str = string((argument1 % 60))
    if argument2
    {
        var hours = floor((argument1 / 60))
        if (hours < 10)
            hours = concat(0, hours)
        else
            hours = string(hours)
        return concat(hours, ":", m_str, ":", s_str);
    }
    return concat(m_str, ":", s_str);
}

