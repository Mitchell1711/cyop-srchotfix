var save = global.savestates[saveslot]
//load saved variables for custom objects now that 3 frames have passed
loadstatevariables(save[1])
//update the rooms with their newly updated IDs
var rm = []
for (var i = 0; i < ds_list_size(global.saveroom); i++)
    array_push(rm, ds_list_find_value(global.saveroom, i))
global.savestates[saveslot][3] = rm
rm = []
for (i = 0; i < ds_list_size(global.baddieroom); i++)
    array_push(rm, ds_list_find_value(global.baddieroom, i))
global.savestates[saveslot][4] = rm
rm = []
for (i = 0; i < ds_list_size(global.escaperoom); i++)
    array_push(rm, ds_list_find_value(global.escaperoom, i))
global.savestates[saveslot][5] = rm
