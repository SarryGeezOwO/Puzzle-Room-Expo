if (timeForward && time >= 1) timeForward = false
else if (!timeForward && time <= 0) timeForward = true

if (timeForward) time += delta_time / 1000000;
else time -= delta_time / 1000000;

offset = sin(time) * amplitude
if (object_exists(oDisplay)) {
	oDisplay.offset = offset
}

var rel = keyboard_check_released( vk_space )
var press = keyboard_check_pressed( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	rel = gamepad_button_check_released(dev, gp_face1) // X
	press = gamepad_button_check_pressed(dev, gp_face1)
}


// Sounds, And Input validation
if (press) {
	audio_play_sound(sndMenuSelected, 1, false, 0.35, 0, 1.5)
	inputGoodToGo = true
}

if (rel && inputGoodToGo) {
	audio_play_sound(sndMenuSelected, 1, false)
}


// Navigation
var lkey = keyboard_check_pressed( ord("A") )
var rkey = keyboard_check_pressed( ord("D") )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	lkey = gamepad_button_check_pressed(dev, gp_padl) // Left
	rkey = gamepad_button_check_pressed(dev, gp_padr) // Right
}

var res = rkey - lkey
var limitTag = 3 // +1

// Close all inputs when a window is open
if (isSettingOpen || isHTPOpen) {
	limit = (isSettingOpen) ? 3 : 3 // this is index based
	res = 0
	inputGoodToGo = false
	selectedTag = -1
}

if (res != 0) {
	selectedTag += (res > 0 ? 1 : -1)
	if (selectedTag == -1) selectedTag =  limitTag
	else if (selectedTag == limitTag+1) selectedTag = 0
	
	audio_play_sound(sndMenuSelectMove, 1, false)
}

// Tag checking
with(all) {
	if (variable_instance_exists(id, "tag")) {
		// Bingo there is
		if (other.selectedTag == tag) {
			layer = layer_get_id("Selected")
			other.tooltip = Name
		}
		else {
			layer = layer_get_id("Buttons")	
		}
	}
}
