/// @description 
save = function () {
	//Data
	var current_money = global.final_money
	var _money = global.dollars
	var _spd_lvl = o_game_controller.speed_lvl
	var roomname = room_get_name(room)

	_money = _money + current_money
	//Create root struct
	var rootStruct = {
		money: _money,
		car_speed: _spd_lvl
	};
	
	//Save to JSON
	if global.gameover == true or roomname == "rm_mainmenu"{
		var json = json_stringify(rootStruct)
		SaveString(json, "sdsave")
	}
}

load = function() {
	if(!file_exists("sdsave")) return;
	
	//Load json
	var json = LoadString("sdsave")
	var rootStruct = json_parse(json)
	global.dollars = rootStruct.money
	//if !variable_instance_exists(id, "car_speed")
	o_game_controller.speed_lvl = rootStruct.car_speed
}