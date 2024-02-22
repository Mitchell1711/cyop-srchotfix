//new debug button stuff coded from scratch because Perez' canvas is impossible to edit with UTMT constantly breaking
//starts from line 328, under the for loop for the canvas
hover_custombutton = 0
src_debugButton()
var cpos = gml_Script_cursor_hud_position()
cursorX = (cpos[0] * w_scale)
cursorY = (cpos[1] * w_scale)
draw_sprite_ext(_spr("cursor"), cursorImage, cursorX, cursorY, 2, 2, 0, c_white, 1)
draw_set_alpha(0.7)
draw_text_transformed(cursorX, (cursorY + 24), cursorNotice, 2, 2, 0)
draw_set_alpha(1)
cursorNotice = ""