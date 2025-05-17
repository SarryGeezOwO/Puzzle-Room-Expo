// Keyboard
if (!global.isMenuOpen) {
	wKey = keyboard_check( ord("W") )
	sKey = keyboard_check( ord("S") )
	aKey = keyboard_check( ord("A") )
	dKey = keyboard_check( ord("D") )
	isInteracting = keyboard_check( vk_space )
	isVaccuming = keyboard_check( ord("F") )	
}
	
rawInput[0] = dKey - aKey;
rawInput[1] = sKey - wKey;

// Controller
if (oGameManager.hasController && !global.isMenuOpen) {
	var dev = oGameManager.devices[0];
	var lh = gamepad_axis_value(dev, gp_axislh)
	var lv = gamepad_axis_value(dev, gp_axislv)
	
	rawInput[0] = abs(lh) > 0.5 ? 1 * sign(lh) : 0
	rawInput[1] = abs(lv) > 0.5 ? 1 * sign(lv) : 0
	isInteracting = gamepad_button_check(dev, gp_face1) // X
	isVaccuming = gamepad_button_check(dev, gp_face2)   // O
}

// Toggle off all input keys
if (global.isMenuOpen) {
	isVaccuming = false
	isInteracting = false
	rawInput = [0, 0]
}

// Direction
rawInput = normalize_vector(rawInput[0], rawInput[1])
input[0] = lerp(input[0], rawInput[0], 0.125)
input[1] = lerp(input[1], rawInput[1], 0.125)

var amplitude = 1.25;
var freq = 16;
var offset = [
	sin(inpTimer * freq) * -input[1] * amplitude,
	sin(inpTimer * freq) * input[0] * amplitude
]

var diff = dot_product(prevInput[0], prevInput[1], input[0], input[1])
if (diff < 0) {
	// 90 deg
    var cross = input[0] * prevInput[1] - input[1] * prevInput[0];
    var perp = (cross > 0) ? [-input[1], input[0]] : [input[1], -input[0]];

    var length = point_distance(0, 0, prevInput[0], prevInput[1]);
    input = [perp[0] * length, perp[1] * length]; 
}

velX = offset[0] + input[0] * moveSpd
velY = offset[1] + input[1] * moveSpd
prevInput = rawInput

// Horizontal Collision
if position_meeting(x + (velX * 2), y, layer_tilemap_get_id("SandTiles")) || (x + velX <= 0 || x+velX >= room_width)
{
	velX = 0;
}

// Vertical Collision
if position_meeting(x, y + (velY * 2), layer_tilemap_get_id("SandTiles")) || (y + velY <= 0 || y+velY >= room_height)
{
	velY = 0;
}	

x += velX;
y += velY;	

if (input[0] != 0 || input[1] != 0) {
	lookAheadPoint = scale_vector_by_length(input, lookAheadStep)
	lookDir = normalize_vector_arr(lookAheadPoint)
}

// Body movement
bodyPoints[0].bx = x;
bodyPoints[0].by = y;

for(var i = 1; i < array_length(bodyPoints); i++) {
	var bp = bodyPoints[i];
	var prev = bodyPoints[i-1];
	
	var vec = get_vector_normalized(bp.bx, bp.by, prev.bx, prev.by);
	bp.a = unit_vector_to_degree(vec[0], vec[1])
	
	// Follow along
	var dist = point_distance(bp.bx, bp.by, prev.bx, prev.by);
	var prevDir = get_vector_normalized(prev.bx, prev.by, bp.bx, bp.by)
	if (dist >= prev.bd) {
		bp.bx = (prev.bx + (prevDir[0] * prev.bd));
		bp.by = (prev.by + (prevDir[1] * prev.bd));
	}
}

// Eyes
var eye = bodyPoints[eyeAnchor];
var dir = lookDir
var lEye =  perpendicular_cw(dir[0], dir[1]);
var rEye = perpendicular_ccw(dir[0], dir[1]);
	leftEye.bx =  eye.bx + (lEye[0] * leftEye.bd);
	leftEye.by =  eye.by + (lEye[1] * leftEye.bd);
	
	rightEye.bx =  eye.bx + (rEye[0] * rightEye.bd);
	rightEye.by =  eye.by + (rEye[1] * rightEye.bd);


// Fin Movement
var anchor = bodyPoints[finAnchorIndex];
var prevAnc = bodyPoints[finAnchorIndex-1];
dir = get_vector_normalized(anchor.bx, anchor.by, prevAnc.bx, prevAnc.by)
var left =  perpendicular_cw(dir[0], dir[1]);
var right = perpendicular_ccw(dir[0], dir[1]);
	leftFin.bx =  anchor.bx + (left[0] * leftFin.bd);
	leftFin.by =  anchor.by + (left[1] * leftFin.bd);
	
	rightFin.bx =  anchor.bx + (right[0] * rightFin.bd);
	rightFin.by =  anchor.by + (right[1] * rightFin.bd);


// Low fins
anchor = bodyPoints[lowFinAnchorIndex];
prevAnc = bodyPoints[lowFinAnchorIndex-1];
dir = get_vector_normalized(anchor.bx, anchor.by, prevAnc.bx, prevAnc.by);
left =  perpendicular_cw(dir[0], dir[1]);
right = perpendicular_ccw(dir[0], dir[1]);
	lowLeftFin.bx =  anchor.bx + (left[0] * lowLeftFin.bd);
	lowLeftFin.by =  anchor.by + (left[1] * lowLeftFin.bd);
	
	lowRightFin.bx =  anchor.bx + (right[0] * lowRightFin.bd);
	lowRightFin.by =  anchor.by + (right[1] * lowRightFin.bd);
	
// Vaccum ---------- 
with(oTrash) {
	// code here is being called by oTrash
	// other refers to the calling code of "With"
	// Comapare Dot product
	
	var trashVec = get_vector_normalized(other.x, other.y, x, y)
	var dp = dot_product(other.lookDir[0], other.lookDir[1], trashVec[0], trashVec[1])
	var dist = point_distance(other.x, other.y, x, y)
	isVacRange = dp >= 0.85 && dist <= other.vaccumMaxRange
	
	if (isVacRange && other.isVaccuming) {
		var nx = lerp(x, other.leftFin.bx, 0.1)
		var ny = lerp(y, other.leftFin.by, 0.1)
		
		// Horizontal Collision
		if position_meeting(nx, y, layer_tilemap_get_id("SandTiles")) {
			nx = x;
		}

		// Vertical Collision
		if position_meeting(x, ny, layer_tilemap_get_id("SandTiles")) {
			ny = y;
		}	
		
		x = nx;
		y = ny;
	
		if (dist <= 50) {
			var snd = irandom_range(0, 1) = 0 ? sndCollect_1 : sndCollect_2
			audio_play_sound(snd, 1, false, 0.3, 0.3)
			instance_destroy()
		}
	}
}