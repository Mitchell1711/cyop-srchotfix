//this piece of code should be around line 112, replacing the same if block
if (global.fromEditor || global.fromMenu)
{
    with (obj_player)
    {
        //reset player position so it doesn't get stuck OOB (also known as the pink screen of death)
        x = 0
        y = 0
        if global.fromEditor
            backtohubroom = rmEditor
        targetDoor = "A"
        if instance_exists(obj_exitgate)
            state = states.comingoutdoor
        else
            state = states.normal
    }
    //reset tower timer when loading a level
    global.tower_seconds = 0
    global.tower_minutes = 0
    global.fromHub = 1
    global.fromEditor = 0
    global.fromMenu = 0
}