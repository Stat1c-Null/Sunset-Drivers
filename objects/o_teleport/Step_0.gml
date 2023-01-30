
if(place_meeting(x,y,obj_car)){
	global.teleport_collision = true
	obj_car.levels_done += 1
	//obj_car.x = targetX
	//obj_car.y = targetY
	//obj_car.phy_rotation = 270
	TransitionStart(targetRoom, sq_fade_out, sq_fade_in)
}

show_debug_message(global.day)