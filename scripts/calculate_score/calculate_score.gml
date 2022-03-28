// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_score(argument0, argument1){
	if (argument0 > 9 and argument0 < 99) {
		argument1 = 1261	
	} else if(argument0 > 99 and argument0 < 999) {
		argument1 = 1250
	} else if(argument0 > 999 and argument0 < 9999) {
		argument1 = 1236
	} else if(argument0 > 9999 and argument0 < 99999) {
		argument1 = 1223
	} else if(argument0 > 99999 and argument0 < 9999999) {
		argument1 = 1208
	}
}