function loadstate() //gml_Script_loadstate
{
    //retrieve globals first, important since I want to update the roomdata and currentroom to what it was during saving so I can load the right one
    var save = global.savestates[saveslot]
    for (var i = 0; i < array_length(save[2]); i++)
    {
        
        var glob = save[2][i]
        //this is kinda weird? it works but i might need to look at it again later
        //the if statement is supposed to check if the variable is a list or not, but putting the below code in an else caused it to not be assigned
        variable_global_set(glob[0], glob[1])
        if (array_length(glob) > 2)
        {
            ds_list_clear(glob[1])
            for (var j = 0; j < array_length(glob[2]); j++)
                ds_list_add(glob[1], glob[2][j])
        }
    }
    //SEPERATE HANDLING FOR THE ROOMS AAAAAAAAAHHHHH I LOVE COPY PASTE
    //I would've put all these room lists in their own array but I can't seem to access arrays if they're nested to deep
    ds_list_clear(global.saveroom)
    for (i = 0; i < array_length(save[3]); i++)
        ds_list_add(global.saveroom, save[3][i])
    ds_list_clear(global.baddieroom)
    for (i = 0; i < array_length(save[4]); i++)
        ds_list_add(global.baddieroom, save[4][i])
    ds_list_clear(global.escaperoom)
    for (i = 0; i < array_length(save[5]); i++)
        ds_list_add(global.escaperoom, save[5][i])
    //(re)load the room with the reverted roomdata/currentroom
    gml_Script_prepareCustomLevel(global.roomData, global.currentRoom)
    //load saved variables for all standard objects
    loadstatevariables(save[0])
    create_transformation_tip("Loaded State")
    //3 frame delay for loading the cyop instantiated objects, needs 2 frames to instantiate the objects and 1 frame to instantiate hitboxes
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
        //instantiate a new object if the id isnt found idk if this actually works like it should though
        if (!instance_exists(obj_id))
            obj_id = instance_create(obj[2], obj[3], obj[1])
        //assign all saved variables to the object
        with (obj_id)
        {
            x = obj[2]
            y = obj[3]
            image_speed = obj[4]
            image_index = obj[5]
            sprite_index = obj[6]
            image_xscale = obj[9]
            image_yscale = obj[10]
            for (var j = 0; j < array_length(obj[7]); j++)
                variable_instance_set(id, obj[7][j][0], obj[7][j][1])
            for (j = 0; j < array_length(obj[8]); j++)
                alarm[j] = obj[8][j]
        }
    }
}

