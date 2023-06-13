if(place_meeting(x,y, obj_car)) {
	sprite_index = s_bill_destroy
	destroyed = true
	if(sound_played == false) {
		audio_play_sound(a_pickup, 800, false)
		sound_played = true
	}
}

if(destroyed)
{
	if(image_index >= 23) {
		global.current_dollars += value
		instance_destroy(self)	
	}	
}