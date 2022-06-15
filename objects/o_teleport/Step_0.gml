
if(place_meeting(x,y,obj_car)){
	TransitionStart(targetRoom, sq_fade_out, sq_fade_in)
	//obj_car.x = targetX
	//obj_car.y = targetY	
	global.saved_speed_x = obj_car.phy_speed_x
	global.saved_speed_y = obj_car.phy_speed_y
	global.saved_rotation = obj_car.phy_rotation
}

