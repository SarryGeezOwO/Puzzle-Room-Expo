draw_set_colour(c_black)
if(isNear && !isOpen) {
	draw_set_alpha(0.5)
	if (CLOSE_DIR_Y) {
		draw_rectangle(
			x-((sprite_width/2)+(range/2)), 
			y-(sprite_height/2),
			x+((sprite_width/2)+(range/2)),
			y+(sprite_height/2),
			false
		)	
	}
	else {
		draw_rectangle(
			x-(sprite_width/2), 
			y-((sprite_height/2)+(range/2)),
			x+(sprite_width/2),
			y+((sprite_height/2)+(range/2)),
			false
		)	
	}
	draw_set_alpha(1)
}

draw_set_colour(c_white)
draw_set_alpha(1)
draw_self()

if (!isOpen) {
	// Draw requirements
	draw_set_colour(c_black)
	draw_set_alpha(0.5)
	draw_roundrect_ext(x-40, y-18, x+40, y+18, 10, 10, false)

	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_set_valign(fa_top)
	draw_item_count(x, y, ITEM_ID, REQUIRED)	
}