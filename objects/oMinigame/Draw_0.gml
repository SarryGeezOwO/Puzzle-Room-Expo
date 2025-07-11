

if isInRange()
{
	draw_set_alpha(0.4)
	draw_set_colour(c_black)
	draw_circle(x, y-10, range, false)
}

var topOffset = -30
draw_set_alpha(1)

if interact_prog > 0 
{	
	draw_set_colour(c_black)
	draw_roundrect(
		x - 50, (y + topOffset) - 15, 
		(x - 50) + lerp(0, 2, interact_prog) * 50, y + topOffset, 
		false
	)
	
	//outline
	draw_set_colour(c_black)
	draw_roundrect(
		x - 50, (y + topOffset) - 15, 
		(x + 50), y + topOffset, 
		true
	)
}

draw_set_colour(c_white)
draw_sprite_ext(
	sMinigame, g_id, 
	x, y, image_xscale, image_yscale,
	image_angle, c_white, 1
)

if (interact_prog <= 0) {
	// Notice
	if (!isInRange()) {
		draw_sprite_ext(sNotice, -1, x, y-25, 0.5, 0.5, 0, c_white, 1)
	}
	else {
		draw_controls(x, y-45, oGameManager.hasController, CTR_SPACE_CROSS)	
	}
}
