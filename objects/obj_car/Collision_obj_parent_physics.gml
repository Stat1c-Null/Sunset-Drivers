//Turn on camera shake
if(o_pause_menu.pause == false) {
	if(o_camera.cameraShaking == false) {
		o_camera.cameraShaking = true	
	}
	if(o_camera.cameraShaking and o_camera.cameraAlarmOn == false and not place_meeting(x,y,o_car_ai2)) {
		o_camera.cameraAlarmOn = true
		o_camera.collisionWithDynamic = true
		alarm[4] = 1
	} else if(o_camera.cameraShaking and o_camera.cameraAlarmOn == false and place_meeting(x,y,o_car_ai2)) {
		o_camera.cameraAlarmOn = true
		o_camera.collisionWithCar = true
		alarm[4] = 1	
	}
}