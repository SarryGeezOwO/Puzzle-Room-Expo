draw_set_font(f_big)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_black)

var c_x = room_width/2
var c_y = room_height/2

draw_sprite(
	getHTP_Room(ds_map_find_value(global.minigames, oGameManager.room_to_load))
	, 0, c_x, c_y-60
)

var offset = 260
if (prog >= 1.2) {
	draw_text(c_x-110, c_y+offset+60, "Press")
	draw_controls(c_x-40, c_y+offset+60, oGameManager.hasController, CTR_F_CIRCLE)
	draw_text(c_x+85, c_y+offset+60, "to Continue.")
}
draw_text(c_x, c_y+offset-40, "-- LOADING --")

// loading Bar
draw_rectangle(
	 c_x - 200,							(c_y + offset)-15,
	(c_x - 200)+lerp(0, 1, d_prog) * 400, (c_y + offset)+15,
	false
)

draw_set_alpha(0.3)
draw_rectangle(
	c_x - 200,	 (c_y + offset)-15,
	c_x + 200,	 (c_y + offset)+15,
	false
)


draw_set_alpha(1)
draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)