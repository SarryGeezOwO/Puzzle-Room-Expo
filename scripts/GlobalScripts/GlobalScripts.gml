// Keyboard, Controller
#macro CTR_SPACE_CROSS	0 
#macro CTR_F_CIRCLE		1
#macro CTR_E_SQUARE		2
#macro CTR_R_TRIANGLE	3
#macro CTR_ESC_OPTIONS	4
#macro CTR_A_LEFT		5
#macro CTR_S_DOWN		6
#macro CTR_D_RIGHT		7
#macro CTR_W_UP			8


function draw_controls(cx, cy, isController, ctrl_id) {
	draw_sprite_ext(
		(isController ? sPS_Button : sKey_Button), ctrl_id, 
		cx, cy, 0.8, 0.8, 0, c_white, 1
	)
}

function draw_tooltip_control(cx, cy, w, isController, ctrl_id, text) {
	// Assuming text is going from left to right
	var size = 30 // Width
	draw_set_alpha(0.3)
	draw_set_colour((isController) ? c_white : c_black)
	draw_roundrect_ext(cx-32, cy-16, cx+w, cy+16, 10, 10, false)
	draw_set_alpha(1)
	
	draw_set_colour((isController) ? c_black : c_white)
	draw_sprite_ext((isController ? sPS_Button : sKey_Button), 
		ctrl_id, cx, cy, 0.5, 0.5, 0, c_white, 1)
	draw_text(cx + size, cy, text)
	
	// reset to Default
	draw_set_colour(c_white)
}