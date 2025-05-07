oGameManager.addInteractable(tag_id, object_index)

function invoke() {
	toggle_on = !toggle_on
	layer_set_visible(layer_get_id("Toxic_"+string(Tilemap_ID)), toggle_on)
}