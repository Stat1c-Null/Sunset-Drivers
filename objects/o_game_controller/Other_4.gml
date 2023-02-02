global.busted = false
global.wasted = false
global.gameover = false
global.final_dist = 100
buttons_created = false
vigOn = false
room_speed = 30
part_system_depth(global.partSystemCar, 800)

//Spawn more cops 
if(instance_exists(obj_car)) {	
	obj_car.levels_done += 1
	if(obj_car.levels_done > 0) {
		for(var i = 0; i <= obj_car.levels_done; i++) {
			instance_create_layer(random_range(800, 1300), 13400, "GameObjects", o_police_car)
		}
	}	
}
