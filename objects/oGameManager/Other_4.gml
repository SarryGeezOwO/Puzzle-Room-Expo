randomize() // This shit exists??


if (room == global.baseRoom && menuExitCalled) {
	menuExitCalled = false
	room_persistent = false
	
	
	room_goto(r_MainMenu)
	room_set_persistent(global.baseRoom, true) 
	// BaseRoom refers to the selected OverWorld map
}

audio_sound_gain(sndBG, 1, 500)