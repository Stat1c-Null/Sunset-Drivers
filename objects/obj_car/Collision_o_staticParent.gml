//Turn on camera shake
if(o_camera.cameraShaking == false) {
	o_camera.cameraShaking = true	
}
if(o_camera.cameraShaking and o_camera.cameraAlarmOn == false) {
	o_camera.cameraAlarmOn = true
	o_camera.collisionWithStatic = true
	alarm[4] = 2
}