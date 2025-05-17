selectedIndex = 0
inpDownTime = 0
settingCount = 4; // How many buttons including apply and cancel
inpUpTime = 0.15

offset = 45
cx = room_width / 2
cy = (room_height / 2) - 70

// This is the order duh
htpTextOffset = 320
htpTextMax = 600
htpTime = 0
htpTimeForward = true
htpSelected = 0
htpImages = [HTP_Movement, HTP_Interactable, HTP_Minigame]
htpCount = array_length(htpImages)
// How to play will only cover the overworld controls, minigames are shown for the first time 
// opening that minigame

settingsOpenedFirst = false
tempAudioMute = global.audioMute
tempFullscreen = global.gameFullScreen

bgColor = make_colour_rgb(51, 129, 255)
selectCol = make_colour_rgb(60, 100, 163)