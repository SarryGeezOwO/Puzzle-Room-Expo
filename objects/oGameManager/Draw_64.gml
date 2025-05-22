
// Draw Hearts
if (!global.isMenuOpen && room == global.baseRoom)
{
	for (var i = 0; i < global.hearts; i++) {
		draw_sprite(sHeart, 0, 40+(i*38), 32)
	}
}

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
		var ofst = 50
		var val = ds_map_find_value(global.inventoryMap, key);
		draw_sprite_ext( // Shadow // Shadow
			sItem, key, ROOM_WIDTH-90, ((i+1) * ofst) + 90,
			1, 1, 0, c_black, 1
		)
		draw_sprite(sItem, key, ROOM_WIDTH-85, ((i+1) * ofst) + 85)
		draw_text(ROOM_WIDTH-55, ((i+1) * ofst) + 80, "x"+string(val))
	
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

if (global.isGameOver) {
	draw_set_alpha(0.75)
	draw_set_colour(c_black)
	draw_rectangle(0, 0, ROOM_WIDTH, ROOM_HEIGHT, false)
	draw_set_alpha(1)
	
	var cx = ROOM_WIDTH/2
	var cy = ROOM_HEIGHT/2
	var width = 250 // This is half
	draw_set_colour(make_colour_rgb(255, 239, 213))
	draw_rectangle(cx-width, cy-200, cx+width, cy+200, false)
	
	draw_set_colour(make_colour_rgb(47, 25, 17))
	draw_rectangle(cx-width, cy-200, cx+width, cy-140, false)
	
	draw_sprite_ext(
		Expo_Fish, 0, cx-250, cy-150, 0.65, 0.65, 0, c_white, 1
	)
	
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_font(f_big)
	draw_set_colour(c_white)
	draw_text(cx, cy-167, (global.isGameWon) ? "BOB ESCAPED!" : "GAME OVER!")
	
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_colour(make_colour_rgb(47, 25, 17))
	draw_text(cx-25, cy-100, "Time Completed")
	var tc = abs(global.gameTime - 180);
	var m = floor(tc / 60)
	var s = floor(tc % 60)	
	var fTime = time_format(m , s)
	
	draw_text(cx-25, cy-70, fTime) // 3 mins eh

	draw_text(cx-25, cy-25, "Score")
	draw_text(cx-25, cy+5, string(global.gameTrueScore))
	
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(cx-80, cy+140, "PRESS")
	draw_controls(cx-10, cy+140, oGameManager.hasController, CTR_SPACE_CROSS)
	draw_text(cx+90, cy+140, "TO RETURN")
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_colour(c_white)
draw_set_font(f_default)