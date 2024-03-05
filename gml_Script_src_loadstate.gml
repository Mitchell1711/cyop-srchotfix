function loadstate() //gml_Script_loadstate
{
    //retrieve globals first, important since I want to update the roomdata and currentroom to what it was during saving so I can load the right one
    var save = savestates[saveslot]
    if(array_length(save) == 0){
        if(saveslot < 10)
            create_transformation_tip("Failed to load slot "+string(saveslot))
        else
            create_transformation_tip("Failed to load room state")
        break
    }
    doingstatestuff = true
    for (var i = 0; i < array_length(save[2]); i++)
    {
        
        var glob = save[2][i]
        //this is kinda weird? it works but i might need to look at it again later
        //the if statement is supposed to check if the variable is a list or not, but putting the below code in an else caused it to not be assigned
        variable_global_set(glob[0], glob[1])
        if (array_length(glob) > 2)
        {
            ds_list_clear(glob[1])
            //if the array is a room convert the string object references back to the correct object ids
            if (glob[1] == variable_global_get("baddieroom") || 
            glob[1] == variable_global_get("escaperoom") || 
            glob[1] == variable_global_get("saveroom")){
                for (var j = 0; j < array_length(glob[2]); j++){
                    ds_list_add(glob[1], struct_get(global.instanceManager, glob[2][j]))
                }
            }
            else{
                for (var j = 0; j < array_length(glob[2]); j++)
                    ds_list_add(glob[1], glob[2][j])
            }
        }
    }
    //(re)load the room with the reverted roomdata/currentroom
    load_customlevel(global.roomData, global.currentRoom)
    //3 frame delay for loading objects because cyop is slow, needs 2 frames to instantiate the objects and 1 frame to instantiate hitboxes
    alarm[0] = 3
}

//called in this script and alarm[0]
function loadstatevariables(argument0) //gml_Script_loadstatevariables
{
    //go over all saved objects
    for (var i = 0; i < array_length(argument0); i++)
    {
        var obj = argument0[i]
        var obj_id = obj[0]
        //if object id is a string it means its a custom object from the json, I need to convert this string back to an object id by looking it up in the instancemanager
        if is_string(obj_id)
            obj_id = struct_get(global.instanceManager, obj_id)
        //spawn in missing objects, duplicates are prevented by only instantiating when the amount of loaded instances is lower
        if(!instance_exists(obj_id) && instance_number(obj[1]) < obj[13]){
            obj_id = instance_create(obj[2], obj[3], obj[1])
        }
        //assign all saved variables to the object
        if(instance_exists(obj_id)){
            with (obj_id)
            {
                x = obj[2]
                y = obj[3]
                image_speed = obj[4]
                image_index = obj[5]
                //cyop objects can have their sprites changed to a custom one from the mod folder
                //this causes issues specifically when trying to load another level from the same tower
                if sprite_exists(obj[6])
                    sprite_index = obj[6]
                image_xscale = obj[9]
                image_yscale = obj[10]
                image_angle = obj[11]
                direction = obj[12]
                for (var j = 0; j < array_length(obj[7]); j++){
                    //don't replace the oneway block solid instance ref since it gets remade on load
                    if(obj[7][j][0] != "solid_inst"){
                        variable_instance_set(id, obj[7][j][0], obj[7][j][1])
                    }
                }
                for (j = 0; j < array_length(obj[8]); j++)
                    alarm[j] = obj[8][j]
            }
        }
    }
}

