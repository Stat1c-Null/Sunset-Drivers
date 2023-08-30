
function s_audio_playing(){
	songs = array_create(5, [a_ChroniclesOfThePit, a_wonky_chops, a_dreamy_spungebonk, a_40Minutes])
	songsLength = array_length_1d(songs)
	for (var z = 0; z < songsLength; z++) {
		var song = songs[z]
		show_debug_message(songs[z])
		/*if audio_is_playing(song) {
			return true	
		} else {
			return false	
		}*/
	}
}