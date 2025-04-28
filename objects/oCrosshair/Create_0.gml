up_k = false
down_k = false
right_k = false
left_k = false

spd = 10
vx = 0
vy = 0
inp = [0, 0]

function shoot() {
	if (position_meeting(x, y, [oFish, oLionFish])) {
		instance_destroy(instance_position(x, y, [oFish, oLionFish]), true)
	}
}