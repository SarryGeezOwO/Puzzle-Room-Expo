// Overall Calculation
OverallScore = floor(gameScore * (50 / gameTime))

if (isFirstTime == false && isGameOver) {
	global.gameTrueScore += OverallScore
	global.fragmentsCollected++
	isFirstTime = true
}
