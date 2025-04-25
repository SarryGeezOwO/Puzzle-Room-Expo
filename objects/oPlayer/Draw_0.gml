draw_line(100, 50, 100, 150)
draw_line(50, 100, 150, 100)

draw_circle(100, 100, 50, true)
draw_circle(100 + (input[0] * 50), 100 + (input[1] * 50), 20, false)

draw_text(20, 170, "InputX: " + string(input[0]))
draw_text(20, 186, "InputY: " + string(input[1]))

// Draw step ahead
draw_set_colour(c_yellow);
draw_circle(
	lookAheadPoint[0],
	lookAheadPoint[1],
	2, true
)

// Hook gun
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

// --------------------------------

// Draw bodypoints
draw_set_colour(c_orange);
array_foreach(bodyPoints, function(val, index) {
	draw_circle(val.bx, val.by, val.bw, drawOutline)
})

// Fins
draw_circle(leftFin.bx, leftFin.by, leftFin.bw, drawOutline);
draw_line_width(anchor.bx, anchor.by, leftFin.bx, leftFin.by, 4);

draw_circle(rightFin.bx, rightFin.by, rightFin.bw, drawOutline);
draw_line_width(anchor.bx, anchor.by, rightFin.bx, rightFin.by, 4);

// low
// Fins
draw_circle(lowLeftFin.bx, lowLeftFin.by, lowLeftFin.bw, drawOutline);
draw_circle(lowRightFin.bx, lowRightFin.by, lowRightFin.bw, drawOutline);

// Eyes
draw_set_colour(c_black)
draw_circle(leftEye.bx, leftEye.by, leftEye.bw, false);
draw_circle(rightEye.bx, rightEye.by, rightEye.bw, false);

draw_set_colour(c_white);