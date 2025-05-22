startingHarpoons = 8; // 3 blessing 
harpoonLeft = startingHarpoons;

fireRate = 500; // 0.5 seconds stop time
fireTimer = 0;

function shoot() {
	harpoonLeft--
	fireTimer = fireRate;
	oCrosshair.shoot();
	audio_play_sound(sndShoot1, 2, false, 0.75, 0.05)
	audio_play_sound(sndShoot2, 1, false)
}