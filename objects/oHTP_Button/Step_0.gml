isPressed = keyboard_check( vk_space )
// On Release we invoke the logic

var curLayer = layer_get_name(layer)
if (curLayer != "Selected" || !oMainMenu.inputGoodToGo) {
	isPressed = false
}
