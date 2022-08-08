/// @description 

if(global.final_dist <= death_distance){
	global.busted = true
	global.gasAmount = 0	
} else if (global.wasted == true) {
	global.gasAmount = 0
} else {
	global.last_y = obj_car.y
	//Calculate if police came close enough to the player
	var player_x = instance_nearest(x,y,obj_car).x
	var player_y = instance_nearest(x,y,obj_car).y
	var police_x = instance_nearest(x,y,o_police_car).x
	var police_y = instance_nearest(x,y,o_police_car).y

	distance_betw = point_distance(player_x, player_y, police_x, police_y)

	global.final_dist = distance_betw / 10

	win_width = room_width	
}

//Place vignette on screen when player loses
if((global.busted or global.wasted) and vigOn == false)
{
	//Create object to show vig just ones
	//Create 3 objects so that vignette seems darker
	var rep = 3
	for (var i = 0; i <= rep; i++;) {
		instance_create_layer(x,y,"Invisible", o_vig_show)
	}
	room_speed = 20//Slow mow the game when player gets busted
	vigOn = true
}

