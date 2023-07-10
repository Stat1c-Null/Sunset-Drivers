//Change sprite if player is hovering over image
if(o_game_controller.car_color == s_volga_black_display) {//If color is selected show selected icon
	var meet = position_meeting(mouse_x,mouse_y, o_color_black_button)
	image_index = meet + 2
} else { // if color is not selected dont show that icon
	image_index = position_meeting(mouse_x,mouse_y, o_color_black_button)
}

var meeting = position_meeting(mouse_x,mouse_y, o_color_black_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.color_owned[0] == true) 
{
	o_game_controller.car_color = o_game_controller.colors[0]
} else {
	sprite_index = s_color_black_button
}
