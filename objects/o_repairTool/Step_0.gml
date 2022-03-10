if(place_meeting(x,y,obj_car) and global.health <= min_amount and global.dollars >= price)//Check if car touched canister
{
	image_index = 0
	global.dollars -= price
	//Increase Gas on touch
	repair_amount = global.maxHealth - global.health
	global.health += repair_amount
	if (global.health > 100) {
		global.health = 100
	}

	//Destroy Canister
	instance_destroy(self)	
}else if(place_meeting(x,y,obj_car) and (global.health > min_amount or global.dollars < price))
{
	//If collided with player but they have too much gas
	image_index = 1
} else if(not place_meeting(x,y,obj_car)) {
	//Not colliding with car
	image_index = 0	
}