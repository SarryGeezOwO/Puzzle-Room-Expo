draw_set_colour(c_black)
draw_set_alpha(0.8)
draw_rectangle(0, 0, room_width, room_height, false)

function draw_str(text, order) {
	draw_text(cx, cy + (order*offset), text)
}

function boolStr(value) {
	return (value) ? "On" : "Off"
}

draw_set_font(f_big)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if (!global.settingsOpen) {
	// Menu
	var lineOff = cy + ((selectedIndex+1) * offset)
	draw_set_alpha(0.6)
	draw_set_colour(c_black)
	draw_rectangle(cx-125, lineOff-25, cx+125, lineOff+25, false)
	draw_set_alpha(1)
	
	draw_set_colour(c_white)
	draw_str("Resume", 1)
	draw_str("Settings", 2)
	draw_str("Exit", 3)	
}
else {
	// Settings
	var lineOff = cy + ((selectedIndex+1) * offset)
	var selectWidth = (selectedIndex >= 2) ? 100 : 370
	draw_set_alpha(0.6)
	draw_set_colour(c_black)
	draw_rectangle(cx-selectWidth, lineOff-25, cx+selectWidth, lineOff+25, false)
	draw_set_alpha(1)
	
	draw_set_colour(c_white)
	draw_str("Audio                          "+boolStr(!tempAudio), 1)
	draw_str("Fullscreen                     "+boolStr(tempFullscreen), 2)
	draw_str("Apply", 3)
	draw_str("Cancel", 4)
}

// Reset
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(f_default)
draw_set_alpha(1)
draw_set_colour(c_white)