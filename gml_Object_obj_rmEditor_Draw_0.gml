//Does essentially the same thing as rmEditor_Step_0 except it stops the drawing of object placing as well
//just replace the if statement at the top of the script with this
if ((!hover_custombutton) && w_isOnCanvas(w_openCanvas[0], (cursorX / 2), (cursorY / 2)))