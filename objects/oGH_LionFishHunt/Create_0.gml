startingHarpoons = 5;
harpoonLeft = startingHarpoons;

fireRate = 500; // 0.5 seconds stop time
fireTimer = 0;

gameOver = false;

function shoot() {
	harpoonLeft--
	fireTimer = fireRate;
}

function gameEnd() {
	gameOver = true;
}