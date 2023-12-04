//Change sprite if player is hovering over image
image_index = position_meeting(mouse_x,mouse_y, o_add_health_button)
var meeting = position_meeting(mouse_x,mouse_y, o_add_health_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left) and global.dollars > o_game_controller.health_prices[o_game_controller.health_lvl] and o_game_controller.health_lvl < o_game_controller.max_health_lvl) 
{
	global.dollars -= o_game_controller.health_prices[o_game_controller.health_lvl]
	global.money_spent += o_game_controller.health_prices[o_game_controller.health_lvl]
	o_game_controller.health_lvl += 1
} else {
	sprite_index = s_add_button	
}
