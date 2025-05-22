// Draw Controls 
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(f_small)
var botm = room_height - 25
var tto = 40
var isPS = oGameManager.hasController

draw_tooltip_control(38, botm,         80, isPS, CTR_DIR_STICK, "Move")
draw_tooltip_control(156,botm,        100, isPS, CTR_SPACE_CROSS, "Grab")

draw_set_font(f_default)
draw_set_valign(fa_top)