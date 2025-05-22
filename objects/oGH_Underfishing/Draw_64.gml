// Draw Controls 
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(f_small)
var botm = ROOM_HEIGHT - 25
var tto = 40
var isPS = oGameManager.hasController

draw_tooltip_control(38, botm,         180, isPS, CTR_SPACE_CROSS, "Descent/Ascend")

draw_set_font(f_default)
draw_set_valign(fa_top)
