assTimer = 0
isTrashCorrect = false

function processTrash(type) {
	var isCorrect = false;
	if (TrashType == 0 && type == oBioTrash) { // Bio
		oGH_TrashSort.bioCount++;
		isCorrect = true
	}
	else if (TrashType == 1 && type == oRecyTrash) { // recy
		oGH_TrashSort.recyCount++;
		isCorrect = true
	}
	else if (TrashType == 2 && type == oNonBioTrash) { // non-Bio
		oGH_TrashSort.nonBioCount++;
		isCorrect = true
	}
	
	if (isCorrect) {
		oMG_EndUI.gameScore += 100;
		audio_play_sound(sndCorrect, 1, false)
	}
	else {
		audio_play_sound(sndWrong, 1, false)	
	}
	
	assTimer = 0.6;
	isTrashCorrect = isCorrect
}
