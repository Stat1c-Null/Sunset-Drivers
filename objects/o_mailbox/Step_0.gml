action_set_relative(1);
var __b__;
__b__ = action_if_variable(hp, 1, 1);
if __b__ and destroyed == false
{
{
	//Reduce cars health if mailbox is broken
	global.health -= collision_damage
	action_create_object(o_mail_particle, 0, 0);
	//NIKITA IS GENIUS
	with(o_mail_particle) {
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
