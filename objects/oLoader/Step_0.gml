if prog <= 1.4
{
	var r = irandom(6);
	if r != 4
		prog += delta_time / 1000000	
}

if prog >= 1.4
{
	room_goto(ds_map_find_value(global.minigames, oGameManager.room_to_load))
}

d_prog = clamp(prog, 0, 1)