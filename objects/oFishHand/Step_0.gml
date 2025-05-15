isGrabbing = keyboard_check( vk_space )

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
	isGrabbing = gamepad_button_check(dev, gp_face1)
	
	inp[0] = abs(lh) > 0.5 ? 1 * sign(lh) : 0
	inp[1] = abs(lv) > 0.5 ? 1 * sign(lv) : 0
}

inp = normalize_vector(inp[0], inp[1])
vx = inp[0] * spd;
vy = inp[1] * spd;

if (!oGH_TrashSort.gameOver) {
	if (x+vx < room_width && x+vx > 0) x += vx;
	if (y+vy < room_height && y+vy > 0) y += vy;	
}

if (!isGrabbing && hasGrabbed) {
	hasGrabbed = false
	grabbedID = -1
}

// Move Trash along with the hand
with(all) {
	if (object_index != oBioTrash && object_index != oNonBioTrash && object_index != oRecyTrash) {
		// Iz not trash
		continue
	}
	
	if (point_distance(x, y, other.x, other.y) < 42 && !other.hasGrabbed) {
		other.hasGrabbed = true;
		other.grabbedID = id
	}
	
	if (other.isGrabbing && other.grabbedID == id) {
		x = other.x
		y = other.y
	}
	
	
}
