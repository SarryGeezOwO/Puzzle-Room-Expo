var upKey = keyboard_check( ord("W") )
var downKey = keyboard_check( ord("S") )
var press = keyboard_check_pressed( vk_space )

if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	upKey = gamepad_button_check(dev, gp_padu)
	downKey = gamepad_button_check(dev, gp_padd)
	press = gamepad_button_check_pressed(dev, gp_face1)
}

if (inpDownTime >= 0) {
	inpDownTime -= delta_time / 1000000;
}

if (htpTimeForward && htpTime >= 1) htpTimeForward = false
else if (!htpTimeForward && htpTime <= 0) htpTimeForward = true

if (htpTimeForward) htpTime += delta_time / 1000000;
else htpTime -= delta_time / 1000000;

// Input
if (inpDownTime <= 0) { 
	var limit = (global.htpOpened) ? htpCount+1 : 4
	
	if (upKey) {
		selectedIndex = (selectedIndex <= 0) ? limit-1 : selectedIndex-1	
		inpDownTime = inpUpTime
		audio_play_sound(sndMenuSelectMove, 1, false)
	}
	else if (downKey) {
		selectedIndex = (selectedIndex >= limit-1) ? 0 : selectedIndex+1
		inpDownTime = inpUpTime
		audio_play_sound(sndMenuSelectMove, 1, false)
	}	
}

// Toggle settings
if (global.settingsOpen && !settingsOpenedFirst) {
	settingsOpenedFirst = true
	tempAudioMute = global.audioMute
	tempFullscreen = global.gameFullScreen
}
else if (!global.settingsOpen) {
	settingsOpenedFirst = false
}

// Press space sheesh
if (press) {
	if (object_exists(oGameManager)) {
		if (global.htpOpened) {
			// How to play
			if (selectedIndex == htpCount) {
				selectedIndex = 0
				global.htpOpened = false
			}
			else global.htpSelected = selectedIndex
		}
		else if (!global.settingsOpen) {
			// Menu
			oGameManager.callMenuFunc(selectedIndex)
			if (selectedIndex != 1) { // Except How to play
				selectedIndex = 0	
			}else selectedIndex = global.htpSelected
		}
		else {
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
				global.settingsOpen = false
				selectedIndex = 0
				global.audioMute = tempAudioMute
				global.gameFullScreen = tempFullscreen
				break;
				
				case 3: // Cancel
				global.settingsOpen = false
				selectedIndex = 0
				break;
			}
		}
	}
	audio_play_sound(sndMenuSelected, 1, false)
}