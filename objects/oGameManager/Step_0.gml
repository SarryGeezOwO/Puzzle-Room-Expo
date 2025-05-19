// Don't advance on StopTime or MainMenu is the current room
if (!global.stopGameTime && !isMainMenu) {
	global.gameTime -= delta_time / 1000000	
}

// Toggle Inventory
var tabKey = keyboard_check_pressed( vk_tab )
if (hasController) {
	tabKey = gamepad_button_check_pressed(devices[0], gp_face4)
}
if (tabKey) global.isInventoryOpen = !global.isInventoryOpen 


// Toggle menu
menuTimer += delta_time / 1000000
var menuBtn = keyboard_check( vk_escape )
if (hasController) {
	menuBtn = gamepad_button_check(devices[0], gp_start)
}

// toggable only when outside of settings and HTP
if menuBtn && menuTimer > 0.35 && !global.settingsOpen && !global.htpOpened {
	if (!isMainMenu) {
		global.isMenuOpen = !global.isMenuOpen
		menuTimer = 0	
	}
}

// Enable Menu
if (object_exists(oMenu)) {
	if (global.isMenuOpen) {
		instance_activate_object(oMenu)
		global.stopGameTime = true
		
		// Reset selection index
		if (resetMenu) {
			oMenu.selectedIndex = 0
			resetMenu = false
		}
	}
	else { 
		instance_deactivate_object(oMenu)
		if(!global.InsideMinigame) { // Don't continue time if inside a minigame
			global.stopGameTime = false	
		}
		resetMenu = true
	}
}

if (room == global.baseRoom && loadPlayerPos) {
	loadPlayerPos = false
	oPlayer.x = lastPlayerPos[0]
	oPlayer.y = lastPlayerPos[1]
}
