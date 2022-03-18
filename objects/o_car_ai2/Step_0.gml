//Destroy car on touch with destroyer 
if(place_meeting(x,y, o_car_destroyer)){
	instance_destroy(self)
}

// Have each dynamic instance run the following code
with (o_car_ai2)
{
	if(hit == false){
		// Put direction in front of the car
		var dir = point_direction(x, y, x, y + decider);
		//keep rotation the same
		phy_rotation = direc
		// Apply the impulse to the position the dynamic instance occupies, using the previously calculated direction to set the force part of the vector
		physics_apply_impulse(x, y, lengthdir_x(speed_var/2.5, dir), lengthdir_y(speed_var/2.5, dir));
	}
}

//Calculate hardness of the hit
if(hit == false) {
	action_set_relative(1);
	var __b__;
	__b__ = action_if_variable(hp, 1, 1);
	if __b__
	{
	{
	//Reduce cars health 
	global.health -= collision_damage
	hit = true
	}
	}
	action_set_relative(0);
}
