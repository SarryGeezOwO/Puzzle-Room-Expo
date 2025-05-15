var upKey = keyboard_check( ord("W") )
var downKey = keyboard_check( ord("S") )
var press = keyboard_check( vk_space )

if (inpDownTime >= 0) {
	inpDownTime -= delta_time / 1000000;
}

if (inpDownTime <= 0) {
	if (upKey) {
		selectedIndex = (selectedIndex <= 0) ? 2 : selectedIndex-1	
		inpDownTime = 0.125
	}
	else if (downKey) {
		selectedIndex = (selectedIndex >= 2) ? 0 : selectedIndex+1
		inpDownTime = 0.125
	}	
}

// Press space sheesh
if (press && inpDownTime <= 0) {
	if (object_exists(oGameManager)) {
		oGameManager.callMenuFunc(selectedIndex)
	}
	inpDownTime = 0.125
}