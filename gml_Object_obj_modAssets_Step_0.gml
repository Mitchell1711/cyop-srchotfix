if (keyboard_check_pressed(vk_f6) && (global.editingLevel || keyboard_check(vk_control)))
{
    if (room != rmEditor)
    {
        gml_Script_levelMemory_reset()
        room_goto(rmEditor)
    }
}
//debug code by Perez, I'm not sure what this is for but it's hardcoded and in the way of savestate binds
/*if keyboard_check_pressed(vk_f3)
    convert_to_hexstring()*/
with (obj_player1)
{
    if (state != other.lpstate)
    {
    }
    other.lpstate = state
}