/// @description Alarm for camera shake
if(o_camera.collisionWithDynamic) {
	o_camera.shakeValue = 4
	//alarm[5] = room_speed * 1
} else {
	o_camera.shakeValue = 2
	//alarm[5] = room_speed * 1
}

