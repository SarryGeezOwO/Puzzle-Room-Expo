var key = keyboard_check_pressed( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	key = gamepad_button_check_pressed(dev, gp_face1)
}

if (global.isMenuOpen) {
	key = false
}

if (key && isGameOver) {
	// Return
	oGameManager.goback_game()
}
