draw_set_color(c_black)

draw_line(100, 50, 100, 150)
draw_line(50, 100, 150, 100)

draw_circle(100, 100, 50, true)
draw_circle(100 + (input[0] * 50), 100 + (input[1] * 50), 20, false)

draw_text(20, 170, "InputX: " + string(input[0]))
draw_text(20, 186, "InputY: " + string(input[1]))

draw_set_color(c_white)
