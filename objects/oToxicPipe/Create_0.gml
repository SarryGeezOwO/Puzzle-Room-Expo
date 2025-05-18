oGameManager.addInteractable(tag_id, object_index)
tilemap = layer_get_id("Toxic_"+string(Tilemap_ID));

function invoke() {
	if (!toggle_on) {
		return	
	}
	
	toggle_on = false
	layer_destroy(tilemap)
	//toggle_on = !toggle_on
	// This is a one time function
}
