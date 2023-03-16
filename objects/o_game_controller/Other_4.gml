global.busted = false
global.wasted = false
global.gameover = false
global.final_dist = 100
buttons_created = false
vigOn = false
room_speed = 30
part_system_depth(global.partSystemCar, 800)

//Create lights
var roomname = room_get_name(room)
if(roomname == "rm_endless_rg_start") {
	levels_done = 0	
}

//if(roomname != "rm_mainmenu" and not instance_exists(obj_day_and_night_lights)) 
	//instance_create_layer(x,y, "Lights", obj_day_and_night_lights)
	
//Spawn more cops OG Y is 13400
if(instance_exists(obj_car) and levels_done > 0 and instance_number(o_police_car) < levels_done and roomname != "rm_endless_rg_start") {	
	with(instance_create_layer(random_range(800, 1300), 12400, "LeftLane", o_police_car)) {
		phy_rotation = -90
	}
}
