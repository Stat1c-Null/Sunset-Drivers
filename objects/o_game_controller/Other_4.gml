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
	if(obj_car.levels_done > 0 and instance_number(o_police_car) < obj_car.levels_done) {
		instance_create_layer(900, 13100, "GameObjects", o_police_car)
	}	
}
