if (isVaccuming) {
	audio_sound_gain(sndVaccum, 1, 1)
	if (!audio_is_playing(sndVaccum)) {
		audio_play_sound(sndVaccum, 1, true, 0.75, 0.2)	
	}
}
else {
	audio_sound_gain(sndVaccum, 0, 300)
	if (audio_sound_get_gain(sndVaccum) <= 0.1) {
		audio_stop_sound(sndVaccum)		
	}
}