if(place_meeting(x,y,obj_car) and global.gasAmount <= min_amount and global.dollars >= price)//Check if car touched canister
{
	image_index = 0
	global.dollars -= price
	//Increase Gas on touch
	repair_amount = global.maxAmount - global.gasAmount
	global.gasAmount += repair_amount
	if (global.gasAmount > 100) {
		global.gasAmount = 100
	}

	//Destroy Canister
	instance_destroy(self)	
}else if(place_meeting(x,y,obj_car) and (global.gasAmount > min_amount or global.dollars < price))
{
	//If collided with player but they have too much gas
	image_index = 1
	global.not_enough_money = true
} else if(not place_meeting(x,y,obj_car)) {
	//Not colliding with car
	image_index = 0	
}