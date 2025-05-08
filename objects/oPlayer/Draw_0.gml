// Draw step ahead
/*
draw_set_colour(c_yellow);
draw_circle(
	x + lookAheadPoint[0],
	y + lookAheadPoint[1],
	2, true
)
*/

// var scaledPos = scale_position_by_vector(lookDir, vaccumMaxRange, [x, y])
// draw_line_width(x, y, scaledPos[0], scaledPos[1], 3)

// Vaccum gun
draw_sprite_ext(
	sVacum, -1, leftFin.bx, leftFin.by,
	0.5, 0.5, unit_vector_to_degree(input[0], input[1]), c_white, 1
)

var outlineThickness = 2

// Outline (IDK how to shader
draw_set_colour(c_black);
array_foreach(bodyPoints, function(val, index) {
	draw_circle(val.bx, val.by, val.bw + 2, drawOutline)
})

// Outline Fins
var anchor = bodyPoints[finAnchorIndex];
draw_circle(leftFin.bx, leftFin.by, leftFin.bw + outlineThickness, drawOutline);
draw_line_width(anchor.bx, anchor.by, leftFin.bx, leftFin.by, 4);

draw_circle(rightFin.bx, rightFin.by, rightFin.bw + outlineThickness, drawOutline);
draw_line_width(anchor.bx, anchor.by, rightFin.bx, rightFin.by, 4);

// low
// Fins outline
var anchor2 = bodyPoints[lowFinAnchorIndex];
draw_circle(lowLeftFin.bx, lowLeftFin.by, lowLeftFin.bw + outlineThickness, drawOutline);
draw_circle(lowRightFin.bx, lowRightFin.by, lowRightFin.bw + outlineThickness, drawOutline);

// Tail Outline
var t = bodyPoints[array_length(bodyPoints)-1]
var unitV = degree_to_unit_vector(t.a)
var endTailV = [
	-unitV[0], -unitV[1]
]
var endTail = scale_position_by_vector(endTailV, 12, [t.bx, t.by])
draw_line_width(t.bx, t.by, endTail[0], endTail[1], 6)


// --------------------------------

// Draw bodypoints
draw_set_colour(fishCol);
for (var i = array_length(bodyPoints)-1; i >= 0; i--) {
	var body = bodyPoints[i];
	draw_circle(body.bx, body.by, body.bw, drawOutline)	
}

// Tail
endTail = scale_position_by_vector(endTailV, 10, [t.bx, t.by])
draw_line_width(t.bx, t.by, endTail[0], endTail[1], 3)

// Fins
draw_set_colour(fishCol);
draw_circle(leftFin.bx, leftFin.by, leftFin.bw, drawOutline);
draw_line_width(anchor.bx, anchor.by, leftFin.bx, leftFin.by, 4);

draw_circle(rightFin.bx, rightFin.by, rightFin.bw, drawOutline);
draw_line_width(anchor.bx, anchor.by, rightFin.bx, rightFin.by, 4);

// low
// Fins
draw_circle(lowLeftFin.bx, lowLeftFin.by, lowLeftFin.bw, drawOutline);
draw_circle(lowRightFin.bx, lowRightFin.by, lowRightFin.bw, drawOutline);

// Stripes
draw_set_colour(stripeCol);
for (var i = array_length(bodyPoints)-4; i > 0; i-=2) {
	var body = bodyPoints[i];
	var vec = degree_to_unit_vector(body.a);
	var sTop = perpendicular_ccw(vec[0], vec[1])
	var sBot = perpendicular_cw(vec[0], vec[1])
	
	sTop = scale_position_by_vector(sTop, body.bw, [body.bx, body.by])
	sBot = scale_position_by_vector(sBot, body.bw, [body.bx, body.by])
	draw_line_width(sTop[0], sTop[1], sBot[0], sBot[1], 5)
}

// Eyes
draw_set_colour(c_black)
draw_circle(leftEye.bx, leftEye.by, leftEye.bw, false);
draw_circle(rightEye.bx, rightEye.by, rightEye.bw, false);


// Vaccum Sucking Shader or something like that
draw_set_colour(c_white);