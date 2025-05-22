var wKey = keyboard_check_pressed( ord("W") )
var sKey = keyboard_check_pressed( ord("S") )
var press = keyboard_check_pressed( vk_space )

if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	wKey = gamepad_button_check_pressed(dev, gp_padu)
	sKey = gamepad_button_check_pressed(dev, gp_padd)
	press = gamepad_button_check_pressed(dev, gp_face1)
}

// Input Validation
if (!isSettingOpen && !isHTPOpen) {
	press = false
	wKey = false
	sKey = false
}

// Settings 
selectedIndex += sKey - wKey
if (selectedIndex == -1) selectedIndex = limit
else if (selectedIndex == limit+1) selectedIndex = 0
if (wKey || sKey) {
	audio_play_sound(sndMenuSelectMove, 1, false)
}

if (press) {

	if (isHTPOpen) {
		// How to play
		htpCurrentFrame = 0
		if (selectedIndex == htpCount) {
			selectedIndex = 0
			selectedTag = 1
			isHTPOpen = false
		}
		else global.htpSelected = selectedIndex
	}
	else if (isSettingOpen) {
		// Settings
		switch(selectedIndex)
		{
			case 0: // Audio
			tempAudioMute = !tempAudioMute
			break;
				
			case 1: // Fullscreen
			tempFullscreen = !tempFullscreen
			break;
				
			case 2: // Apply
			global.audioMute = tempAudioMute
			global.gameFullScreen = tempFullscreen
			isSettingOpen = false
			selectedIndex = 0
			selectedTag = 2
			break;
				
			case 3: // Cancel
			isSettingOpen = false
			selectedIndex = 0
			selectedTag = 2
			break;
		}		
	}
	
	audio_play_sound(sndMenuSelected, 1, false)
}

// Fade timer
if (startFade) { 
	fadeTimer += delta_time / 1000000
}