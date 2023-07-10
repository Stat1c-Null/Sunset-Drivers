//Change sprite if player is hovering over image
if(o_game_controller.car_color == s_volga_white_display) {//If color is selected show selected icon
	var meet = position_meeting(mouse_x,mouse_y, o_color_white_button)
	image_index = meet + 2
} else { // if color is not selected dont show that icon
	image_index = position_meeting(mouse_x,mouse_y, o_color_white_button)
}

var meeting = position_meeting(mouse_x,mouse_y, o_color_white_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.color_owned[1] == true) 
{
	o_game_controller.car_color = o_game_controller.colors[1]
} else if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.color_owned[1] == false and global.dollars > o_game_controller.color_price[1]) {
	global.dollars -= o_game_controller.color_price[1]
	o_game_controller.color_owned[1] = true
	o_game_controller.car_color = o_game_controller.colors[1]
} else {
	sprite_index = s_color_white_button
}
