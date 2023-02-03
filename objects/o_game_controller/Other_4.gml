global.busted = false
global.wasted = false
global.gameover = false
global.final_dist = 100
buttons_created = false
vigOn = false
room_speed = 30
part_system_depth(global.partSystemCar, 800)

//Spawn more cops OG Y is 13400
if(instance_exists(obj_car) and levels_done > 0 and instance_number(o_police_car) < levels_done) {	
	with(instance_create_layer(random_range(800, 1300), 12400, "GameObjects", o_police_car)) {
		phy_rotation = -90	
	}
}
