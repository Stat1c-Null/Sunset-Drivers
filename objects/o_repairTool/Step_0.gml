if(place_meeting(x,y,obj_car) and global.health <= min_amount and global.dollars >= price)//Check if car touched canister
{
	
	destroyed = true
	
}else if(place_meeting(x,y,obj_car) and (global.health > min_amount or global.dollars < price))
{
	//If collided with player but they have too much gas
	sprite_index = s_repairDenied
	image_speed = 1
	global.not_enough_money = true
} else if(not place_meeting(x,y,obj_car) and not destroyed) {
	//Not colliding with car	
	image_speed = 1
	sprite_index = s_repairToolAnim
}

if(destroyed)
{
	sprite_index = s_repairDestroyed
	image_speed = 1
	if(image_index >= 17)
	{
		global.dollars -= price
		//Increase Gas on touch
		repair_amount = global.maxHealth - global.health
		global.health += repair_amount
		if (global.health > 100) {
			global.health = 100
		}

		//Destroy Canister
		instance_destroy(self)	
	}
}