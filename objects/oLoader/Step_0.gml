if prog <= 1.4
{
	var r = irandom(6);
	if r != 4
		prog += delta_time / 1000000	
}

var press = keyboard_check_pressed( ord("F") )
if (oGameManager.hasController) {
	press = gamepad_button_check_pressed(oGameManager.devices[0], gp_face2)
}

if prog >= 1.2 
{
	if (oGameManager.room_to_load == -69) {
		room_goto(ds_map_find_value(global.minigames, oGameManager.room_to_load))	
	}
	else {
		if press {
			room_goto(ds_map_find_value(global.minigames, oGameManager.room_to_load))
		}
	}
}

d_prog = clamp(prog, 0, 1)