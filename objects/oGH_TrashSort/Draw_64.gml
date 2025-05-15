draw_text(10, 10, "Score: " + string(gameScore))
draw_text(10, 24, "Biodegradable: " + string(bioCount))
draw_text(10, 38, "Non-Biodegradable: " + string(nonBioCount))
draw_text(10, 52, "Recycable: " + string(recyCount))

if (gameOver) {
	// IDK later...
	
	draw_set_font(f_big)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_alpha(0.5)
	draw_set_colour(c_black)
	draw_rectangle(0, 0, room_width, room_height, false) 
	
	var cx = room_width/2
	var cy = room_height/2
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_roundrect(cx-220, cy-200, cx+220, cy+200, false)
	
	draw_set_colour(c_black)
	draw_text(cx, cy-34, "Minigame Finished!")
	draw_text(cx, cy, "Score: " + string(gameScore))
	
	draw_set_font(f_default)
	draw_text(cx, cy+36, "Press [SPACE] or [X] to continue")
}
