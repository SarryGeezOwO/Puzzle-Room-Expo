var wKey = keyboard_check_pressed( ord("W") )
var aKey = keyboard_check_pressed( ord("A") )
var sKey = keyboard_check_pressed( ord("S") )
var dKey = keyboard_check_pressed( ord("D") )
var press = keyboard_check_pressed( vk_space )

if oGameManager.hasController {
	var dev = oGameManager.devices[0]
	wKey = gamepad_button_check_pressed( dev, gp_padu )
	aKey = gamepad_button_check_pressed( dev, gp_padl )
	sKey = gamepad_button_check_pressed( dev, gp_padd )
	dKey = gamepad_button_check_pressed( dev, gp_padr )
	press = gamepad_button_check_pressed( dev, gp_face1 )
}

if (press && !oMG_EndUI.isGameOver && !global.isMenuOpen) {
	audio_play_sound(sndClick, 1, false, 0.75)
	getCurrPipe().rotate()
}

if (!oMG_EndUI.isGameOver && !global.isMenuOpen) {
	if ((dKey - aKey) != 0 || (sKey - wKey) != 0) {
		audio_play_sound(sndMenuSelectMove, 1, false)
	}
	
	selectedPipe[1] += dKey - aKey  // x
	selectedPipe[0] += sKey - wKey  // y
	selectedPipe[0] = clamp(selectedPipe[0], 0, gridSize-1)
	selectedPipe[1] = clamp(selectedPipe[1], 0, gridSize-1)	
}

if is_flow_valid(gridSize, StartPipe.pos, EndPipe.pos, StartPipe.requiredConn, EndPipe.requiredConn)
{
	oMG_EndUI.gameScore = 1000
	oMG_EndUI.isGameOver = true
}
	
