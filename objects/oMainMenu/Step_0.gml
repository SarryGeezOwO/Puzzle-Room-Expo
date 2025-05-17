
if (timeForward && time >= 1) timeForward = false
else if (!timeForward && time <= 0) timeForward = true

if (timeForward) time += delta_time / 1000000;
else time -= delta_time / 1000000;

offset = sin(time) * amplitude
if (object_exists(oDisplay)) {
	oDisplay.offset = offset
}


var lkey = keyboard_check_pressed( ord("A") )
var rkey = keyboard_check_pressed( ord("D") )

var res = rkey - lkey
var limit = 3 // +1
if (res != 0) {
	selectedTag += (res > 0 ? 1 : -1)
	if (selectedTag == -1) selectedTag =  limit
	else if (selectedTag == limit+1) selectedTag = 0
	
	audio_play_sound(sndMenuSelectMove, 1, false)
}

// Sounds
if (keyboard_check_pressed( vk_space )) {
	audio_play_sound(sndMenuSelected, 1, false, 0.35, 0, 1.5)
	inputGoodToGo = true
}

if (keyboard_check_released( vk_space ) && inputGoodToGo) {
	audio_play_sound(sndMenuSelected, 1, false)
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