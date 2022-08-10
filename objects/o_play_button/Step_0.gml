//Change sprite if player is hovering over image
//image_index = position_meeting(mouse_x,mouse_y, o_restart_button)
var meeting = position_meeting(mouse_x,mouse_y, o_play_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left)) 
{
	//sprite_index = s_restart_button_pressed
	alarm[0] = 3
} else {
	sprite_index = s_play_button	
}
