up_k = keyboard_check( ord("W") ) || keyboard_check( vk_up )
down_k = keyboard_check( ord("S") ) || keyboard_check( vk_down )
left_k = keyboard_check( ord("A") ) || keyboard_check( vk_left )
right_k = keyboard_check( ord("D") ) || keyboard_check( vk_right )

inp[0] = right_k - left_k;
inp[1] = down_k - up_k;

inp = normalize_vector(inp[0], inp[1])
vx = inp[0] * spd;
vy = inp[1] * spd;

x += vx;
y += vy;

if (oGH_LionFishHunt.gameOver) {
	instance_destroy(id, false)	
}