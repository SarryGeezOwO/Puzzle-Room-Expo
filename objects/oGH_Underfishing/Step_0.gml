with (oFishHook) {
	if (place_meeting(x, y, oObstacles)) {
		// Reset
		y = 135
		oPearl.y = 1500
		hasReachEnd = false
		other.retries++
	}
	
	// Game end
	if (y <= 120) {
		oMG_EndUI.gameScore = (10 - other.retries) * 100
		oMG_EndUI.isGameOver = true
	}
}