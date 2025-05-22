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
	// Participating on this game will reduce your time by 20 sec
	
	// Simply destroy this lmao
	if (ITEM_ID != -1) {
		oGameManager.addItemInventory(ITEM_ID, COUNT)	
	}
	instance_destroy()
}