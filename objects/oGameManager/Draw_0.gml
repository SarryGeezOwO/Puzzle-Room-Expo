draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(f_big)
depth = -10

var cx = getCamX() + (ROOM_WIDTH / 2)
var cy = getCamY()
 
draw_set_font(f_big)
draw_set_color(c_black)

// Draw Global Time
if (!isMainMenu && !global.InsideMinigame && room == global.baseRoom) {
	var m = floor(global.gameTime / 60)
	var s = floor(global.gameTime % 60)	
	draw_text(cx, cy + 25, time_format(m, s))
	
	// Just below the game time honestly
	draw_set_font(f_HTP)
	draw_text(cx, cy + 60, "SCORE")
	draw_set_font(f_big)
	draw_text(cx, cy + 85, string(global.gameTrueScore))
}

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

function draw_nth(text, order) {
	var cx = getCamX()
	var cy = getCamY()
	if (room == global.baseRoom) {
		draw_text(cx + 20, cy + (21 * order), text)		
	}
}

// Draw Tasks
draw_set_font(f_small)
draw_set_font(f_default)
draw_set_color(c_white)