// Tooltip
if (isInRange()) {
	// Space key
	var spr = (oGameManager.hasController) ? sPS_Button : sKey_Button
	draw_sprite_ext(spr, 0, x, y-50, 0.5, 0.5, 0, c_white, 1)	
}
