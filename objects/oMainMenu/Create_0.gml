time = 0
timeForward = true
amplitude = 5
offset = 0

fadeTimer = 0
startFade = false

selectedTag = 0
tooltip = "..."

inputGoodToGo = false

// Global
selectCol = make_colour_rgb(60, 100, 163)
bgColor = make_colour_rgb(51, 129, 255)
GUIOffset = 50
cx = room_width / 2
cy = room_height / 2
selectedIndex = 0
limit = 0;

if (!variable_global_exists("htpImages")) {
	global.htpImages = [HTP_Movement, HTP_Interactable, HTP_Minigame]
}

// HTP
htpCurrentFrame = 0
htpFrameTimer = 0
isHTPOpen = false
htpTextOffset = 320
htpTextMax = 620
htpCount = array_length(global.htpImages)
// How to play will only cover the overworld controls, minigames are shown for the first time 
// opening that minigame

// Settings
isSettingOpen = false
tempAudioMute = variable_global_exists("audioMute") ? global.audioMute : false
tempFullscreen = variable_global_exists("gameFullScreen") ? global.gameFullScreen : false	

/*
global.audioMute = false
global.gameFullScreen = false
*/