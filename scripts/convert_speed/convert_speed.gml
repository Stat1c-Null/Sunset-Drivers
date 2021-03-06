///@descriptions Convert speed from physics speed into KM
///@argument0 physics speed
///@argument1 KM/H speed
function convert_speed(argument0){
	var mp = 1.2
	if (argument0 > 0 and argument0 < 5) {
		mp += 0.1
		global.mphSpeed = argument0 * mp
	} else if (argument0 > 5 and argument0 < 10) {
		mp += 0.5
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 10 and argument0 < 15) { 
		mp += 1
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 15 and argument0 < 20) {
		mp += 1.6
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 20 and argument0 < 25) { 
		mp += 2.1
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 25 and argument0 < 30) {
		mp += 2.7
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 30 and argument0 < 35) {
		mp += 3.3
		global.mphSpeed = argument0 * mp
	} else if(argument0 > 35 and argument0 < 40) {
		mp += 4.3
		global.mphSpeed = argument0 * mp
	}
}