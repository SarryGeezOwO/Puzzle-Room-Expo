draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(f_big)
depth = -10

var cx = getCamX() + (ROOM_WIDTH / 2)
var cy = getCamY()

draw_set_font(f_big)
draw_set_color(c_black)

if (!isMainMenu) {
	draw_text(cx, cy + 20, string(global.gameTime))
}

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

function draw_nth(text, order) {
	var cx = getCamX()
	var cy = getCamY()
	if (room == r_Overworld) {
		draw_text(cx + 20, cy + (21 * order), text)		
	}
}

// Draw Tasks
draw_set_font(f_small)
draw_nth("Fragments Collected: " + string(global.fragmentsCollected), 1);
draw_nth("GameManagers UUID" + string(global.gameManagerUUID), 2)
draw_nth("Task 2: Lorem lipsum sample", 3)
draw_set_font(f_default)
draw_set_color(c_white)