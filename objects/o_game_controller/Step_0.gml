/// @description 

if(global.final_dist <= death_distance){
	global.busted = true
	global.gameover = true
} else if (global.wasted == true) {
	global.gameover = true
} else {
	global.last_y = obj_car.y
	global.final_score = obj_car.player_score
	global.final_money = global.dollars
	global.final_minutes = global.minutes_survived
	global.final_seconds = global.seconds_survived
	//Calculate if police came close enough to the player
	var player_x = instance_nearest(x,y,obj_car).x
	var player_y = instance_nearest(x,y,obj_car).y
	var police_x = instance_nearest(x,y,o_police_car).x
	var police_y = instance_nearest(x,y,o_police_car).y

	distance_betw = point_distance(player_x, player_y, police_x, police_y)

	global.final_dist = distance_betw / 10

	win_width = room_width	
}

//Create buttons
if(global.gameover and buttons_created == false){
	//Find position of camera and place buttons accordingly
	var vx = camera_get_view_x(view_camera[0])
	var vy = camera_get_view_y(view_camera[0])
	var v_width = camera_get_view_width(view_camera[0])/2
	var v_height = camera_get_view_height(view_camera[0])/2
	instance_create_layer(vx + v_width, vy + v_height + 250, "Particles", o_restart_button)
	instance_create_layer(vx + v_width, vy + v_height + 350, "Particles", o_home_button)
	buttons_created = true
}


//Place vignette on screen when player loses
if((global.busted or global.wasted) and vigOn == false)
{
	//Create object to show vig just ones
	//Create 3 objects so that vignette seems darker
	for (var i = 0; i <= rep; i++;) {
		instance_create_layer(x,y,"Invisible", o_vig_show)
	}
	room_speed = 20//Slow mow the game when player gets busted
	vigOn = true
}

