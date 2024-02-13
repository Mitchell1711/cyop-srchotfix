//resets the tower timer when resetting in a hub level
//this if statement can be added to the top of the script
if (global.levelName == global.hubLevel)
{
    global.tower_seconds = 0
    global.tower_minutes = 0
}