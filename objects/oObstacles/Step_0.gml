var reachEnd = (x <= 0 || x >= room_width)
if (reachEnd) {
	lookdir *= -1
}
x += lookdir * irandom_range(spd, spd+1) // Very evil indeed