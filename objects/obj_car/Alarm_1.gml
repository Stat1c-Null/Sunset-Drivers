/// @description Turn Signal Alarm
if (turn_left) {
	if (image_index == 3) {
		image_index = 0 	
	} else {
		image_index = 3	
	}	
} else if(turn_right){
	if (image_index == 4) {
		image_index = 0 	
	} else {
		image_index = 4	
	}
}

alarm[1] = room_speed * signal_timer

