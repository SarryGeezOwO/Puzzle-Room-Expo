questionI = irandom_range(0, array_length(global.riddle_questions)-1)
answer = global.riddle_answers[questionI]
questionT = global.riddle_questions[questionI]

curTextLen = 0
textTimer = 0
maxLineLen = 40