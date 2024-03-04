//only one is allowed to exist
if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
//initialize practiceinput
scr_init_input_practice()
scr_initpracticeinput()
savestates = array_create(12, [])
saveslot = 0
doingstatestuff = false
savedmodfolder = global.modFolder
//global variables to initialize for editor debug
global.triggerdebug = 0
global.doPanic = 0
global.showcollisions = 0
global.editorpause = 0
global.setSupertaunt = 0
global.editortransformation = "Normal"
global.setspeed = 0