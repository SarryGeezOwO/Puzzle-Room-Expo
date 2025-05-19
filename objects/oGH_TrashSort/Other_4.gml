// Randomize Trash locations based on start and End boundaries
var startBound = [oStartBound.x, oStartBound.y]
var endBound = [oEndBound.x, oEndBound.y]

with(all) {
	if (object_index != oBioTrash && object_index != oNonBioTrash && object_index != oRecyTrash) {
		// Iz not trash
		continue
	}
	
	x = random_range(startBound[0], endBound[0])
	y = random_range(startBound[1], endBound[1])
}