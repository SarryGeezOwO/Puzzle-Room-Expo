// Maps / Dictionaries
global.menuOptions = ds_map_create() // index, Function
global.HTP_Names = ds_map_create() // index, Name
global.minigames = ds_map_create()
global.interactableMap = ds_map_create()
global.inventoryMap = ds_map_create() // Item_ID, Quantity
global.itemDescMap = ds_map_create() // Item_ID, Description

// Resetable
global.hearts = 3
global.isGameOver = false // Is it finally over joe?? this is for both win and loss
global.isGameWon = false // Determines the text if won or loss
global.gameTrueScore = 0 // Let's go with Thousands for average sake
global.gameTime = 180 // 3 Minutes or something IDK
global.stopGameTime = false
global.InsideMinigame = false
global.isDebugMode = false
global.isMenuOpen = false
global.isInventoryOpen = false
itemDrawQueue = ds_queue_create()
itemDrawTimer = 0

audio_play_sound(sndBG, 0, true, 0.6)

// Disable mouse cursor
window_set_cursor(cr_none)

// Settings shit (addd more to future if needed)
global.audioMute = false
global.gameFullScreen = false

global.htpSelected = 0
global.htpOpened = false
global.settingsOpen = false
global.managerCount = 0;
global.baseRoom = r_Overworld1 // Man, this will update on start and exit of game
if (!variable_global_exists("htpImages")) {
	global.htpImages = [
		HTP_Movement, HTP_Interactable, HTP_Minigame,
		HTP_TrashDisposal, HTP_EndGoal, 
		HTP_LionHunt, HTP_TrashSorta, HTP_PipeLeaks,
		HTP_Underfishing, HTP_RiddleMeClam
	]	
}
with(oGameManager) {
	global.managerCount++;
}

menuTimer = 0
resetMenu = false
uuid = irandom_range(0, 9999)
if (global.managerCount == 1) { // there's only one manager
	global.gameManagerUUID = uuid;	
	global.hasGameManager = true;
}

devices = [];
hasController = false;
isMainMenu = room == r_MainMenu 
menuExitCalled = false

// interactables Map 
function addInteractable(tag_id, obj_type) {
	ds_map_add(global.interactableMap, tag_id, obj_type)
}

// Call Interactable
function callInteract(tag_idd) {
	var obj = ds_map_find_value(global.interactableMap, tag_idd)
	obj.invoke()
}

// Inventory Map
function addItemInventory(item_ID, appendCount) {
	if (ds_map_exists(global.inventoryMap, item_ID)) {
		var oldCount = ds_map_find_value(global.inventoryMap, item_ID)
		ds_map_replace(global.inventoryMap, item_ID, oldCount + appendCount)
	}
	else {
		// First time getting it
		itemDrawTimer = 2.5
		ds_map_add(global.inventoryMap, item_ID, appendCount)	
		ds_queue_enqueue(itemDrawQueue, item_ID)
	}
}

function removeItemInventory(item_id, count) {
	if (ds_map_exists(global.inventoryMap, item_id)) {
		var oldCount = ds_map_find_value(global.inventoryMap, item_id)
		if (oldCount - count <= 0) {
			// Simply remove this item on the map
			ds_map_delete(global.inventoryMap, item_id)
			return
		}
		ds_map_replace(global.inventoryMap, item_id, oldCount - count)
	}
}

// Get Item description
function getItemDesc(item_id) {
	return ds_map_find_value(global.itemDescMap, item_id)	
}

// get Item on Inventory
function getItemCountInventory(item_ID) {
	return ds_map_find_value(global.inventoryMap, item_ID)	
}

// Minigame map
function addGame(g_id, type) {
	ds_map_add(global.minigames, g_id, type)	
}

// Menu function mapping
function addMenuFunction(index, func) {
	ds_map_add(global.menuOptions, index, func)
}

// Call Menu function
function callMenuFunc(index) {
	var func = ds_map_find_value(global.menuOptions, index)
	func()
}

// HTP function mapping
function addHTPName(index, name) {
	ds_map_add(global.HTP_Names, index, name)
}

// Get HTP Name
function getHTPName(index) {
	return ds_map_find_value(global.HTP_Names, index)
}

addHTPName(0, "Player Movement")
addHTPName(1, "Interactable Objects")
addHTPName(2, "Minigames")
addHTPName(3, "Trash Disposal")
addHTPName(4, "End Goal")
addHTPName(5, "MG Hunt Hunt Lionfish")
addHTPName(6, "MG Trash Sorta")
addHTPName(7, "MG Pipe Leaks")
addHTPName(8, "MG Underfishing")
addHTPName(9, "MG Riddle me Clam")

// Types are also based on sprite index
ds_map_add(global.minigames, -69, global.baseRoom)
addGame(0, r_lionHunt)
addGame(1, r_trashSort)
addGame(2, r_underfishing)
addGame(3, r_pipeLeak)
addGame(4, r_RiddleMeClam)

// ItemMap desc
ds_map_add(global.itemDescMap, ITEM_ID_TRASH, "A plain old trash.")	
ds_map_add(global.itemDescMap, ITEM_ID_KEY_FRAG, "A Fragment of an Exit Pass.")	

room_to_load = -1
lastPlayerPos = [-1, -1]
loadPlayerPos = false

function load_game(g_id)
{
	oGameManager.lastPlayerPos = [oPlayer.x, oPlayer.y]
	oGameManager.room_to_load = g_id
	global.InsideMinigame = true
	global.stopGameTime = true
	room_goto(r_loading)
}

function goback_game() 
{
	oGameManager.loadPlayerPos = true
	oGameManager.room_to_load = -69;
	global.stopGameTime = false
	global.InsideMinigame = false
	global.stopGameTime = false
	room_goto(r_loading)
}

addMenuFunction(0, menu_resume)
addMenuFunction(1, menu_HTP)
addMenuFunction(2, menu_settings)
addMenuFunction(3, menu_exit)

function menu_resume() {
	global.isMenuOpen = false	
}

function menu_HTP() {
	global.htpOpened = true
}

function menu_settings() {
	global.settingsOpen = true
}

function menu_exit() {	
	oGameManager.room_to_load = -1
	oGameManager.lastPlayerPos = [-1, -1]
	oGameManager.loadPlayerPos = false
	global.gameTime = 180 // 3 Minutes or something IDK 
	global.stopGameTime = false
	global.InsideMinigame = false
	global.isMenuOpen = false
	global.htpOpened = false
	global.settingsOpen = false
	global.isInventoryOpen = false
	global.gameTrueScore = 0
	global.isGameOver = false
	global.isGameWon = false
	global.hearts = 3
	ds_map_clear(global.inventoryMap)
	ds_map_clear(global.interactableMap)
	ds_queue_clear(itemDrawQueue) 

	room_goto(global.baseRoom)
	room_persistent = false // is in the overworld!!!
	menuExitCalled = true
}