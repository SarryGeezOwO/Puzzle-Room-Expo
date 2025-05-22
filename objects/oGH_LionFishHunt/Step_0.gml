var shootKey = keyboard_check( vk_space )
if (oGameManager.hasController) {
	var dev = oGameManager.devices[0];
	shootKey = gamepad_button_check(dev, gp_face1)
}


if (fireTimer >= 0) {
	fireTimer -= delta_time / 1000
}

// Minigame end
var count = 0 
with(oLionFish) {
	count++
}

if (harpoonLeft <= 0 || count <= 0) {
	oMG_EndUI.isGameOver = true
}

if (shootKey && fireTimer <= 0 && !oMG_EndUI.isGameOver && !global.isMenuOpen)
{
	shoot();
}
