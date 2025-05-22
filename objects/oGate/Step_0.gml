if (CLOSE_DIR_Y) isNear = point_distance(oPlayer.x, 0, x, 0) < range
else isNear = point_distance(0, oPlayer.y, 0, y) < range

if isNear && oPlayer.isInteracting && !isOpen
{
	interact_prog += delta_time / 1000000
}
else {
	if interact_prog != 0
	{
		interact_prog = 0	
	}
}

interact_prog = clamp(interact_prog, 0, interact_prog_max)
if interact_prog >= interact_prog_max {
	if (oGameManager.getItemCountInventory(ITEM_ID) >= REQUIRED) {
		isOpen = true	
		oGameManager.removeItemInventory(ITEM_ID, REQUIRED)
	}
}

if (image_xscale <= 0.05 || image_yscale <= 0.05) {
	instance_destroy()
}

if (isOpen) {
	if (CLOSE_DIR_Y) {
		image_yscale = lerp(image_yscale, 0, 0.25)
	}
	else {
		image_xscale = lerp(image_xscale, 0, 0.25)
	}
}