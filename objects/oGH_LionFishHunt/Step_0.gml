var shootKey = keyboard_check( vk_space )

if (fireTimer >= 0) {
	fireTimer -= delta_time / 1000
}

// Minigame end
if (harpoonLeft <= 0) {
	gameEnd();
}

if (shootKey && fireTimer <= 0 && !gameOver)
{
	shoot();
}