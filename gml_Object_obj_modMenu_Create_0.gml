//reset current level value when opening the modmenu
//to prevent the game from getting stuck when loading the same level twice in a row
//this line of can just be added near the top of the script
global.currentLevel = ""
//reset hub values to prevent crash when exiting using the pause menu in editor mode
global.fromHub = 0
global.hubLevel = ""