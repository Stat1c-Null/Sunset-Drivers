//Start music if it isnt already on

/*if(not audio_is_playing(a_ChroniclesOfThePit)) {
	audio_play_sound(a_ChroniclesOfThePit, 1000, true)
}*/
// Stop music in case of the game over
if(global.gameover or global.game_state == "menu") {
	//audio_stop_sound(a_ChroniclesOfThePit)
	music_play = false
}

if(global.game_state == "game") {
	music_play = true
}

if(current_song == noone) {
	num_songs = array_length(songs)
	song_choice = random_range(0, num_songs - 1)
	final_song = round(song_choice)
	current_song = songs[final_song]
	audio_play_sound(current_song, 1000, true)
}

if(not audio_is_playing(current_song)) {
	current_song = noone
}