//this script is called in the obj_fadeout alarm
//there's no better alternative since the room loading function in utils is uneditable even through the bytecode
//store the previous room
savestates[11] = savestates[10]
//save the start of the current room
saveslot = 10
createsavestate()
