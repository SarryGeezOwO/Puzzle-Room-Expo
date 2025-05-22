
if (curTextLen < string_length(questionT)) {
	if (textTimer > 0) {
	textTimer -= delta_time/1000	
	}
	else {
		curTextLen++
		textTimer = 10 // miliseconds	
	}	
}

if (keyboard_check_pressed( vk_space ))
{
	questionI = irandom_range(0, array_length(global.riddle_questions)-1)
	answer = global.riddle_answers[questionI]
	questionT = global.riddle_questions[questionI]	
	curTextLen = 0
	textTimer = 10
}