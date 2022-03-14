if(place_meeting(x,y, obj_car)) {
	sprite_index = s_bill_destroy
	destroyed = true
}

if(destroyed)
{
	if(image_index >= 23) {
		global.dollars += value
		instance_destroy(self)		
	}	
}