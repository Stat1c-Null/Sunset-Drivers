if(place_meeting(x,y,obj_car) and global.gasAmount <= min_amount and global.dollars >= price)//Check if car touched canister
{
	destroyed = true
}else if(place_meeting(x,y,obj_car) and (global.gasAmount > min_amount or global.dollars < price))
{
	//If collided with player but they have too much gas
	sprite_index = s_gasDenied
	image_speed = 1
	global.not_enough_money = true
} else if(not place_meeting(x,y,obj_car) and not destroyed) {
	//Not colliding with car
	sprite_index = s_gasAnim
	image_speed = 1
}

if(destroyed)
{
	sprite_index = s_gasDestroyed
	image_speed = 1
	if(image_index >= 56)
	{
		global.dollars -= price
		//Increase Gas on touch
		repair_amount = global.maxAmount - global.gasAmount
		global.gasAmount += repair_amount
		if (global.gasAmount > 100) {
			global.gasAmount = 100
		}

		//Destroy Canister
		instance_destroy(self)		
	}
}