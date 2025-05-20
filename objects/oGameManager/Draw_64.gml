
// Inventory
draw_set_font(f_small)
if (!global.isMenuOpen && room == global.baseRoom && global.isInventoryOpen) {
	draw_set_colour(make_colour_rgb(25, 25, 25))
	draw_roundrect_ext(ROOM_WIDTH-130, 44, ROOM_WIDTH-10, ROOM_HEIGHT-10, 10, 10, false)
	
	draw_set_colour(make_colour_rgb(255, 136, 0))
	draw_line_width(ROOM_WIDTH-130, 80, ROOM_WIDTH-10, 80, 10)
	draw_sprite_ext(sBag, 0, ROOM_WIDTH-65, 80, 0.75, 0.75, 0, c_white, 1)

	draw_set_colour(c_white)
	var arr = ds_map_keys_to_array(global.inventoryMap);
	for (var i = 0; i < ds_map_size(global.inventoryMap); i++) {
		// Item_ID corresponds to their Sprite Sub image
		// Refer to ITEM_ID_, in GlobalScript to lookup the item you want
	
		var key = arr[i]
		var val = ds_map_find_value(global.inventoryMap, key);
		draw_sprite_ext( // Shadow // Shadow
			sItem, key, ROOM_WIDTH-90, ((i+1) * 36) + 121,
			1, 1, 0, c_black, 1
		)
		draw_sprite(sItem, key, ROOM_WIDTH-85, ((i+1) * 36) + 116)
		draw_text(ROOM_WIDTH-55, ((i+1) * 36) + 109, "x"+string(val))
	
	}	
}
draw_set_colour(c_white)
draw_set_font(f_default)

// Draw 
if (itemDrawTimer > 0) {
	var itemID = ds_queue_head(itemDrawQueue)
	if (itemID != undefined) {
		draw_item_tooltip(ROOM_WIDTH/2, ROOM_HEIGHT - 50, "Item obtained", getItemDesc(itemID), itemID)	
	}
}
else {
	if (!ds_queue_empty(itemDrawQueue)) {
		ds_queue_dequeue(itemDrawQueue)
		itemDrawTimer = 1.75;
	}
}

// Controller detection
var inputType = (hasController ? sController : sKeyboard)
draw_sprite_ext(
	inputType, 0, 
	ROOM_WIDTH-30, 
	25, 0.3, 0.3, 0, c_white, 1
)