global.minigames = ds_map_create();

function addGame(g_id, type) {
	ds_map_add(global.minigames, g_id, type)	
}

// Types are also based on sprite index
addGame(0, r_lionHunt)

room_to_load = -1
function load_game(g_id)
{
	room_to_load = g_id
	room_goto(r_loading)
}