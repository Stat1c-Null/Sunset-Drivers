//@argument0 = current score
//@argument1 = score position on the screen
function calculate_score(argument0){
	if (argument0 > 9 and argument0 < 99) {
		obj_car.score_x_pos = 1272
	} else if(argument0 > 99 and argument0 < 999) {
		obj_car.score_x_pos = 1254
	} else if(argument0 > 999 and argument0 < 9999) {
		obj_car.score_x_pos = 1244
	} else if(argument0 > 9999 and argument0 < 99999) {
		obj_car.score_x_pos = 1234
	} else if(argument0 > 99999 and argument0 < 9999999) {
		obj_car.score_x_pos = 1222
	}
}