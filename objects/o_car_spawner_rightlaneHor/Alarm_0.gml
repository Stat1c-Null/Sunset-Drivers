

//Check if player is not near by
var distToPlayer = distance_to_object(obj_car)
moveTowardPlayer = (distToPlayer > min_dist)
if(moveTowardPlayer){
	//Create new car
	chance = random_range(1, 100)
	if(chance > 0)
		with(instance_create_layer(x + offset, y, "RightLaneHor", o_car_ai2))
		{
			phy_rotation = -180	
		}
	else
		show_debug_message("Not created right lane")
} else {
	show_debug_message("Player too close")
}

alarm[0] = room_speed * timer_length



