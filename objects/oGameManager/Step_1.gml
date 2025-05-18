if (!object_exists(oGameManager)) {
	global.hasGameManager = false
}
else {
	// Remove duplicate	
	with(oGameManager) {
		if (uuid != global.gameManagerUUID) {
			instance_destroy()
		}
	}
}

// Determine settings
audio_master_gain(!global.audioMute)
window_set_fullscreen(global.gameFullScreen)
hasController = array_length(devices) > 0

// Determine inputs
isMainMenu = room == r_MainMenu
