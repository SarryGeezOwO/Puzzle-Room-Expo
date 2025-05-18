draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(f_MainMenu)
draw_set_colour(c_white)
draw_text(cx, (cy + 115) - offset, tooltip)

function draw_str(text, order) {
	draw_text(cx, cy + (order*GUIOffset) - 100, text)
}

function drawHTP(index) {
	var n = oGameManager.getHTPName(index)
	var t = (global.htpSelected == index) ? ">> " + n : n
	draw_text(htpTextOffset, 120 + ((index+1) * 32), t)
}

function boolStr(value) {
	return (value) ? " On" : "Off"
}

draw_set_colour(c_black)
if (isSettingOpen || isHTPOpen) {
	draw_set_alpha(0.7)
	draw_rectangle(0, 0, room_width, room_height, false)	
	draw_set_alpha(1)
}

if (isHTPOpen) {
	// How to play
	draw_sprite(global.htpImages[global.htpSelected], htpCurrentFrame, cx+160, (cy+20) + offset)
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
else if (isSettingOpen) {
	// Settings
	draw_set_colour(bgColor)
	draw_roundrect_ext(cx-410, cy-200, cx+410, cy+200, 10, 10, false)
	var offCX = cx + 20
	var offCY = cy + 20
	
	draw_set_colour(c_white)
	draw_text(cx, 260, "Settings")
	var lineOff = cy + ((selectedIndex+1) * GUIOffset) - 100
	var selectWidth = (selectedIndex >= 2) ? 100 : 370
	draw_set_colour(selectCol)
	draw_roundrect_ext(cx-selectWidth, lineOff-25, cx+selectWidth, lineOff+25, 10, 10, false)
	
	draw_set_colour(c_white)
	draw_str("Audio                          "+boolStr(!tempAudioMute), 1)
	draw_str("Fullscreen                     "+boolStr(tempFullscreen), 2)
	draw_str("Apply", 3)
	draw_str("Cancel", 4)
}

// Draw Controls 
draw_set_halign(fa_left)
draw_set_font(f_small)
var botm = room_height - 25
var tto = 40
var isPS = oGameManager.hasController

draw_tooltip_control(38, botm-(tto*3), 80, isPS, CTR_W_UP, "Up")
draw_tooltip_control(38, botm-(tto*2), 80, isPS, CTR_S_DOWN, "Down")
draw_tooltip_control(38, botm-(tto),   80, isPS, CTR_A_LEFT, "Left")
draw_tooltip_control(38, botm,         80, isPS, CTR_D_RIGHT, "Right")
draw_tooltip_control(156,botm,        100, isPS, CTR_SPACE_CROSS, "Confirm")

draw_set_font(f_default)
draw_set_valign(fa_top)

draw_set_font(f_default)
draw_set_valign(fa_top)
