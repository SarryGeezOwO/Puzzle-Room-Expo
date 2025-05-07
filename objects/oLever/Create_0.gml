toggleOn = false
range = 50
toggleTime = 0;

function isInRange() {
	return point_distance(x, y, oPlayer.x, oPlayer.y) <= range
}