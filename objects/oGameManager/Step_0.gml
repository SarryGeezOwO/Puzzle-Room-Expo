if (!global.stopGameTime) {
	global.gameTime -= delta_time / 1000000	
}


if (room == Room1 && loadPlayerPos) {
	loadPlayerPos = false
	oPlayer.x = lastPlayerPos[0]
	oPlayer.y = lastPlayerPos[1]
}

hasController = array_length(devices) > 0