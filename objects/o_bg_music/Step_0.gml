//Start music if it isnt already on
if(not audio_is_playing(a_ChroniclesOfThePit)) {
	//audio_play_sound(a_ChroniclesOfThePit, 1000, true)
}
// Stop music in case of the game over
if(global.gameover or global.game_state == "menu") {
	audio_stop_sound(a_ChroniclesOfThePit)	
}