//set values for pressed buttons on object
function scr_init_input_practice() //gml_Script_scr_init_input_practice
{
	change_taunt = 0
	
    reload_room = 0
    show_stats = 0
    last_room = 0
    noclip = 0
    debug = 0
    last_command = 0
    spawn_key = 0
    spawn_gerome = 0
    show_collisions = 0
    spawn_shotgun = 0
    spawn_satan = 0
    slot1 = 0
    slot2 = 0
    slot3 = 0
    slot4 = 0
    slot5 = 0
    slot6 = 0
    slot7 = 0
    slot8 = 0
    slot9 = 0
    slot0 = 0
    savestate = 0
    mach4 = 0
    pause = 0
    unpause = 0
}

//check for pressed input
function scr_getinput_practice() //gml_Script_scr_getinput_practice
{
    if ((!instance_exists(obj_debugcontroller)) || (!obj_debugcontroller.active))
    {
		change_taunt = keyboard_check_pressed(global.change_taunt)
		
		//Check for pause spam directly in scr_getinput
		
        reload_room = keyboard_check_pressed(global.reload_room)
        show_stats = keyboard_check_pressed(global.show_stats)
        last_room = keyboard_check_pressed(global.last_room)
        noclip = keyboard_check_pressed(global.noclip)
        last_command = keyboard_check_pressed(global.last_command)
        spawn_key = keyboard_check_pressed(global.spawn_key)
        spawn_gerome = keyboard_check_pressed(global.spawn_gerome)
        show_collisions = keyboard_check_pressed(global.show_collisions)
        spawn_shotgun = keyboard_check_pressed(global.spawn_shotgun)
        spawn_satan = keyboard_check_pressed(global.spawn_satan)
        slot1 = keyboard_check_pressed(global.slot1)
        slot2 = keyboard_check_pressed(global.slot2)
        slot3 = keyboard_check_pressed(global.slot3)
        slot4 = keyboard_check_pressed(global.slot4)
        slot5 = keyboard_check_pressed(global.slot5)
        slot6 = keyboard_check_pressed(global.slot6)
        slot7 = keyboard_check_pressed(global.slot7)
        slot8 = keyboard_check_pressed(global.slot8)
        slot9 = keyboard_check_pressed(global.slot9)
        slot0 = keyboard_check_pressed(global.slot0)
        savestate = keyboard_check(global.savestate)
        mach4 = keyboard_check_pressed(global.mach4)
        pause = keyboard_check_pressed(global.key_pause)
        unpause = keyboard_check_pressed(global.key_unpause)
    }
    debug = keyboard_check_pressed(global.debug)
}

//Set globals to key values from ini
function scr_initpracticeinput(argument0) //gml_Script_scr_initpracticeinput
{
    test = 1
    if (argument0 == undefined)
        argument0 = 1
    if argument0
        ini_open("practicemod.ini")
	global.reload_room = ini_read_string("DebugKeys", "reloadroom", 112)
	global.last_room = ini_read_string("DebugKeys", "lastroom", 114)
	global.change_taunt = ini_read_string("DebugKeys", "changetaunt", 123)
	global.pause_spam = ini_read_string("DebugKeys", "pausespam", 86)
	
    global.show_stats = ini_read_string("DebugKeys", "showstats", 113)
    global.noclip = ini_read_string("DebugKeys", "noclip", 115)
    global.debug = ini_read_string("DebugKeys", "debug", 116)
    global.last_command = ini_read_string("DebugKeys", "lastcommand", 117)
    global.spawn_key = ini_read_string("DebugKeys", "givekey", 118)
    global.spawn_gerome = ini_read_string("DebugKeys", "givegerome", 119)
    global.show_collisions = ini_read_string("DebugKeys", "showcollision", 120)
    global.spawn_shotgun = ini_read_string("DebugKeys", "giveshotgun", 121)
    global.spawn_satan = ini_read_string("DebugKeys", "givesatan", 122)
    global.slot1 = ini_read_string("DebugKeys", "slot1", 49)
    global.slot2 = ini_read_string("DebugKeys", "slot2", 50)
    global.slot3 = ini_read_string("DebugKeys", "slot3", 51)
    global.slot4 = ini_read_string("DebugKeys", "slot4", 52)
    global.slot5 = ini_read_string("DebugKeys", "slot5", 53)
    global.slot6 = ini_read_string("DebugKeys", "slot6", 54)
    global.slot7 = ini_read_string("DebugKeys", "slot7", 55)
    global.slot8 = ini_read_string("DebugKeys", "slot8", 56)
    global.slot9 = ini_read_string("DebugKeys", "slot9", 57)
    global.slot0 = ini_read_string("DebugKeys", "slot0", 48)
    global.savestate = ini_read_string("DebugKeys", "savestate", 16)
    global.mach4 = ini_read_string("DebugKeys", "mach4", 192)
    global.key_pause = ini_read_string("DebugKeys", "pause", 45)
    global.key_unpause = ini_read_string("DebugKeys", "unpause", 46)
    if argument0
        ini_close()
}

