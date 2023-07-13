save = function () {
	//Data
	var _metric_unit = o_game_controller.range_units

	//Create root struct
	var rootStruct = {
		range_unit: _metric_unit
	};

	//Save to JSON
	var json = json_stringify(rootStruct)
	SaveString(json, "sdsetsave")
}

load = function() {
	if(!file_exists("sdsetsave")) return;

	//Load json
	try {
		var json = LoadString("sdsetsave")
		var rootStruct = json_parse(json)
		o_game_controller.range_units = rootStruct.range_units
	} catch (_exception) {
		return
	}
}