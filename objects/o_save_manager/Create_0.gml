/// @description 
save = function () {
	//Data
	var current_money = global.final_money
	var _money = global.dollars
	var _spd_lvl = o_game_controller.speed_lvl
	var _gas_lvl = o_game_controller.gas_lvl
	var _health_lvl = o_game_controller.health_lvl
	var _current_car_color = o_game_controller.car_color
	var _colors_owned = o_game_controller.color_owned
	var _metric_unit = o_game_controller.range_units
	var roomname = room_get_name(room)

	_money = _money + current_money
	//Create root struct
	var rootStruct = {
		money: _money,
		car_speed: _spd_lvl,
		car_gas: _gas_lvl,
		car_health: _health_lvl,
		car_color: _current_car_color,
		colors_owned: _colors_owned,
		range_unit: _metric_unit
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
	try {
		var json = LoadString("sdsave")
		var rootStruct = json_parse(json)
		global.dollars = rootStruct.money
		o_game_controller.speed_lvl = rootStruct.car_speed
		o_game_controller.gas_lvl = rootStruct.car_gas
		o_game_controller.health_lvl = rootStruct.car_health
		o_game_controller.car_color = rootStruct.car_color
		o_game_controller.color_owned = rootStruct.colors_owned
		o_game_controller.range_units = rootStruct.range_unit
	} catch (_exception) {
		return
	}
}