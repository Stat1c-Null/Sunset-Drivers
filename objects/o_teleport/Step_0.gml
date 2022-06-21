
if(place_meeting(x,y,obj_car)){
	obj_car.phy_speed_x = 0
	obj_car.phy_speed_y = 0
	obj_car.phy_rotation = 0
	global.teleport_collision = true
	TransitionStart(targetRoom, sq_fade_out, sq_fade_in)
	obj_car.x = targetX
	obj_car.y = targetY
	obj_car.phy_rotation = 270
}

