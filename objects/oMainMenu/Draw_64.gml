draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(f_MainMenu)
draw_set_colour(c_white)

var cx = room_width / 2
var cy = room_height / 2
draw_text(cx, (cy + 115) - offset, tooltip)

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
