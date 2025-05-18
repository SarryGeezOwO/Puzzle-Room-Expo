if (global.isDebugMode) {
	draw_set_color(c_black)
	var offset = room_width - 170

	draw_line(offset + 100, 50, offset + 100, 150)
	draw_line(offset + 50, 100, offset + 150, 100)

	draw_circle(offset + 100, 100, 50, true)
	draw_circle(offset + 100 + (input[0] * 50), 100 + (input[1] * 50), 20, false)

	draw_set_color(c_white)	
}

draw_set_font(f_small)
draw_set_valign(fa_middle)
draw_tooltip_control(
	38, room_height-25, 100, oGameManager.hasController, CTR_ESC_OPTIONS, "Pause")

draw_set_font(f_default)
draw_set_valign(fa_top)
