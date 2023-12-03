action_set_relative(1);
var __b__;
__b__ = action_if_variable(hp, 1, 1);
if __b__ and destroyed == false
{
{
	//Reduce cars health if barrel broke
	global.health -= collision_damage
	action_create_object(o_trash_particles, 0, 0);
	with(o_trash_particles) {
		if(global.reverse == false) {
			direction = -obj_car.phy_rotation
		} else {
			direction = obj_car.phy_rotation
		}
		global.prop_kills += 1
	}
	destroyed = true
}
}
action_set_relative(0);
