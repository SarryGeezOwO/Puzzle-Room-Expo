// Draw Controls 
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(f_small)
var botm = room_height - 25
var tto = 40
var isPS = oGameManager.hasController

draw_tooltip_control(38, botm-(tto*3), 80, isPS, CTR_W_UP, "Up")
draw_tooltip_control(38, botm-(tto*2), 80, isPS, CTR_S_DOWN, "Down")
draw_tooltip_control(38, botm-(tto),   80, isPS, CTR_A_LEFT, "Left")
draw_tooltip_control(38, botm,         80, isPS, CTR_D_RIGHT, "Right")
draw_tooltip_control(156,botm,        100, isPS, CTR_SPACE_CROSS, "Shoot")

draw_set_font(f_default)
draw_set_valign(fa_top)