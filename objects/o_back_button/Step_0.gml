//Change sprite if player is hovering over image
image_index = position_meeting(mouse_x,mouse_y, o_back_button)
var meeting = position_meeting(mouse_x,mouse_y, o_back_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left)) 
{
	sprite_index = s_back_button_pressed
	alarm[0] = 5
} else {
	sprite_index = s_back_button	
}
