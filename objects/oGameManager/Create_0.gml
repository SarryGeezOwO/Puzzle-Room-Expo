global.minigames = ds_map_create()
global.stopGameTime = false
global.gameTime = 180 // 3 Minutes or something IDK

global.InsideMinigame = false

ds_map_add(global.minigames, -69, Room1)
function addGame(g_id, type) {
	ds_map_add(global.minigames, g_id, type)	
}


// Types are also based on sprite index
addGame(0, r_lionHunt)

room_to_load = -1
lastPlayerPos = [-1, -1]
loadPlayerPos = false

function load_game(g_id)
{
	oGameManager.lastPlayerPos = [oPlayer.x, oPlayer.y]
	oGameManager.room_to_load = g_id
	global.InsideMinigame = true
	room_goto(r_loading)
}

function goback_game() 
{
	oGameManager.loadPlayerPos = true
	oGameManager.room_to_load = -69;
	global.InsideMinigame = false
	global.stopGameTime = false
	room_goto(r_loading)
}