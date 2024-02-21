//new global variables to initialize, I'm not putting the entire script here it's literally just initializing
global.triggerdebug = 0
global.doPanic = 0
global.showcollisions = 0
global.editorpause = 0
global.setSupertaunt = 0
global.editortransformation = "Normal"
global.setspeed = 0
//instantiate the editorpractice object, I should move this somewhere else though
if (object_index == obj_player1)
    instance_create(x, y, obj_editorpractice)