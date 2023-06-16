//Change sprite if player is hovering over image
image_index = position_meeting(mouse_x,mouse_y, o_close_button)
var meeting = position_meeting(mouse_x,mouse_y, o_close_button)

if(meeting == 1 and mouse_check_button_pressed(mb_left)) 
{
	if instance_exists(o_ui_med)
		o_settings_button.settings_on = false
		instance_destroy(o_ui_med)
	if instance_exists(o_ui_back_loadout)
		o_loadout_button.loadout_on = false
		instance_destroy(o_ui_back_loadout)
		instance_destroy(o_add_speed_button)
		instance_destroy(o_add_gas_button)
		instance_destroy(o_add_health_button)
	instance_destroy(self)
} else {
	sprite_index = s_close_button	
}
