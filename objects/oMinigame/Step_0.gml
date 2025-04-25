if isInRange() && oPlayer.isInteracting
{
	interact_prog += delta_time / 1000000
}
else {
	if interact_prog != 0
	{
		interact_prog = 0	
	}
}

interact_prog = clamp(interact_prog, 0, interact_prog_max)
if interact_prog >= interact_prog_max {
	oGameManager.load_game(g_id)	
	interact_prog = 0;
}