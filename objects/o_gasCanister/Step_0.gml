if(place_meeting(x,y,obj_car) and global.gasAmount <= 70)//Check if car touched canister
{
	image_index = 0
	//Increase Gas on touch
	global.gasAmount += 50
	if (global.gasAmount > 100) {
		global.gasAmount = 100
	}

	//Destroy Canister
	instance_destroy(self)	
}else if(place_meeting(x,y,obj_car) and global.gasAmount > 70)
{
	//If collided with player but they have too much gas
	image_index = 1
} else if(not place_meeting(x,y,obj_car)) {
	//Not colliding with car
	image_index = 0	
}