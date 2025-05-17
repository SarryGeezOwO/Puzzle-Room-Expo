isPressed = keyboard_check( vk_space )
// On Release we invoke the logic

var curLayer = layer_get_name(layer)
if (curLayer != "Selected") {
	isPressed = false
}

// Activate
if (keyboard_check_released( vk_space ) && curLayer == "Selected") {
	game_end()
}