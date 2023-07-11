//Change sprite if player is hovering over image
if (o_game_controller.range_units == "metric") {
	var meeting = position_meeting(mouse_x,mouse_y, o_metric_checkmark)
	image_index = meeting + 2
} else {
	image_index = position_meeting(mouse_x,mouse_y, o_metric_checkmark)
}
var meeting = position_meeting(mouse_x,mouse_y, o_metric_checkmark)
	
if(meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.range_units == "metric") 
{
	o_game_controller.range_units = "imperial"
} else if meeting == 1 and mouse_check_button_pressed(mb_left) and o_game_controller.range_units == "imperial" {
	o_game_controller.range_units = "metric"
} else {
	sprite_index = s_checkmark_button	
}
