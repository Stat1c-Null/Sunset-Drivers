/// @description Bust alarm
if(instance_exists(obj_car)) {
	if global.mphSpeed < bust_speed and global.final_dist < obj_car.bust_dist and hp > 0{ 
		global.gameover = true
		global.busted = true
		busting_player = false	
	} else {
		busting_player = false	
	}
}