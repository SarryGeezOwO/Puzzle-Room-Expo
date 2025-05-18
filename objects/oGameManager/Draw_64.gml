// Controller detection
var inputType = (hasController ? sController : sKeyboard)
draw_sprite_ext(inputType, 0, ROOM_WIDTH-30, 25, 0.3, 0.3, 0, c_white, 1)