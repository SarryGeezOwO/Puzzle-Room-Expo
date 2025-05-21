draw_text(20, 20, string(getCurrPipe().get_rotated_connections()))
draw_text(20, 45, string(is_flow_valid(gridSize, StartPipe.pos, EndPipe.pos, StartPipe.requiredConn, EndPipe.requiredConn)))
var scale = 2
var ofst = 0
var sprSize = (sprite_get_width(sPipes) * scale) + ofst
var rectSize = sprSize/2

var cx = room_width/2 - (gridSize * rectSize)
var cy = room_height/2 - (gridSize * rectSize)
draw_set_colour(c_black)
draw_set_alpha(0.5)

draw_roundrect_ext(
	(cx+(selectedPipe[1]*sprSize)+rectSize)-rectSize, (cy+(selectedPipe[0]*sprSize)+rectSize)-rectSize,
	(cx+(selectedPipe[1]*sprSize)+rectSize)+rectSize, (cy+(selectedPipe[0]*sprSize)+rectSize)+rectSize, 10, 10, false
)

for (var i = 0; i < gridSize; i++) {
	for (var j = 0; j < gridSize; j++) {
		
		if (!pipes[i][j].isPipe) {
			continue
		}
		
		draw_set_alpha(0.5)
		draw_set_colour(c_white)
		var drawBG = false
		var isStart = false
		if (StartPipe.pos[0] == i && StartPipe.pos[1] == j) {draw_set_colour(c_green); drawBG = true; isStart = true}
		if (EndPipe.pos[0] == i && EndPipe.pos[1] == j) {draw_set_colour(c_red); drawBG = true}
		
		if (drawBG) {
			var arr = (isStart) ? StartPipe.pos : EndPipe.pos
			draw_roundrect_ext(
				(cx+(arr[1]*sprSize)+rectSize)-rectSize,
				(cy+(arr[0]*sprSize)+rectSize)-rectSize,
				(cx+(arr[1]*sprSize)+rectSize)+rectSize,
				(cy+(arr[0]*sprSize)+rectSize)+rectSize,
				10, 10, false
			)	
		}
		
		draw_set_alpha(1)
		draw_sprite_ext(
			sPipes, pipes[i][j].spr_indx, 
			cx+(j*sprSize)+rectSize, cy+(i*sprSize)+rectSize, scale, scale,
			-pipes[i][j].rotation, c_white, 1
		)	
	}
}

draw_set_colour(c_white)