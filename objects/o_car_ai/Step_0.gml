//Destroy car on touch with destroyer 
if(place_meeting(x,y, o_car_destroyer)){
	instance_destroy(self)
	show_debug_message("destroyd")	
}

//Move the car
y += speed