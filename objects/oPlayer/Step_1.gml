var timeAmount = delta_time / 1000000
inpTimer += (inpTimeBack) ? -timeAmount : timeAmount
if (inpTimer >= 1) 
	inpTimeBack = true
else if (inpTimer <= -1)
	inpTimeBack = false


if (additionalSpdDuration > 0) {
	additionalSpdDuration -= delta_time / 1000 // milliseconds
}
else {
	additionalSpd = 0	
}