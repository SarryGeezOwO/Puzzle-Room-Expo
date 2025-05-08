oGameManager.addInteractable(tag_id, object_index)
tilemap = layer_get_id("Toxic_"+string(Tilemap_ID));

function invoke() {
	toggle_on = !toggle_on
	layer_set_visible(tilemap, toggle_on)
}
