var save = savestates[saveslot]
//load saved variables for custom objects now that 3 frames have passed
loadstatevariables(save[0])
loadstatevariables(save[1])
//persistent objects need to be destroyed if they weren't saved
with(all){
    if (persistent && object_index != obj_editorpractice && object_index != obj_music 
        && object_index != obj_customAudio && object_index != obj_levelLoader 
        && object_index != obj_customBG && object_index != obj_tilemapDrawer && object_index != obj_modAssets){
        if(!variable_instance_exists(id, "dontdestroyonload") || variable_instance_get(id, "dontdestroyonload") == 0){
            instance_destroy()
        }
    }
}
global.spaceblockswitch = spaceblockstate
if(saveslot < 10)
    create_transformation_tip("Loaded slot "+string(saveslot))
doingstatestuff = false