///@description Cop chase

if instance_exists(obj_car) {
	var dir = point_direction(x, y, obj_car.x, obj_car.y);
	//Move cop forward
	if global.busted == false and o_pause_menu.pause == false and hit == false
		//Direction of the player
		physics_apply_impulse(x, y, lengthdir_x(2.3, dir), lengthdir_y(2.3, dir))//0.8/2.5
		//Turn into player's direction
		if(hp > 0) 
			phy_rotation = -dir
}

//Deactivate physics if the game is paused
if o_pause_menu.pause == true {
	phy_active = false
} else {
	phy_active = true	
}

//Calculate hardness of the hit
if(hit == false) {
	action_set_relative(1);
	var __b__;
	__b__ = action_if_variable(hp, 1, 1);
	if __b__
	{
	{
	hit = true
	}
	}
	action_set_relative(0);
} else if(hit == true) {
	part_particles_create(global.partSystemCar,x,y,global.ptSmoke,3)
}

//Deal damage from bullets
if(place_meeting(x,y,o_bullet) ){
	hp -= 10
}