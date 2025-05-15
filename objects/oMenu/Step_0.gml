var upKey = keyboard_check( ord("W") )
var downKey = keyboard_check( ord("S") )
var press = keyboard_check( vk_space )

if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	upKey = gamepad_button_check(dev, gp_padu)
	downKey = gamepad_button_check(dev, gp_padd)
	press = gamepad_button_check(dev, gp_face1)
}

if (inpDownTime >= 0) {
	inpDownTime -= delta_time / 1000000;
}

if (inpDownTime <= 0) {
	var limit = (global.settingsOpen) ? 3 : 2
	
	if (upKey) {
		selectedIndex = (selectedIndex <= 0) ? limit : selectedIndex-1	
		inpDownTime = 0.125
	}
	else if (downKey) {
		selectedIndex = (selectedIndex >= limit) ? 0 : selectedIndex+1
		inpDownTime = 0.125
	}	
}

if (global.settingsOpen && !settingsOpenedFirst) {
	settingsOpenedFirst = true
	tempAudio = global.audioMute
	tempFullscreen = global.gameFullScreen
}
else if (!global.settingsOpen) {
	settingsOpenedFirst = false
}

// Press space sheesh
if (press && inpDownTime <= 0) {
	if (object_exists(oGameManager)) {
		if (!global.settingsOpen) {
			// Menu
			oGameManager.callMenuFunc(selectedIndex)
		}
		else {
			// Settings
			switch(selectedIndex)
			{
				case 0: // Audio
				tempAudio = !tempAudio
				break;
				
				case 1: // Fullscreen
				tempFullscreen = !tempFullscreen
				break;
				
				case 2: // Apply
				global.settingsOpen = false
				selectedIndex = 0
				global.audioMute = !tempAudio
				global.gameFullScreen = tempFullscreen
				break;
				
				case 3: // Cancel
				global.settingsOpen = false
				selectedIndex = 0
				break;
			}
		}
	}
	inpDownTime = 0.125
}