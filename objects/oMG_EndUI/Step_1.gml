var key = keyboard_check_pressed( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	key = gamepad_button_check_pressed(dev, gp_face1)
}

// Game time
if (!isGameOver && !global.isMenuOpen) {
	gameTime += delta_time / 1000000	
}

// Key validation
if (global.isMenuOpen) {
	key = false
}

if (key && isGameOver) {
	// Return
	audio_play_sound(sndMenuSelected, 2, false, 1)
	oGameManager.goback_game()
}
