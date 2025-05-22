with (oFishHook) {
	if (place_meeting(x, y, oObstacles)) {
		// Reset
		y = 135
		oPearl.y = 2272
		hasReachEnd = false
		other.retries++
		playSnd = false
		audio_play_sound(sndHit, 2, false)
	}
	
	// Game end
	if (y <= 120) {
		oMG_EndUI.gameScore = (10 - other.retries) * 100
		oMG_EndUI.isGameOver = true
	}
}

// up to 6 retries
if (retries >= 6) {
	// gameover
	oMG_EndUI.gameScore = 0 // pluh
	oMG_EndUI.isGameOver = true
}