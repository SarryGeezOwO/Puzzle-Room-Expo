// Keyboard, Controller
#macro CTR_SPACE_CROSS	0 
#macro CTR_F_CIRCLE		1
#macro CTR_E_SQUARE		2
#macro CTR_TAB_TRIANGLE	3
#macro CTR_ESC_OPTIONS	4
#macro CTR_A_LEFT		5
#macro CTR_S_DOWN		6
#macro CTR_D_RIGHT		7
#macro CTR_W_UP			8

// Items
#macro ITEM_ID_TRASH	0
#macro ITEM_ID_KEY_FRAG	1

#macro ROOM_WIDTH 1366
#macro ROOM_HEIGHT 768

// Answer is the same index of the quesiton
global.riddle_questions = [
  "What is the largest ocean on Earth?",
  "It is the world's largest living structure that can even be seen from space",
  "This is also known as the twilight zone",
  "It is the deepest known area of the ocean",
  "It is the world's smallest and shallowest ocean",
  "Its name came from the Greek word Atlantikos which at the time means 'Sea of Atlas'",
  "It is a seaweed extract used as an emulsifier in a variety of common products like peanut butter, toothpaste, and cosmetics",
  "These are magical sea lions who could take human form from the Scottish Myths",
  "It is the deepest part of the ocean",
  "It is the longest mountain range on the planet",
  "It is the second most polluted ocean",
  "It is the only sea without a land border",
  "Where is the largest 'dead-zone' on the planet located?"
];

global.riddle_answers = [
  "Pacific Ocean",
  "Great Barrier Reef",
  "Mesopolagic",
  "Mariana Trench",
  "Arctic Ocean",
  "Atlantic Ocean",
  "Carrageenan",
  "Selkies",
  "Challenger Deep",
  "Mid-Ocean Ridge",
  "Indian Ocean",
  "Sargasso Sea", 
  "Black Sea"
];



function substr(str, ofst, len) {
	return string_copy(str, ofst, len)
}

function getCamX() {
	return camera_get_view_x(view_get_camera(0))	
}

function getCamY() {
	return camera_get_view_y(view_get_camera(0))	
}

function draw_controls(cx, cy, isController, ctrl_id) {
	draw_sprite_ext(
		(isController ? sPS_Button : sKey_Button), ctrl_id, 
		cx, cy, 0.8, 0.8, 0, c_white, 1
	)
}

// No way in hell we're reaching past 10 minutes
function time_format(_minutes, _seconds) {
    var _leading_space_format = string(_minutes) + ":" + string_format(_seconds, 2, 0);
    var _leading_zero_format = string_replace_all(_leading_space_format, " ", "0");
    return _leading_zero_format;
}

function draw_item_count(cx, cy, item_id, count) {
	draw_set_font(f_small)
	draw_sprite_ext(sItem, item_id, cx-10, cy, 1, 1, 0, c_white, 1)
	draw_text(cx+10, cy, string(count)+"x")
	draw_set_font(f_default)
}

// Useful for displaying the item obtained
function draw_item_tooltip(cx, cy, head, text, item_id) {
	draw_set_colour(c_black)
	draw_set_alpha(0.85)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	// Width depends on text length
	var longest = (string_length(head) > string_length(text)) ? head : text
	var width = string_width(longest) + 16
	
	draw_roundrect_ext(cx - width/2, cy - 42, cx + width/2, cy + 42, 10, 10, false)
	draw_set_alpha(1)
	
	draw_set_font(f_small)
	draw_sprite_ext(sItem, item_id, cx, cy - 20, 1, 1, 0, c_white, 1)
	
	draw_set_colour(c_gray)
	draw_text(cx, cy+8, head)
	
	draw_set_colour(c_white)
	draw_text(cx, cy + 28, text)
	
	draw_set_font(f_default)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

function draw_tooltip_control(cx, cy, w, isController, ctrl_id, text) {
	// Assuming text is going from left to right
	var size = 30 // Width
	draw_set_alpha(0.3)
	draw_set_colour((isController) ? c_white : c_black)
	draw_roundrect_ext(cx-32, cy-16, cx+w, cy+16, 10, 10, false)
	draw_set_alpha(1)
	
	draw_set_colour((isController) ? c_black : c_white)
	draw_sprite_ext((isController ? sPS_Button : sKey_Button), 
		ctrl_id, cx, cy, 0.5, 0.5, 0, c_white, 1)
	draw_text(cx + size, cy, text)
	
	// reset to Default
	draw_set_colour(c_white)
}