wKey = keyboard_check( ord("W") )
sKey = keyboard_check( ord("S") )
aKey = keyboard_check( ord("A") )
dKey = keyboard_check( ord("D") )

isInteracting = keyboard_check( ord("E") )
	
rawInput[0] = dKey - aKey;
rawInput[1] = sKey - wKey;
rawInput = normalize_vector(rawInput[0], rawInput[1])

input[0] = lerp(input[0], rawInput[0], 0.2)
input[1] = lerp(input[1], rawInput[1], 0.2)

velX = input[0] * moveSpd
velY = input[1] * moveSpd

// Horizontal Collision
if position_meeting(x + (velX * 2), y, oTile) 
{
	velX = 0;
}

// Vertical Collision
if position_meeting(x, y + (velY * 2), oTile) 
{
	velY = 0;
}	

x += velX;
y += velY;	


if (input[0] != 0 || input[1] != 0) {
	lookAheadPoint[0] = x + (input[0] * lookAheadStep)
	lookAheadPoint[1] = y + (input[1] * lookAheadStep)	
}

// Body movement
bodyPoints[0].bx = x;
bodyPoints[0].by = y;

for(var i = 1; i < array_length(bodyPoints); i++) {
	var bp = bodyPoints[i];
	var prev = bodyPoints[i-1];
	
	// Follow along
	var dist = point_distance(bp.bx, bp.by, prev.bx, prev.by);
	var prevDir = get_vector_normalized(prev.bx, prev.by, bp.bx, bp.by)
	if (dist >= prev.bd) {
		bp.bx = prev.bx + (prevDir[0] * prev.bd);
		bp.by = prev.by + (prevDir[1] * prev.bd);
	}
}

// Eyes
var eye = bodyPoints[eyeAnchor];
var dir = get_vector_normalized(eye.bx, eye.by, lookAheadPoint[0], lookAheadPoint[1])
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