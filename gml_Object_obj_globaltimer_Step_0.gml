if (room != Endingroom && room != Creditsroom && room != Johnresurrectionroom && room != rank_room && (!instance_exists(obj_endlevelfade)) && room != hub_loadingscreen && room != Finalintro)
{
    global.file_seconds += s
    if (global.file_seconds >= 60)
    {
        global.file_seconds = 0
        global.file_minutes++
    }
    global.level_seconds += s
    if (global.level_seconds >= 60)
    {
        global.level_seconds = 0
        global.level_minutes++
    }
    global.tower_seconds += s
    if (global.tower_seconds >= 60)
    {
        global.tower_seconds = 0
        global.tower_minutes++
    }
    global.room_frames++
}
