//Change sprite if player is hovering over image
//image_index = position_meeting(mouse_x,mouse_y, o_play_button)
var meeting = position_meeting(mouse_x,mouse_y, o_filter_button)

if(tv_filter == true)
{
	image_index = 0	
} else {
	image_index = 1	
}

if(meeting == 1 and mouse_check_button_pressed(mb_left) and tv_filter == false) 
{
	instance_activate_object(obj_OLDTVFilter_SVideo)
	global.filter = "tv_filter"
	tv_filter = true
} else if(meeting == 1 and mouse_check_button_pressed(mb_left) and tv_filter == true)  {
	instance_deactivate_object(obj_OLDTVFilter_SVideo)
	global.filter = "day_night"
	tv_filter = false
}
