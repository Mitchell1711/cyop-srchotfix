//fairly simple adjustment to the playroom function to also trigger the debug stuff
function playRoom() //gml_Script_playRoom
{
    saveData()
    gml_Script_levelMemory_reset()
    gml_Script_instanceManager_reset()
    global.fromEditor = 1
    global.triggerdebug = 1
    gml_Script_prepareCustomLevel(data, lvlRoom)
}