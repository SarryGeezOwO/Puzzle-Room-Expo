draw_set_font(f_big)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_black)

var c_x = room_width/2
var c_y = room_height/2

draw_text(c_x, c_y, "-- LOADING --")
draw_text(c_x, c_y + 150, "Fun Fact!")

draw_set_font(f_default)
draw_text(c_x, c_y + 180, "There's no such thing as a fun fact bozo")

draw_rectangle(
	 c_x - 200,							(c_y + 40)-15,
	(c_x - 200)+lerp(0, 1, d_prog) * 400, (c_y + 40)+15,
	false
)

draw_set_alpha(0.3)
draw_rectangle(
	c_x - 200,	 (c_y + 40)-15,
	c_x + 200,	 (c_y + 40)+15,
	false
)


draw_set_alpha(1)
draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)