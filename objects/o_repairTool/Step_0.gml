if(place_meeting(x,y,obj_car) and global.current_dollars >= price)//Check if car touched canister
{
	destroyed = true
	if(sound_played == false) {
		audio_play_sound(a_pickup, 800, false)
		sound_played = true
	}	
}else if(place_meeting(x,y,obj_car) and (global.current_dollars < price))
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
	if(image_index >= 100)
	{
		global.current_dollars -= price
		//Increase Health on touch
		repair_amount = global.maxHealth - global.health
		global.health += repair_amount
		if (global.health > 100) {
			global.health = 100
		}
		global.money_spent += price

		//Destroy Canister
		instance_destroy(self)	
	}
}