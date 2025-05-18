draw_set_colour(bgColor)
draw_rectangle(0, 0, room_width, room_height, false)

function draw_str(text, order) {
	draw_text(cx, cy + (order*offset), text)
}

function drawHTP(index) {
	var n = oGameManager.getHTPName(index)
	var t = (global.htpSelected == index) ? ">> " + n : n
	draw_text(htpTextOffset, 120 + ((index+1) * 32), t)
}

function boolStr(value) {
	return (value) ? " On" : "Off"
}

draw_set_font(f_big)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// Header text
draw_set_colour(c_white)
var headText = ""
if (global.htpOpened) headText = "How To Play LOL"
else if(global.settingsOpen) headText = "Settings"
else headText = "Game Paused"

if (global.htpOpened) {
	// How to play
	draw_sprite(
		global.htpImages[global.htpSelected], htpCurrentFrame, cx+150, (cy+80) + sin(htpTime) * 7)
	if (htpFrameTimer >= 3) {
		htpCurrentFrame++
		htpFrameTimer = 0
	}else htpFrameTimer++
	
	var diff = (selectedIndex == htpCount) ? 34 : 32
	var lineOff = 120 + ((selectedIndex+1) * diff)
	draw_set_colour(selectCol)
	draw_roundrect_ext(htpTextOffset-20, lineOff-15, htpTextMax, lineOff+15, 10, 10, false)
	
	// list of HTPS in order
	draw_set_halign(fa_left)
	draw_set_font(f_HTP)
	draw_set_colour(c_white)
	for(var i = 0; i < htpCount; i++) {
		drawHTP(i)
	}
	var h = 120 + ((htpCount+1) * 34)
	draw_line(htpTextOffset, h-20, htpTextMax, h-20)
	draw_text(htpTextOffset, h, "Return")
}
else if (!global.settingsOpen) {
	// Menu
	draw_text(cx, 130, "-- " + headText + " --")
	var lineOff = cy + ((selectedIndex+1) * offset)
	draw_set_colour(selectCol)
	draw_roundrect_ext(cx-125, lineOff-25, cx+125, lineOff+25, 10, 10, false)
	
	draw_set_colour(c_white)
	draw_str("Resume", 1)
	draw_str("How to Play", 2)
	draw_str("Settings", 3)
	draw_str("Exit", 4)	
}
else {
	// Settings
	draw_text(cx, 130, "-- " + headText + " --")
	var lineOff = cy + ((selectedIndex+1) * offset)
	var selectWidth = (selectedIndex >= 2) ? 100 : 370
	draw_set_colour(selectCol)
	draw_roundrect_ext(cx-selectWidth, lineOff-25, cx+selectWidth, lineOff+25, 10, 10, false)
	
	draw_set_colour(c_white)
	draw_str("Audio                          "+boolStr(!tempAudioMute), 1)
	draw_str("Fullscreen                     "+boolStr(tempFullscreen), 2)
	draw_str("Apply", 3)
	draw_str("Cancel", 4)
}

// Reset
// Draw Controls 
draw_set_halign(fa_left)
draw_set_font(f_small)
var botm = ROOM_HEIGHT - 25
var tto = 40
var isPS = oGameManager.hasController

draw_tooltip_control(38, botm-(tto*3), 80, isPS, CTR_W_UP, "Up")
draw_tooltip_control(38, botm-(tto*2), 80, isPS, CTR_S_DOWN, "Down")
draw_tooltip_control(38, botm-(tto),   80, isPS, CTR_A_LEFT, "Left")
draw_tooltip_control(38, botm,         80, isPS, CTR_D_RIGHT, "Right")
draw_tooltip_control(156,botm,        100, isPS, CTR_SPACE_CROSS, "Confirm")

draw_set_font(f_default)
draw_set_valign(fa_top)
draw_set_colour(c_white)
draw_set_alpha(1)