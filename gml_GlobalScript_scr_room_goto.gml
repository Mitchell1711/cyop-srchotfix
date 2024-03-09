function scr_room_goto(argument0) //gml_Script_scr_room_goto
{
    room_goto(argument0)
}

/*new function that simply loads a custom room, means i can execute code without needing to mess with the utils script
since utils breaks even when editing the bytecode
all instances of gml_Script_prepareCustomLevel have been replaced with this function
I figured I'd put it in here since it's the most fitting script
this was supposed to make it so all forms of room loading would create a savestate (starting play mode, loading a savestate, etc.)
but it only works on the fadeout for some reason*/
function load_customlevel(argument0, argument1) //gml_Script_load_customlevel
{
    gml_Script_prepareCustomLevel(argument0, argument1)
    if(global.editingLevel){
        with (obj_editorpractice){
            alarm[1] = 3
        }
    }
}
