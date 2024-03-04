var save = savestates[saveslot]
//load saved variables for custom objects now that 3 frames have passed
loadstatevariables(save[0])
loadstatevariables(save[1])
//persistent objects need to be destroyed if they weren't saved
with(all){
    if(persistent && 
    (!variable_instance_exists(id, "dontdestroyonload") || variable_instance_get(id, "dontdestroyonload") == 0)){
        instance_destroy()
    }
}
if(saveslot < 10)
    create_transformation_tip("Loaded slot "+string(saveslot))
doingstatestuff = false