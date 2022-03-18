//OG 200
edge = 150;//distance outside the view to make extra rain

if(global.night == true) {
	repeat(num_of_drops)//number of drops to make each step
	{
	    //make rain drops appear randomly
	    instance_create(__view_get( e__VW.XView, 0 )-edge+random(__view_get( e__VW.WView, 0 )+edge*2),__view_get( e__VW.YView, 0 )-edge+random(__view_get( e__VW.HView, 0 )+edge*2),obj_rain);
	}
	//Add new drops every second
	if(cur == num_of_drops and num_of_drops <= 30){
		num_of_drops += 1
		alarm[0] = room_speed * 1
	} else {
		return 0
	}
	
} else if(global.night == false) {
	if(num_of_drops > 0){
		repeat(num_of_drops)//number of drops to make each step
		{
			//make rain drops appear randomly
			instance_create(__view_get( e__VW.XView, 0 )-edge+random(__view_get( e__VW.WView, 0 )+edge*2),__view_get( e__VW.YView, 0 )-edge+random(__view_get( e__VW.HView, 0 )+edge*2),obj_rain);
		}
		//Add new drops every second
		if(cur == num_of_drops and num_of_drops > 0){
			num_of_drops -= 1
			alarm[0] = room_speed * 1
		} else {
			return 0
		}
	}
}
//show_debug_message(num_of_drops)
