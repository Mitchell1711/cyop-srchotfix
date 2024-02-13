//adds more stuff to showcollisions
if DEBUG
{
    with (obj_solid)
    {
        if (object_index == obj_solid || object_index == obj_secretbigblock || object_index == obj_secretblock || object_index == obj_secretmetalblock || object_index == obj_iceblock || object_index == obj_iceblock_breakable || object_index == obj_mach3solid)
            visible = (global.showcollisions || visible)
    }
    with (obj_slope)
    {
        if (object_index == obj_slope || object_index == obj_iceblockslope)
            visible = (global.showcollisions || visible)
    }
    with (obj_platform)
    {
        if (object_index == obj_platform)
            visible = (global.showcollisions || visible)
    }
    with (obj_ladder)
    {
        if (object_index == obj_ladder)
            visible = (global.showcollisions || visible)
    }
    with (obj_grindrail)
    {
        if (object_index == obj_grindrail)
            visible = (global.showcollisions || visible)
    }
    with (obj_grindrailslope)
    {
        if (object_index == obj_grindrailslope)
            visible = (global.showcollisions || visible)
    }
}

