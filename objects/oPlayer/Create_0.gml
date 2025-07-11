wKey = false
aKey = false
sKey = false
dKey = false
prevInput = [0, 0]
maxTurnAngle = 90;
inpTimer = 0;
inpTimeBack = false

//InteractKey
isInteracting = false
mouseDown = false

// Be ready to remove this shit
isVaccuming = false
vaccumMaxRange = 200

rawInput = [0, 0]
input = [0, 0]
velX = 0
velY = 0
moveSpd = 4
additionalSpd = 0
additionalSpdDuration = 0 // Milliseconds

function bodyPoint(_x, _y, _w, _d, _a) constructor {
	bx = _x;
	by = _y;
	bw = _w;
	bd = _d;
	a = _a;
};


lookDir = [0, 0] // Normalized version
lookAheadPoint = [0, 0]
lookAheadStep = 25

eyeAnchor = 0;
leftEye =  new bodyPoint(0, 0, 2, 6, -1)
rightEye = new bodyPoint(0, 0, 2, 6, -1)

finAnchorIndex = 1;
leftFin =  new bodyPoint(0, 0, 6, 10, -1)
rightFin = new bodyPoint(0, 0, 6, 10, -1)

lowFinAnchorIndex = 4;
lowLeftFin =  new bodyPoint(0, 0, 3, 5, -1)
lowRightFin = new bodyPoint(0, 0, 3, 5, -1)

drawOutline = false;
fishCol = make_colour_rgb(237, 65, 75)
stripeCol = make_colour_rgb(240, 240, 220)

bodyPoints = [
	new bodyPoint(0, 0, 10, 10, -1),
	new bodyPoint(0, 0, 9,  9, -1),
	new bodyPoint(0, 0, 8,  8, -1),
	new bodyPoint(0, 0, 7,  7, -1),
	new bodyPoint(0, 0, 6,  6, -1),
	new bodyPoint(0, 0, 5,  5, -1),
	new bodyPoint(0, 0, 4,  4, -1),
	new bodyPoint(0, 0, 3,  3, -1),
	new bodyPoint(0, 0, 3,  3, -1),
]

function addSpdBuff(sped, spedTime) {
	oPlayer.additionalSpd = sped
	oPlayer.additionalSpdDuration = spedTime
}

