if (interact_prog <= 0) {
	// Notice
	if (!isInRange()) {
		draw_sprite_ext(sNotice, -1, x, y-25, 0.5, 0.5, 0, c_white, 1)
	}
	else {
		draw_controls(x, y-45, oGameManager.hasController, CTR_SPACE_CROSS)	
	}
}