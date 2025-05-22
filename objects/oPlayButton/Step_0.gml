isPressed = keyboard_check( vk_space )
var rel = keyboard_check_released( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	isPressed = gamepad_button_check(dev, gp_face1)
	rel = gamepad_button_check_released(dev, gp_face1) // X
}
var curLayer = layer_get_name(layer)
if (curLayer != "Selected" || !oMainMenu.inputGoodToGo) {
	isPressed = false
}

 
// Activate
if (rel && curLayer == "Selected" && oMainMenu.inputGoodToGo) {
	var rooms = tag_get_asset_ids("Overworld", asset_room)
	audio_sound_gain(sndBG, 0, 500)
	
	global.baseRoom = rooms[irandom_range(0, array_length(rooms)-1)]
	ds_map_replace(global.minigames, -69, global.baseRoom)
	oMainMenu.startFade = true
}

if (oMainMenu.startFade && oMainMenu.fadeTimer >= 1.2) { 
	room_goto(global.baseRoom)	
}