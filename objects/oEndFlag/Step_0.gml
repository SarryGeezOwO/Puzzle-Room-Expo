if (position_meeting(oPlayer.x, oPlayer.y, self)) {
	global.isGameOver = true
	global.isGameWon = true
	if (!playSnd) {
		audio_play_sound(sndWin, 1, false)
		playSnd = true	
	}
}

if (global.gameTime <= 0) {
	global.isGameOver = true
	global.isGameWon = false
	if (!playSnd) {
		audio_play_sound(sndFail, 1, false)
		playSnd = true	
	}
}

var press = keyboard_check_pressed( vk_space )
if (oGameManager.hasController) {
	press = gamepad_button_check_pressed(oGameManager.devices[0], gp_face1)
}

if (press && global.isGameOver) {
	oGameManager.menu_exit()
	audio_play_sound(sndMenuSelected, 2, false, 1)
}