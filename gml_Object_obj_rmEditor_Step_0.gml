//To prevent objects from being placed behind custom editorbuttons put this code at line 103
//Copying the entire script when this is the only change is just gonna be confusing so this will do
//Would be nice if there was git support or something
if ((!hover_custombutton) && w_isOnCanvas(w_openCanvas[0], (cursorX / w_scale), (cursorY / w_scale)))