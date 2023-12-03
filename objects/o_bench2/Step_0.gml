action_set_relative(1);
var __b__;
__b__ = action_if_variable(hp, 1, 1);
if __b__
{
{
	//Reduce cars health if barrel broke
	global.health -= collision_damage
	action_kill_object();
	action_create_object(o_broken_bench2_left, -15, 0);
	action_create_object(o_broken_bench2_right, 15, 0);
	//Create particles from collision
	action_create_object(o_wood_particle, 0, 0)
	with(o_wood_particle) {
		if(global.reverse == false) {
			direction = -obj_car.phy_rotation
		} else {
			direction = obj_car.phy_rotation
		}
		global.prop_kills += 1
	}
}
}
action_set_relative(0);
