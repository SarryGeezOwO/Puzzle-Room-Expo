var key = keyboard_check( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	key = gamepad_button_check(dev, gp_face1)
}

if (global.isMenuOpen) {
	key = false
}

// Super sigma 90000!!!
if (!oMG_EndUI.isGameOver) {
	y += (hasReachEnd ? -15 : 15) * key
}

var camY = getCamY()
var newY = lerp(camY, y-400, 0.25)
// Set bounds
newY = clamp(newY, 0, room_height - camera_get_view_height(cam))

camera_set_view_pos(cam, 0, newY)
if (place_meeting(x, y, oPearl)) {
	if (!playSnd) {
		playSnd = true
		audio_play_sound(sndClick, 1, false)
	}
	
	hasReachEnd = true
	oPearl.x = x+8
	oPearl.y = y+25
}