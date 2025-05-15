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

// Toggle menu
menuTimer += delta_time / 1000000
if (keyboard_check( vk_escape ) && menuTimer > 0.35) {
	global.isMenuOpen = !global.isMenuOpen
	menuTimer = 0
}

if (!global.stopGameTime) {
	global.gameTime -= delta_time / 1000000	
}


// Enable Menu
if (object_exists(oMenu)) {
	if (global.isMenuOpen) {
		instance_activate_object(oMenu)
		global.stopGameTime = true
	}
	else { 
		instance_deactivate_object(oMenu)
		global.stopGameTime = false
	}
}

if (room == Room1 && loadPlayerPos) {
	loadPlayerPos = false
	oPlayer.x = lastPlayerPos[0]
	oPlayer.y = lastPlayerPos[1]
}

hasController = array_length(devices) > 0