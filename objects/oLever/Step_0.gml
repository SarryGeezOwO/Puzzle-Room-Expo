if (toggleTime <= 2) {
	toggleTime += delta_time / 1000000	
}

if (isInRange() && oPlayer.isInteracting && toggleTime >= 0.3) {
	toggleOn = !toggleOn
	oGameManager.callInteract(tag_id)
	toggleTime = 0;
	audio_play_sound(sndTypeWriter_click, 2, false)
}