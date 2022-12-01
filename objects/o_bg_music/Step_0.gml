//Start music if it isnt already on
if(not global.music_on) {
	//audio_play_sound(a_ChroniclesOfThePit, 1000, true)
	global.music_on = true
}
// Stop music in case of the game over
if(global.gameover or global.game_state = "menu") {
	audio_stop_sound(a_ChroniclesOfThePit)	
}