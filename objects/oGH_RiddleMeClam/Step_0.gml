var wKey = keyboard_check_pressed( ord("W") )
var sKey = keyboard_check_pressed( ord("S") )
var press = keyboard_check_pressed( vk_space )

if (oGameManager.hasController) {
	var dev = oGameManager.devices[0]
	wKey = gamepad_button_check_pressed( dev, gp_padu )
	sKey = gamepad_button_check_pressed( dev, gp_padd )
	press = gamepad_button_check_pressed( dev, gp_face1 )
}

if (!oMG_EndUI.isGameOver && !global.isMenuOpen) {
	selected += sKey - wKey
	if (selected < 0) selected = array_length(choices)-1
	else if (selected > array_length(choices)-1) selected = 0	
}

if ((sKey || wKey) && !oMG_EndUI.isGameOver && !global.isMenuOpen) {
	audio_play_sound(sndMenuSelectMove, 1, false, 1.25)
}

// Submitted
if (press && !oMG_EndUI.isGameOver && !global.isMenuOpen) {
	var eval = evaluate(choices[selected])
	array_push(answered, questionI)
	array_push(assBool, eval)
	audio_play_sound((eval ? sndCorrect : sndWrong), 1, false)
	
	if (eval) oMG_EndUI.gameScore += 2000 // Total of 6000
	if (array_length(answered) >= 3) {
		// Game over
		oMG_EndUI.isGameOver = true
	}
	else reset()
}

// Typewriter effect
if (curTextLen < string_length(questionT)) {
	if (textTimer > 0) {
	textTimer -= delta_time/1000	
	}
	else {
		curTextLen++
		textTimer = 10 // miliseconds	
		if ((clickCount mod 3) == 0) {
			audio_play_sound(
				sndTypeWriter_click, 
				5,
				false, 
				0.5,
				random_range(0, 0.1), 
				random_range(0.75, 1.25)
			)	
		}
		clickCount++
	}	
}
else {
	// Reached end	
	if (!hasReachEnd) {
		audio_play_sound(sndTypeWriter_pling, 4, false, 1)
		hasReachEnd = true
	}
}

/*
if (keyboard_check_pressed( vk_space ))
{
	questionI = irandom_range(0, array_length(global.riddle_questions)-1)
	answer = global.riddle_answers[questionI]
	questionT = global.riddle_questions[questionI]	
	curTextLen = 0
	textTimer = 10
	hasReachEnd = false
	clickCount = 0
}
*/