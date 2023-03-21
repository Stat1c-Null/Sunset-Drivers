///@description Cop chase
var distToPlayer = distance_to_object(obj_car)
//var dir = point_direction(x, y, x, y - 70);

if instance_exists(obj_car) {
	var dir = point_direction(x, y, obj_car.x, obj_car.y);
	//Move cop forward
	if global.busted == false and o_pause_menu.pause == false
		//Direction of the player
		physics_apply_impulse(x, y, lengthdir_x(1.8, dir), lengthdir_y(1.8, dir))//0.8/2.5
}

//Deactivate physics if the game is paused
if o_pause_menu.pause == true {
	phy_active = false
} else {
	phy_active = true	
}

phy_rotation = -90
