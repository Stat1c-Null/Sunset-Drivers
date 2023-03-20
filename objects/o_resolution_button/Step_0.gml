//Change sprite if player is hovering over image
//image_index = position_meeting(mouse_x,mouse_y, o_play_button)
var meeting = position_meeting(mouse_x,mouse_y, o_resolution_button)

if(o_game_controller.res_w == 2560)
{
	image_index = 0	

} else if(o_game_controller.res_w == 1920){
	image_index = 2
}

if(meeting == 1 and mouse_check_button_pressed(mb_left) and res_changed == false) 
{
	o_game_controller.res_w = 1920
	o_game_controller.res_h = 1080
	res_changed = true
	window_set_size(o_game_controller.res_w, o_game_controller.res_h)
	window_set_position(screen_w/2-o_game_controller.res_w/2, screen_h/2-o_game_controller.res_h/2)
} else if(meeting == 1 and mouse_check_button_pressed(mb_left) and res_changed == true and screen_w > 1930)  {
	o_game_controller.res_w = 2560
	o_game_controller.res_h = 1440
	res_changed = false
	window_set_size(o_game_controller.res_w, o_game_controller.res_h)
	window_set_position(screen_w/2-o_game_controller.res_w/2, screen_h/2-o_game_controller.res_h/2)
}


