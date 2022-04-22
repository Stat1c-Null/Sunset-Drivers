/// @description 
global.police_timer -= 1
if (global.police_timer <= 0) {
	global.timer -=1
	global.police_timer = room_speed * 1
}
if(global.timer <= 0){
	global.health = 0	
}

