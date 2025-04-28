startingHarpoons = 5;
harpoonLeft = startingHarpoons;

fireRate = 500; // 0.5 seconds stop time
fireTimer = 0;

gameOver = false;

gameScore = 0;


function shoot() {
	harpoonLeft--
	fireTimer = fireRate;
	oCrosshair.shoot();
}

function gameEnd() {
	gameOver = true;
	global.stopGameTime = true;
}