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
	draw_text(cx, (cy + l * 28) - 100, lines[l]);
}

draw_set_font(f_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)