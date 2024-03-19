//creates a new menu button
//argument0 = x, argument1 = y, argument2 = size, argument3 = sprite, argument4 = current clickstate
//returns the clickstate of the button
function src_createButton(argument0, argument1, argument2, argument3, argument4) //gml_Script_src_createbutton
{
    var a = 1
    var selected = 0
    var clr = c_silver
    var mouseX = device_mouse_x_to_gui(0)
    var mouseY = device_mouse_y_to_gui(0)
    if point_in_rectangle(mouseX, mouseY, argument0, argument1, (argument0 + argument2), (argument1 + argument2))
    {
        hover_custombutton = 1
        clr = c_white
        if mouse_check_button_pressed(mb_left)
            argument4 = (!argument4)
    }
    if keyboard_check(vk_space)
    {
        a = 0.15
        hover_custombutton = 0
    }
    draw_set_colour(c_black)
    draw_set_alpha((0.5 * a))
    draw_rectangle((argument0 - 1), (argument1 - 1), ((argument0 + argument2) + 1), ((argument1 + argument2) + 1), false)
    draw_set_alpha(a)
    draw_set_color(c_white)
    draw_sprite_ext(argument3, 0, argument0, argument1, 2, 2, 0, c_silver, a)
    draw_sprite_ext(argument3, 1, argument0, argument1, 2, 2, 0, clr, a)
    return argument4;
}

//creates a new dropdown list
//argument0 = x, argument1 = y, argument2 = string list, argument3 = whether the option is selected
//returns the menu option that was clicked
function src_createList(argument0, argument1, argument2, argument3) //gml_Script_src_createlist
{
    var selected = noone
    var char_height = ((string_height("A") * 2) + 2)
    var rect_width = 0
    var str_width = 0
    var mouseX = device_mouse_x_to_gui(0)
    var mouseY = device_mouse_y_to_gui(0)
    for (var i = 0; i < array_length(argument2); i++)
    {
        str_width = ((string_width(argument2[i]) * 2) + 2)
        if (rect_width < str_width)
            rect_width = str_width
    }
    draw_set_colour(c_black)
    draw_set_alpha(0.5)
    draw_rectangle((argument0 - 1), (argument1 + 1), (argument0 + rect_width), ((char_height * array_length(argument2)) + argument1), false)
    if point_in_rectangle(mouseX, mouseY, (argument0 - 1), (argument1 + 1), (argument0 + rect_width), ((char_height * array_length(argument2)) + argument1))
        hover_custombutton = 1
    draw_set_alpha(1)
    var textY = 0
    for (i = 0; i < array_length(argument2); i++)
    {
        draw_set_color(c_silver)
        if (argument3 != -4)
        {
            if argument3[i]
                draw_set_color(c_yellow)
        }
        textY = ((argument1 + 4) + (char_height * i))
        if point_in_rectangle(mouseX, mouseY, argument0, textY, (argument0 + rect_width), ((textY + char_height) - 2))
        {
            draw_set_color(c_white)
            if mouse_check_button_pressed(mb_left)
                selected = i
        }
        draw_text_transformed(argument0, textY, argument2[i], 2, 2, 0)
    }
    return selected;
}

//choose what to do when an option is clicked
function src_selectDebugOption(argument0) //gml_Script_src_selectdebugoption
{
    if (argument0 != -4)
    {
        switch argument0
        {
            case 0:
                global.doPanic = (!global.doPanic)
                break
            case 1:
                global.showcollisions = (!global.showcollisions)
                global.updateshowcollisions = global.showcollisions
                break
            case 2:
                global.editorpause = (!global.editorpause)
                break
            case 3:
                global.setSupertaunt = (!global.setSupertaunt)
                break
            case 4:
                global.setspeed = get_integer("Set the player's speed", global.setspeed)
                if (global.setspeed == undefined)
                    global.setspeed = 0
                break
            case 5:
                select_savestate = (!select_savestate)
                select_playerstate = false
                mouseposX = device_mouse_x_to_gui(0)
                mouseposY = device_mouse_y_to_gui(0)
                break
            case 6:
                select_playerstate = (!select_playerstate)
                select_savestate = false
                mouseposX = device_mouse_x_to_gui(0)
                mouseposY = device_mouse_y_to_gui(0)
                break
            case 7:
                switchAssetFolder(global.modFolder, true)
                room_goto(rmEditor)
                break
            default:

        }

    }
}

//overall code for building the debugbutton
function src_debugButton() //gml_Script_src_debugbutton
{
    //initialize button
    var bttnx = 820
    var bttny = 20
    var bttnsize = 96
    var clickprior = false
    //create the button itself
    select_debug = src_createButton(bttnx, bttny, bttnsize, 4198, select_debug)
    //if button is active create the dropdown menu
    if select_debug
    {
        options = ["Enable Pizza Time", 
        "Show Collisions", 
        "Enable Editor Pause and Rank", 
        "Give Supertaunt", 
        "Set Player Speed",
        "Open Savestate",
        "Set Player State",
        "Reload Asset Folder"]
        var optioncolors = [global.doPanic, global.showcollisions, global.editorpause, global.setSupertaunt, 0, 0]
        //create the dropdown menu and pass on which option was selected
        var selected = src_createList(bttnx, (bttny + bttnsize), options, optioncolors)
        //select playerstate is set to true when the set player transformation option is selected
        if select_playerstate
        {
            //create transformation dropdown
            var options = ["Normal", 
            "Knight", 
            "Ball", 
            "Firemouth", 
            "Ghost", 
            "Mort", 
            "Weenie Mount", 
            "Revolver", 
            "Barrel", 
            "Gustavo and Brick", 
            "Gustavo", 
            "Rocket", 
            "Olive Bubble", 
            "Cheeseball", 
            "Sticky Cheese", 
            "Boxed", 
            "Pepper Pizza", 
            "Shotgun", 
            "Clown"]
            var transformationcolors = []
            for (var i = 0; i < array_length(options); i++)
                array_push(transformationcolors, options[i] == global.editortransformation)
            var selectedstate = src_createList(mouseposX, mouseposY, options, transformationcolors)
            //update transformation selection if an option got clicked
            if (selectedstate != noone){
                clickprior = true
                global.editortransformation = options[selectedstate]
            }
                
        }
        //create saveslot dropdown
        //this copy pasting amd sub menu handling is dogshit I should rework this later
        if(select_savestate){
            options = ["None",
            "Slot 1",
            "Slot 2",
            "Slot 3",
            "Slot 4",
            "Slot 5",
            "Slot 6",
            "Slot 7",
            "Slot 8",
            "Slot 9",
            "Slot 0"]
            var saveslotcolors = []
            for (var i = 0; i < array_length(options); i++)
                array_push(saveslotcolors, options[i] == global.opensaveslot)
            var selectedsave = src_createList(mouseposX, mouseposY, options, saveslotcolors)
            if(selectedsave != noone){
                clickprior = true
                global.opensaveslot = options[selectedsave]
            }
        }
        //the selected var gets overwritten when another dropdown menu option is clicked, this way i avoid overlap
        if(!clickprior)
            src_selectDebugOption(selected)
    }
    //deselect the transformation selection as well if the debug button is deselected
    else{
        select_playerstate = 0
        select_savestate = 0
    }
}