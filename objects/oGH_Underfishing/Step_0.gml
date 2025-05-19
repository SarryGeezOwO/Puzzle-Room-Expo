with (oFishHook) {
	if (place_meeting(x, y, oObstacles)) {
		// Reset
		y = 135
		oPearl.y = 1500
		hasReachEnd = false
	}
	
	// Game end
	if (y <= 120) {
		// TODO: SHIT
		oMG_EndUI.isGameOver = true
	}
}