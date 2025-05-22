questionI = irandom_range(0, array_length(global.riddle_questions)-1)
questionT = global.riddle_questions[questionI]
hasReachEnd = false
clickCount = 0

answered = [] // indices that already appeared
assBool = []

selected = 0
choices = [];
for (var i = 0; i < 3; i++) {
    var r = getRandI();
    
    // Re-roll while it's the answer OR a duplicate
    while (r == questionI || array_contains(choices, r)) {
        r = getRandI();
    }

    array_push(choices, r);
}
array_push(choices, questionI);
choices = array_shuffle(choices)

function getText(index) {
	return global.riddle_answers[index]	
}

function toLetter(index) {
	switch(index) {
		case 0: return "A"	
		case 1: return "B"	
		case 2: return "C"	
		case 3: return "D"	
		case 4: return "E"
		default: return "?"
	}
}

function getRandI() {
    return irandom_range(0, array_length(global.riddle_answers) - 1);
}

function evaluate(index) {
	return oGH_RiddleMeClam.questionI == index
}

function reset() {
	var qr = irandom_range(0, array_length(global.riddle_questions)-1)
	while (array_contains(oGH_RiddleMeClam.answered, qr)) {
		qr = irandom_range(0, array_length(global.riddle_questions)-1)
	}
	
	oGH_RiddleMeClam.questionI = qr
	oGH_RiddleMeClam.questionT = global.riddle_questions[oGH_RiddleMeClam.questionI]
	oGH_RiddleMeClam.curTextLen = 0
	oGH_RiddleMeClam.textTimer = 10
	oGH_RiddleMeClam.hasReachEnd = false
	oGH_RiddleMeClam.clickCount = 0	
	
	oGH_RiddleMeClam.choices = [];
	for (var i = 0; i < 3; i++) {
	    var r = getRandI();
    
	    // Re-roll while it's the answer OR a duplicate
	    while (r == oGH_RiddleMeClam.questionI || array_contains(oGH_RiddleMeClam.choices, r)) {
	        r = getRandI();
	    }

	    array_push(oGH_RiddleMeClam.choices, r);
	}
	array_push(oGH_RiddleMeClam.choices, oGH_RiddleMeClam.questionI);
	oGH_RiddleMeClam.choices = array_shuffle(oGH_RiddleMeClam.choices)
}


curTextLen = 0
textTimer = 0
maxLineLen = 40