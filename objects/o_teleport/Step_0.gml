
if(place_meeting(x,y,obj_car)){
	room_goto(targetRoom)
	obj_car.x = targetX
	obj_car.y = targetY	
	global.health = global.saved_health
	global.dollars = global.saved_money
	global.gasAmount = global.saved_gas
}

