var cx = ROOM_WIDTH/2
var cy = ROOM_HEIGHT/2


if (isGameOver) {
	draw_set_colour(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0, 0, ROOM_WIDTH, ROOM_HEIGHT, false)

	draw_set_alpha(1)

	draw_set_colour(make_colour_rgb(255, 207, 181)) 
	draw_rectangle(cx-150, cy-225, cx+150, cy+225, false) // BG

	draw_set_colour(make_colour_rgb(242, 47, 44)) 
	draw_rectangle(cx-150, cy-225, cx+150, cy-175, false)

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(f_big)
	draw_set_colour(c_black) 
	draw_text(cx, cy-195, "GAME END")
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(f_default)
draw_set_colour(c_white)
