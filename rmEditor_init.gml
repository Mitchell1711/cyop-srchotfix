//set leveltorestart to something other than -4 otherwise the restart button is greyed out lol
//doesn't actually matter what the value is here since I handle that in the restart function im just playing it safe
global.leveltorestart = global.levelName
global.leveltosave = -4
instance_destroy(obj_pigtotal)
with (obj_player)
    state = states.titlescreen
