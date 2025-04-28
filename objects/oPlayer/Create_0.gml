wKey = false
aKey = false
sKey = false
dKey = false

//InteractKey
isInteracting = false
mouseDown = false

rawInput = [0, 0]
input = [0, 0]
velX = 0
velY = 0
moveSpd = 5

function bodyPoint(_x, _y, _w, _d) constructor {
	bx = _x;
	by = _y;
	bw = _w;
	bd = _d;
};

lookAheadPoint = [0, 0]
lookAheadStep = 30

eyeAnchor = 0;
leftEye =  new bodyPoint(0, 0, 2, 6)
rightEye = new bodyPoint(0, 0, 2, 6)

finAnchorIndex = 1;
leftFin =  new bodyPoint(0, 0, 6, 10)
rightFin = new bodyPoint(0, 0, 6, 10)

lowFinAnchorIndex = 4;
lowLeftFin =  new bodyPoint(0, 0, 3, 5)
lowRightFin = new bodyPoint(0, 0, 3, 5)

drawOutline = false;

bodyPoints = [
	new bodyPoint(0, 0, 10, 10),
	new bodyPoint(0, 0, 9,  9),
	new bodyPoint(0, 0, 8,  8),
	new bodyPoint(0, 0, 7,  7),
	new bodyPoint(0, 0, 6,  6),
	new bodyPoint(0, 0, 5,  5),
	new bodyPoint(0, 0, 4,  4),
	new bodyPoint(0, 0, 3,  3),
	new bodyPoint(0, 0, 3,  3),
	new bodyPoint(0, 0, 6,  10),
]


