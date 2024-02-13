if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
timer = get_milliseconds()
global.file_minutes = 0
global.file_seconds = 0
global.level_minutes = 0
global.level_seconds = 0
global.tower_minutes = 0
global.tower_seconds = 0
global.room_frames = 0
global.prev_room_frames = 0
depth = -600
s = 0.016666666666666666
Px = 0
Py = 0
Phsp = 0
Pvsp = 0
