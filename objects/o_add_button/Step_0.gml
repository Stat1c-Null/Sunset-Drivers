//Change sprite if player is hovering over image
image_index = position_meeting(mouse_x,mouse_y, o_add_button)
var meeting = position_meeting(mouse_x,mouse_y, o_add_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left) and global.dollars > o_game_controller.speed_prices[o_game_controller.speed_lvl] and o_game_controller.speed_lvl < o_game_controller.max_speed_lvl) 
{
	o_game_controller.speed_lvl += 1
	global.dollars -= o_game_controller.speed_prices[o_game_controller.speed_lvl]
} else {
	sprite_index = s_add_button	
}