//Stats settings
global.not_enough_money = false
//Final stats of the player
global.final_score = 0
global.final_money = 0
global.final_minutes = 0
global.final_seconds = 0

//Overall Statistics
overall_money = 0
total_runs = 0 //Number of times player played
time_played = 0// How much hours or minutes player played
cops_killed = 0 //How many cops died

//Cop setting
distance_betw = 0
global.final_dist = 100//Final calculated distance between player and a cop

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

//UI props
fullscreen = false
res_w = 1920
res_h = 1080
screen_w = display_get_width()
screen_h = display_get_height()

//Determine which room player is located in and set according game state
var roomname = room_get_name(room)
if(roomname == "rm_mainmenu") {
	global.game_state = "menu"
	global.dollars = 0
} else {
	global.game_state = "game"
}
	
global.filter = "day_night"
/*if(global.game_state == "game") {
	if(global.filter == "day_night" and not instance_exists(obj_day_and_night_lights)) {
		instance_create_layer(x,y, "Lights", obj_day_and_night_lights)
		
		
	} else if(global.filter == "tv_filter" and not instance_exists(obj_OLDTVFilter_SVideo)) {
		//instance_activate_object(obj_OLDTVFilter_SVideo)
		//instance_deactivate_object(obj_day_and_night_lights)	
		//instance_create_layer(x,y, "Lights", obj_OLDTVFilter_SVideo)
	}
}
*/
//Particle system for the car
global.partSystemCar =  part_system_create_layer("Particles", 0)
part_system_depth(global.partSystemCar, 800)

//Car Specs
car_speed = 0.44
car_health = 100
car_gas = 100

speed_lvl = 1
speed_inc = 0.02//By howw much speed increases every level
max_speed_lvl = 10
speed_prices = [0, 400, 800, 1200, 1600, 2000, 2400, 2800, 3500, 4500, 6000]//0 in begininng to take index 0

health_lvl = 1
health_inc = 10//How much health increases
max_health_lvl = 10
health_prices = [0, 500, 1000, 1500, 2000, 3000, 4000, 5500, 6000, 8000, 10000]

gas_lvl = 1
gas_inc = 10
max_gas_lvl = 10
gas_prices = [0, 300, 600, 900, 1200, 1500, 1800, 2100, 2400, 2700, 3000]



