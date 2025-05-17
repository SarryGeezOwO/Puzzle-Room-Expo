draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(f_big)

var cx = room_width / 2

draw_set_font(f_big)
draw_set_color(c_black)

draw_text(cx, 20, string(global.gameTime))

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(room_width- 180, 10, "Controller Detected " + string(devices))
function draw_nth(text, order) {
	if (room == r_Overworld) {
		draw_text(10, 19 * order, text)		
	}
}

// Draw Tasks
draw_nth("GameManagers" + string(global.managerCount), 1);
draw_nth("GameManagers UUID" + string(global.gameManagerUUID), 2)
draw_nth("Task 2: Lorem lipsum sample", 3)
draw_set_color(c_white)