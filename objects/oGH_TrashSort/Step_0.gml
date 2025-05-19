var trashCount = 0

with(all) {
	
	// --------- TRASH REGION ------------
	if (object_index != oBioTrash && object_index != oNonBioTrash && object_index != oRecyTrash) {
		// Iz not trash
		continue
	}
	trashCount++
	
	// Trash collision with trashbin
	if (position_meeting(x, y, oTrashbin)) {
		if (!oFishHand.isGrabbing) {
			var trashType = object_index
			var bin = instance_place(x, y, oTrashbin)
			bin.processTrash(trashType)
			instance_destroy()
		}
	}
}

// Game done
if (trashCount <= 0) {
	oMG_EndUI.isGameOver = true
}