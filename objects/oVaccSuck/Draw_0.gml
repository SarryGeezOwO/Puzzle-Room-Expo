image_speed = 0.4
// Vaccum effect
if (oPlayer.isVaccuming) {
	var scale = oPlayer.vaccumMaxRange / 64 // sprite size
	draw_sprite_ext(
		sVacumSuck, -1, 
		oPlayer.leftFin.bx, oPlayer.leftFin.by, scale, scale, 
		unit_vector_to_degree(oPlayer.input[0], oPlayer.input[1]), c_white, 0.5)
}
