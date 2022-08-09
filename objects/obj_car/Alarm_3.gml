/// @description Calculate total time survived

global.seconds_survived += 1 
if (global.seconds_survived >= 60) {
	global.seconds_survived = 0
	global.minutes_survived += 1
}
alarm[3] = 1 * room_speed