var rm = roomtorestart
//resets the tower timer when resetting in a hub level
if (global.levelName == global.hubLevel)
{
    global.tower_seconds = 0
    global.tower_minutes = 0
}
scr_pause_stop_sounds()
global.levelattempts++
ds_list_clear(global.saveroom)
ds_list_clear(global.baddieroom)
ds_list_clear(global.debris_list)
ds_list_clear(global.collect_list)
alarm[4] = 1
obj_music.music = -4
instance_destroy(obj_fadeout)
global.levelreset = 0
scr_playerreset()
global.levelreset = 1
//custom restart function for editor mode
if global.editingLevel
{
    global.triggerdebug = 1
    obj_player1.targetDoor = "A"
    var fName = ((((mod_folder("levels/") + global.editorLevelName) + "/rooms/") + global.editorRoomName) + ".json")
    if (!file_exists(fName))
        show_error((("room " + fName) + " doesn't exist."), 0)
    var jText = file_text_read_all(fName)
    global.roomData = json_parse(jText)
    global.roomData = gml_Script_data_compatibility(global.roomData)
    gml_Script_prepareCustomLevel(global.roomData, global.editorRoomName)
}
else
{
    obj_player1.targetRoom = rm
    obj_player2.targetRoom = rm
    if (!is_string(rm))
        scr_room_goto(rm)
    else
    {
        customSong_destroy_all()
        gml_Script_loadCustomLevel(global.levelName)
    }
    var _d = "A"
    if (rm == 659)
        _d = "B"
    obj_player1.targetDoor = _d
    obj_player1.restartbuffer = 15
    obj_player2.restartbuffer = 15
    if instance_exists(obj_player2)
        obj_player2.targetDoor = _d
    if (rm == 659 || rm == 515 || rm == 513 || rm == 783 || rm == 514)
        global.bossintro = 1
}