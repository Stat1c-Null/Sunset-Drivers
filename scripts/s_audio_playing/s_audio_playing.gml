
function s_audio_playing(){
	songs = [a_ChroniclesOfThePit, a_wonky_chops, a_dreamy_spungebonk, a_40Minutes, a_new_sample]
	songsLength = array_length_1d(songs)
	//show_debug_message(array_get(songs, 1))
	for (var z = 0; z < songsLength; z++) {
		var song = array_get(songs, z)
		if audio_is_playing(song) {
			return song
		}
	}
	return false
}