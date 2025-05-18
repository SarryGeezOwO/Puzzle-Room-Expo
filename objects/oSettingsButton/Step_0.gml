isPressed = keyboard_check( vk_space )
var rel = keyboard_check_released( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	isPressed = gamepad_button_check(dev, gp_face1)
	rel = gamepad_button_check_released(dev, gp_face1) // X
}

// On Release we invoke the logic
var curLayer = layer_get_name(layer)
if (curLayer != "Selected" || !oMainMenu.inputGoodToGo) {
	isPressed = false
}

// Activate
if (rel && curLayer == "Selected" && oMainMenu.inputGoodToGo) {
	oMainMenu.isSettingOpen = !oMainMenu.isSettingOpen
}