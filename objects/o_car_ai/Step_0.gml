//Destroy car on touch with destroyer 
if(place_meeting(x,y, o_car_destroyer)){
	instance_destroy(self)
}

//Move the car
y += speed