if (x >= room_width || x <= 0) {
	lookDir *= -1;
}

xSpeed = lookDir * moveSpd;

if (!oGH_LionFishHunt.gameOver) {
	x+= xSpeed;	
}