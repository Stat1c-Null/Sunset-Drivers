//Set speed
current_speed = phy_speed
//Deactivate physics if the game is paused
if o_pause_menu.pause == true {
	phy_active = false
} else {
	phy_active = true	
}

//Destroy car on touch with destroyer 
if(place_meeting(x,y, o_car_destroyer)){
	instance_destroy(self)
} 
//Turning right from right lane
if(place_meeting(x,y, o_switch_dir_right) and hor == true and turning == false){
	turning = true
}
if(turning == true and hor == true and direc < -90 and rightLane == true){
	direc += 2
}else if(turning == true and hor == true and direc > -120 and rightLane == true){
	hor = false
} else if(direc >= -90 and turning == true and hor == false and rightLane == true){
	direc = -90
	turning = false
	hor = false
}

//Slow down on turns
if(place_meeting(x,y, o_switch_dir_right) and current_speed > 5)
{
	phy_speed_x += lengthdir_x(-brake_power, -phy_rotation)
	//phy_speed_y += lengthdir_y(-brake_power, -phy_rotation)
}


// Have each dynamic instance run the following code
with (o_car_ai2)
{
	if(hit == false){
		// Put direction in front of the car
		if(hor == false){
			var dir = point_direction(x, y, x, y + decider);	
		} else {
			var dir = point_direction(x, y, x + decider, y);
		}
		//keep rotation the same
		phy_rotation = direc
		//Dont let car drive too fast
		if(current_speed < max_speed and o_pause_menu.pause == false){
			// Apply the impulse to the position the dynamic instance occupies, using the previously calculated direction to set the force part of the vector
			physics_apply_impulse(x, y, lengthdir_x(speed_var/2.5, dir), lengthdir_y(speed_var/2.5, dir));
		} 
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
	//global.health -= collision_damage
	hit = true
	}
	}
	action_set_relative(0);
} else if(hit == true) {
	part_particles_create(global.partSystemCar,x,y,global.ptSmoke,3)
}

//Deal damage from bullets
if(place_meeting(x,y,o_bullet) ){
	hp -= 4
}

//Add stats
if hp < 1 and civ_killed == false {
	global.civ_kills += 1
	civ_killed = true
}