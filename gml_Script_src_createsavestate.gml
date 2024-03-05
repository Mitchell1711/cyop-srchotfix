function createsavestate() //gml_Script_createsavestate
{
    doingstatestuff = true
    savedmodfolder = global.modFolder
    //standard objects (ones that persist through the custom level scene) and custom objects (objects loaded from the room json) are seperated for convenience
    var objects = []
    var customobjects = []
    //instancemanager keeps track of the IDs of custom objects
    var instmanagernames = variable_struct_get_names(global.instanceManager)
    var instmanagerids = []
    for (var i = 0; i < array_length(instmanagernames); i++)
        array_push(instmanagerids, struct_get(global.instanceManager, instmanagernames[i]))
    with (all)
    {
        dontdestroyonload = true
        if (object_index != obj_editorpractice || object_index != obj_music || object_index != obj_customAudio)
        {
            //retrieve the current state of all variables attached to loaded objects
            var varnames = variable_instance_get_names(id)
            var variables = array_create(array_length(varnames))
            for (i = 0; i < array_length(varnames); i++)
                variables[i] = [varnames[i], variable_instance_get(id, varnames[i])]
            //retrieve alarms as well
            var alarms = array_create(12)
            for (i = 0; i < array_length(alarms); i++)
                alarms[i] = alarm[i]
            //differentiate between standard and custom objects
            var obj_id = id
            for (i = 0; i < array_length(instmanagernames); i++)
            {
                if (id == instmanagerids[i])
                    obj_id = instmanagernames[i]
            }
            //push all objects variables to their respective arrays
            var objectinfo = [obj_id, 
            object_index, 
            x, 
            y, 
            image_speed, 
            image_index, 
            sprite_index, 
            variables, 
            alarms, 
            image_xscale, 
            image_yscale,
            image_angle,
            direction,
            instance_number(object_index)]
            if is_string(obj_id)
                array_push(customobjects, objectinfo)
            else
                array_push(objects, objectinfo)
        }
    }
    //get all globals, saveroom, baddieroom and escaperoom need to be tracked seperately as I want to modify them again after load
    varnames = variable_instance_get_names(-5)
    var globals = []
    for (i = 0; i < array_length(varnames); i++)
    {
        if (varnames[i] != "paused" || varnames[i] != "instanceManager")
        {
            var value = variable_global_get(varnames[i])
            //global ds lists needs to have their contents dumped into an array
            if (is_real(value) && ds_exists(value, 2))
            {
                var ds = []
                //fill the room arrays with the custom object ids
                //using variable global get because directly comparing the string to varnames[i] randomly doesnt work
                if (value == variable_global_get("baddieroom") 
                || value == variable_global_get("escaperoom") 
                || value == variable_global_get("saveroom")){
                    for(var j = 0; j < ds_list_size(value); j++)
                    {
                        var objectroomid = ds_list_find_value(value, j)
                        for(var k = 0; k < array_length(instmanagernames); k++)
                        {
                            if(objectroomid == instmanagerids[k])
                            {
                                array_push(ds, instmanagernames[k])
                            }
                        }
                    }
                }
                else{
                    for (var j = 0; j < ds_list_size(value); j++)
                        array_push(ds, ds_list_find_value(value, j))
                }
                array_push(globals, [varnames[i], value, ds, 2])
            }
            //if the variable is not a list just write it normally
            else
                array_push(globals, [varnames[i], value])
        }
    }
    savestates[saveslot] = [objects, customobjects, globals]
    if(saveslot < 10)
        create_transformation_tip("Saved state to slot "+string(saveslot))
    doingstatestuff = false
}
