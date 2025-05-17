selectedIndex = 0
inpDownTime = 0
settingCount = 4; // How many buttons including apply and cancel
inpUpTime = 0.125

offset = 45
cx = room_width / 2
cy = (room_height / 2) - 70

// This is the order duh
htpCurrentFrame = 0
htpFrameTimer = 0
htpTextOffset = 320
htpTextMax = 620
htpTime = 0
htpTimeForward = true
htpCount = array_length(global.htpImages)
// How to play will only cover the overworld controls, minigames are shown for the first time 
// opening that minigame

settingsOpenedFirst = false
tempAudioMute = global.audioMute
tempFullscreen = global.gameFullScreen

bgColor = make_colour_rgb(51, 129, 255)
selectCol = make_colour_rgb(60, 100, 163)