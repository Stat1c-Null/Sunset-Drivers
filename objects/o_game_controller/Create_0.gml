//Stats settings
global.not_enough_money = false
//Final stats of the player
global.final_score = 0
global.final_money = 0
global.final_minutes = 0
global.final_seconds = 0
//Cop setting
distance_betw = 0
global.final_dist = 100
death_distance = 10
//Game over settings
global.busted = false
global.wasted = false
global.gameover = false//Final game over to show score and stats
global.last_y = 0 //Get players last Y position before they died or got busted
vigOn = false
rep = 3//Times vignette will be created
room_speed = 30
alarm[0] = 10
TextColor = false//Determine whether to show busted text in blue or red
win_width = room_width
buttons_created = false//Determine if game over menu buttons were made
//Number of times player changed level, this way I can spawn more police cars
levels_done = 0
//Pause menu vars
//paused_game = false
//paused_surf = -1

//Determine which room player is located in and set according game state
var roomname = room_get_name(room)
if(roomname == "rm_mainmenu") 
	global.game_state = "menu"
else
	global.game_state = "game"
	
global.filter = "day_night"
if(global.game_state == "game") {
	if(global.filter == "day_night" and not instance_exists(obj_day_and_night_lights)) {
		//instance_activate_object(obj_day_and_night_lights)
		//instance_deactivate_object(obj_OLDTVFilter_SVideo)
		instance_create_layer(x,y, "Lights", obj_day_and_night_lights)
	} else if(global.filter == "tv_filter" and not instance_exists(obj_OLDTVFilter_SVideo)) {
		//instance_activate_object(obj_OLDTVFilter_SVideo)
		//instance_deactivate_object(obj_day_and_night_lights)	
		instance_create_layer(x,y, "Lights", obj_OLDTVFilter_SVideo)
	}
}

//Particle system for the car
global.partSystemCar =  part_system_create_layer("Particles", 0)
part_system_depth(global.partSystemCar, 800)

