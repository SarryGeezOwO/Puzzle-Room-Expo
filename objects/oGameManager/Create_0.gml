// Maps / Dictionaries
global.menuOptions = ds_map_create() // index, Function
global.HTP_Names = ds_map_create() // index, Name
global.minigames = ds_map_create()
global.interactableMap = ds_map_create()

global.gameTime = 180 // 3 Minutes or something IDK
global.stopGameTime = false
global.InsideMinigame = false
global.isDebugMode = true
global.isMenuOpen = false

// Settings shit (addd more to future if needed)
global.audioMute = false
global.gameFullScreen = false

global.htpSelected = 0
global.htpOpened = false
global.settingsOpen = false
global.managerCount = 0;
with(oGameManager) {
	global.managerCount++;
}

// Load settings
window_set_fullscreen(global.gameFullScreen)

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

// interactables Map 
function addInteractable(tag_id, obj_type) {
	ds_map_add(global.interactableMap, tag_id, obj_type)
}

// Call Interactable
function callInteract(tag_idd) {
	var obj = ds_map_find_value(global.interactableMap, tag_idd)
	obj.invoke()
}

// Minigame map
ds_map_add(global.minigames, -69, r_Overworld)
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

// Types are also based on sprite index
addGame(0, r_lionHunt)
addGame(1, r_trashSort)

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
	room_goto(r_MainMenu)
	oGameManager.room_to_load = -1
	oGameManager.lastPlayerPos = [-1, -1]
	oGameManager.loadPlayerPos = false
	global.gameTime = 180 // 3 Minutes or something IDK
	global.stopGameTime = false
	global.InsideMinigame = false
	global.isMenuOpen = false
	global.htpOpened = false
	global.settingsOpen = false
	ds_map_clear(global.interactableMap)
}