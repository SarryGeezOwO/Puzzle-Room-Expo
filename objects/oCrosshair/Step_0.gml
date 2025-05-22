up_k = keyboard_check( ord("W") ) 
down_k = keyboard_check( ord("S") ) 
left_k = keyboard_check( ord("A") ) 
right_k = keyboard_check( ord("D") ) 

inp[0] = right_k - left_k;
inp[1] = down_k - up_k;

if (oGameManager.hasController) {
	var dev = oGameManager.devices[0];
	var lh = gamepad_axis_value(dev, gp_axislh)
	var lv = gamepad_axis_value(dev, gp_axislv)
	
	inp[0] = abs(lh) > 0.5 ? 1 * sign(lh) : 0
	inp[1] = abs(lv) > 0.5 ? 1 * sign(lv) : 0
}

inp = normalize_vector(inp[0], inp[1])
vx = inp[0] * spd;
vy = inp[1] * spd;

if (!oMG_EndUI.isGameOver && !global.isMenuOpen) {
	if (x+vx < room_width && x+vx > 0) x += vx;
	if (y+vy < room_height && y+vy > 0) y += vy;		
}

if (oMG_EndUI.isGameOver) {
	instance_destroy(id, false)	
}