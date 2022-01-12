if(place_meeting(x,y,obj_car))
{
	//Increase Gas on touch
	global.gasAmount += 50
	if (global.gasAmount > 100) {
		global.gasAmount = 100
	}

	//Destroy Canister
	instance_destroy(self)	
}