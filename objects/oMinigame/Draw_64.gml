if (interact_prog <= 0) {
	// Notice
	if (!isInRange()) {
		draw_sprite_ext(sNotice, -1, x, y-25, 0.5, 0.5, 0, c_white, 1)
	}
	else {
		var isPS = oGameManager.hasController ? sPS_Button : sKey_Button;
		draw_sprite_ext(isPS, 0, x, y-45, 0.5, 0.5, 0, c_white, 1)		
	}
}