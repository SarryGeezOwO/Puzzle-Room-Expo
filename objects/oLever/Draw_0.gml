var i = toggleOn ? 1 : 0
draw_sprite_ext(sLever, i, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)

// Tooltip
if (isInRange()) {
	// Space key
	draw_controls(x, y-50, oGameManager.hasController, CTR_SPACE_CROSS)
}
