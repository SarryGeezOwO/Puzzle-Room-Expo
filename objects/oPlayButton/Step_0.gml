isPressed = keyboard_check( vk_space )
// On Release we invoke the logic

var curLayer = layer_get_name(layer)
if (curLayer != "Selected" || !oMainMenu.inputGoodToGo) {
	isPressed = false
}

// Activate
if (keyboard_check_released( vk_space ) && curLayer == "Selected" && oMainMenu.inputGoodToGo) {
	room_goto(r_Overworld)
}