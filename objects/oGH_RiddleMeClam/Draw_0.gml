var cx = room_width/2
var cy = room_height/2

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(f_big)

var visibleText = string_copy(questionT, 1, curTextLen);

var lines = [];
var i = 1; // GML strings are 1-indexed

while (i <= string_length(visibleText)) {
	var remaining = string_length(visibleText) - i + 1;
	var chunkLen = min(maxLineLen, remaining);
	var segment = string_copy(visibleText, i, chunkLen);

	// If the segment ends mid-word, backtrack to last space
	if (chunkLen == maxLineLen && i + chunkLen <= string_length(visibleText)) {
		var lastSpace = 0;
		for (var j = chunkLen; j >= 1; j--) {
			if (string_char_at(segment, j) == " ") {
				lastSpace = j;
				break;
			}
		}

		if (lastSpace > 0) {
			chunkLen = lastSpace;
			segment = string_copy(visibleText, i, chunkLen);
		}
	}

	array_push(lines, string_trim(segment));
	i += chunkLen;
}

// Draw each line
for (var l = 0; l < array_length(lines); l++) {
	draw_text(cx, (cy + l * 28) - 200, lines[l]);
}

// Draw Selection
draw_set_colour(make_colour_rgb(25, 25, 25))
draw_roundrect_ext(
	240, (cy+(selected*36)+100)-20,
	1000, (cy+(selected*36)+100)+20,
	10, 10, false
)
draw_set_colour(c_white)

// Draw Choices
draw_set_halign(fa_left)
array_foreach(choices, function(val, ind) {
	var cy = room_height/2
	draw_text(250, cy+(ind*36)+100, toLetter(ind)+". "+getText(val));
})

// Draw corrects slots
var ofst = 74
draw_set_colour(make_colour_rgb(25, 25, 25))
draw_set_alpha(0.5)
for (var l = 0; l < 3; l++) {
	draw_roundrect_ext(
		(cx+(l * ofst)-ofst)-37, 115-37,
		(cx+(l * ofst)-ofst)+36, 115+36,
		10, 10, false
	)
}


// Draw corrects
array_foreach(assBool, function(val, ind) {
	var cx = room_width/2
	var ofst = 74
	draw_sprite(sAnsFeedback, !val, cx+(ind * ofst)-ofst, 115)
})

draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_font(f_default)
draw_set_valign(fa_top)