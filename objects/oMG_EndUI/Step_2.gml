gameScore = clamp(gameScore, 0, 999999)

// Overall Calculation
OverallScore = floor(gameScore * (50 / gameTime))
OverallScore = clamp(OverallScore, 0, 999999)

if (isFirstTime == false && isGameOver) {
	if (OverallScore <= 0) {
		global.hearts--
		specialMsg = true
	}
	
	audio_play_sound(sndMinigameWin, 1, false)
	global.gameTrueScore += OverallScore
	global.gameTime -= abs(gameTime)
	
	oGameManager.addItemInventory(ITEM_ID_KEY_FRAG, 1)
	isFirstTime = true
}
