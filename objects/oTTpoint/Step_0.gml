if isInRange() && oPlayer.isInteracting && oGameManager.getItemCountInventory(ITEM_ID_TRASH) >= 5
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
	// TODO: Throw Trash logic here
	oGameManager.removeItemInventory(ITEM_ID_TRASH, 5)
	oPlayer.addSpdBuff(oPlayer.moveSpd, 5000)
	
	// That's 500 points per thrown
	global.gameTrueScore += 500
	interact_prog = 0;
}