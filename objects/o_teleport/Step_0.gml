
if(place_meeting(x,y,obj_car)){
	room_goto(targetRoom)
	obj_car.x = targetX
	obj_car.y = targetY	
	global.saved_speed_x = obj_car.phy_speed_x
	global.saved_speed_y = obj_car.phy_speed_y
	global.saved_rotation = obj_car.phy_rotation
}

