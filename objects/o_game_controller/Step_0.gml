/// @description 
Controls()
show_debug_message(range_units)
//Determine which room player is located in and set according game state
var roomname = room_get_name(room)
if(roomname == "rm_mainmenu") 
	global.game_state = "menu"
else
	global.game_state = "game"

//Switch Game States
switch(global.game_state) {
	
	//IN CASE THE GAME IS ON
	case "game":
		//Calculate game over
		if(global.busted == true){
			global.gameover = true
		} else if (global.wasted == true) {
			global.gameover = true
		} else {
			if o_pause_menu.pause == false {
				global.last_y = obj_car.y
				global.final_score = obj_car.player_score
				global.final_money = global.current_dollars
				global.final_minutes = global.minutes_survived
				global.final_seconds = global.seconds_survived
			}
			//Calculate if police came close enough to the player
			if(instance_exists(o_police_car)) {
				var player_x = instance_nearest(x,y,obj_car).x
				var player_y = instance_nearest(x,y,obj_car).y
				var police_x = instance_nearest(x,y,o_police_car).x
				var police_y = instance_nearest(x,y,o_police_car).y

				distance_betw = point_distance(player_x, player_y, police_x, police_y)

				global.final_dist = distance_betw / 10
				
				meter_dist = global.final_dist / 3
				
			}

			win_width = room_width	
		}

		//Create buttons
		if(global.gameover and buttons_created == false){
			//Find position of camera and place buttons accordingly
			var vx = camera_get_view_x(view_camera[0])
			var vy = camera_get_view_y(view_camera[0])
			var v_width = camera_get_view_width(view_camera[0])/2
			var v_height = camera_get_view_height(view_camera[0])/2
			instance_create_layer(vx + v_width, vy + v_height + 100, "UI", o_restart_button)
			instance_create_layer(vx + v_width, vy + v_height + 200, "UI", o_home_button)
			buttons_created = true
			levels_done = 0
			global.money_score = global.final_money
		}


		//Place vignette on screen when player loses
		if((global.busted or global.wasted) and vigOn == false)
		{
			//Create object to show vig just ones
			//Create 3 objects so that vignette seems darker
			for (var i = 0; i <= rep; i++;) {
				instance_create_layer(x,y,"Particles", o_vig_show)
			}
			room_speed = 20//Slow mow the game when player gets busted
			vigOn = true
		}
	break
	//IN CASE PLAYER IS IN THE MENU
	case "menu":
		global.gameover = false
		global.busted = false
		global.wasted = false
		levels_done = 0
	break

}