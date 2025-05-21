var reachEnd = (x <= 0 || x >= room_width)
if (reachEnd) {
	lookdir *= -1
}
x += lookdir * spd

if (image_xscale != lookdir) {
	image_xscale = lookdir	
}