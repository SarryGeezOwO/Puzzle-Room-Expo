var wKey = keyboard_check_pressed( ord("W") )
var aKey = keyboard_check_pressed( ord("A") )
var sKey = keyboard_check_pressed( ord("S") )
var dKey = keyboard_check_pressed( ord("D") )
var press = keyboard_check_pressed( vk_space )

if (press && !oMG_EndUI.isGameOver) {
	getCurrPipe().rotate()
}

selectedPipe[1] += dKey - aKey  // x
selectedPipe[0] += sKey - wKey  // y

if (!oMG_EndUI.isGameOver) {
	selectedPipe[0] = clamp(selectedPipe[0], 0, gridSize-1)
	selectedPipe[1] = clamp(selectedPipe[1], 0, gridSize-1)	
}

if is_flow_valid(gridSize, StartPipe.pos, EndPipe.pos, StartPipe.requiredConn, EndPipe.requiredConn)
{
	oMG_EndUI.gameScore = 1000
	oMG_EndUI.isGameOver = true
}
	
