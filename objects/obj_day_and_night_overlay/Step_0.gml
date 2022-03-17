/// @description mix colors / reflection alpha


// get key times:
if(global.time < 1) {
	global.time += time_changer / room_speed
} else {
	global.time = 0.01	
}

key_previous = min(floor(global.time * num_of_key_times), num_of_key_times - 1)
key_next = (key_previous + 1) mod num_of_key_times

// get lerp amount:
var lerp_amt = (global.time - key_previous/num_of_key_times) * num_of_key_times

// mix colors:
color_mix = [lerp(color[key_previous, 0], color[key_next, 0], lerp_amt),
		 lerp(color[key_previous, 1], color[key_next, 1], lerp_amt),
		 lerp(color[key_previous, 2], color[key_next, 2], lerp_amt)];
		 
con_sat_brt_mix = [lerp(con_sat_brt[key_previous, 0], con_sat_brt[key_next, 0], lerp_amt),
				  lerp(con_sat_brt[key_previous, 1], con_sat_brt[key_next, 1], lerp_amt),
				  lerp(con_sat_brt[key_previous, 2], con_sat_brt[key_next, 2], lerp_amt),
				  lerp(con_sat_brt[key_previous, 3], con_sat_brt[key_next, 3], lerp_amt),
				  lerp(con_sat_brt[key_previous, 4], con_sat_brt[key_next, 4], lerp_amt)];

// reflection alpha:
//			  sin((2 * time			+ phase) * pi) * scale - shift
//Formula 
alpha = clamp(sin((2 * global.time + 0.4) * 3.14) * 1.3 + 0.3, 0, 1)


