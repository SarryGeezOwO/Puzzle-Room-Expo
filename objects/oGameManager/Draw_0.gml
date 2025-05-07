draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(f_big)

var cx = room_width / 2

draw_set_font(f_big)
draw_text(cx, 20, string(global.gameTime))

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(10, 10, "Interact Map: " + string(ds_map_find_value(global.interactableMap, 1)))