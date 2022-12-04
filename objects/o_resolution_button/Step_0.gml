//Change sprite if player is hovering over image
//image_index = position_meeting(mouse_x,mouse_y, o_play_button)
var meeting = position_meeting(mouse_x,mouse_y, o_resolution_button)

if(res_w == 2560)
{
	image_index = 0	

} else if(res_w == 1920){
	image_index = 2
}

if(meeting == 1 and mouse_check_button_pressed(mb_left) and res_changed == false) 
{
	res_w = 1920
	res_h = 1080
	res_changed = true
	window_set_size(res_w, res_h)
	window_set_position(screen_w/2-res_w/2, screen_h/2-res_h/2)
} else if(meeting == 1 and mouse_check_button_pressed(mb_left) and res_changed == true)  {
	res_w = 2560
	res_h = 1440
	res_changed = false
	window_set_size(res_w, res_h)
	window_set_position(screen_w/2-res_w/2, screen_h/2-res_h/2)
}
