

if isInRange()
{
	draw_set_alpha(0.4)
	draw_set_colour(c_black)
	draw_circle(x, y, range, false)
}

var topOffset = -40
draw_set_alpha(1)

if interact_prog > 0 
{	
	var width = 150 * interact_prog_max
	draw_set_colour(c_black)
	draw_roundrect(
		x - width/2, (y + topOffset) - 15, 
		(x - width/2) + lerp(0, 2, interact_prog) * width, y + topOffset, 
		false
	)
	
	//outline
	draw_set_colour(c_black)
	draw_roundrect(
		x - width/2, (y + topOffset) - 15, 
		(x + width/2), y + topOffset, 
		true
	)
}
else {
	// Display item requirement UI
	if (isInRange()) draw_item_count(x, y-50, ITEM_ID_TRASH, 5)
}

draw_set_colour(c_white)
draw_self()