range = 60;
interact_prog = 0;
interact_prog_max = 1; // seconds

function isInRange() {
	return point_distance(x, y, oPlayer.x, oPlayer.y) <= range
}