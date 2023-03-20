//Change sprite if player is hovering over image
//image_index = position_meeting(mouse_x,mouse_y, o_play_button)
var meeting = position_meeting(mouse_x,mouse_y, o_fullscreen_button)
o_game_controller.fullscreen = window_get_fullscreen()

if(o_game_controller.fullscreen == true)
{
	image_index = 0	
} else {
	image_index = 1	
}

if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.fullscreen == false) 
{
	window_set_fullscreen(true)
	o_game_controller.fullscreen = true
} else if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.fullscreen == true)  {
	window_set_fullscreen(false)
	o_game_controller.fullscreen = false
}
