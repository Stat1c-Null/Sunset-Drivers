/// @description Bust alarm
if global.mphSpeed < 15 { 
	global.gameover = true
	global.busted = true
	busting_player = false	
} else {
	busting_player = false	
}