var new_scale	= lerp(scale_change_start, scale_change_target, scale_change_timer/scale_change_speed);
image_xscale	= new_scale;
image_yscale	= new_scale;
scale_change_timer++;
if(global.time < 0.25 or global.time > 0.65){
	image_alpha = 0.23	
} else {
	if(image_alpha > 0.05)
	{
		image_alpha -= 0.01 / room_speed
	} else {
		image_alpha = 0.05	
	}
		
}