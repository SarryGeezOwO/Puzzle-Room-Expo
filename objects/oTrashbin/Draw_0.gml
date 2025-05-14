// 0 = Bio
// 1 = Recy
// 2 = Non Bio

if (assTimer > 0) {
	draw_sprite_ext(
		sSortFeedback, isTrashCorrect,
		x, (y - sprite_height) - 10, 1, 1,
		0, c_white, 1
	)
}

draw_sprite_ext(
	sTrashBin, TrashType, x, y, 
	image_xscale, image_yscale, image_angle,
	c_white, 1
)
