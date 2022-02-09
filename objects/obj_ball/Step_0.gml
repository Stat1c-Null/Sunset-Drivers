action_set_relative(1);
var __b__;
__b__ = action_if_variable(hp, 1, 1);
if __b__
{
{
//Reduce health if barrel broke
global.health -= collision_damage
action_kill_object();
action_create_object(obj_ball_piece1, 0, 0);
action_create_object(obj_ball_piece2, 0, 0);
action_create_object(obj_ball_piece3, 0, 0);
action_create_object(obj_ball_piece4, 0, 0);
}
}
action_set_relative(0);
