var save = savestates[saveslot]
//load saved variables for custom objects now that 3 frames have passed
loadstatevariables(save[0])
loadstatevariables(save[1])
if(saveslot < 10)
    create_transformation_tip("Loaded slot "+string(saveslot))