if image_index >= 6 and not colliding_with_player {
	image_index = 4
} 

if colliding_with_player and image_index >= 10 or place_meeting(x, y, obj_car) {
	image_index = 1
	image_speed = 0	
}

if not place_meeting(x,y,obj_car) {
	colliding_with_player = false	
	image_speed = 1
}