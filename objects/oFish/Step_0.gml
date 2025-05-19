if (x >= room_width || x <= 0) {
	lookDir *= -1;
}

xSpeed = lookDir * moveSpd;

if (!oMG_EndUI.isGameOver) {
	x+= xSpeed;	
}