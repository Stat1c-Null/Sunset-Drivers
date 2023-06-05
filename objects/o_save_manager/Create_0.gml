/// @description 
save = function () {
	//Data
	var _money = global.dollars
	
	//Create root struct
	var rootStruct = {
		money: _money,
	};
	
	//Save to JSON
	var json = json_stringify(rootStruct)
	SaveString(json, "sdsave")
}

load = function() {
	if(!file_exists("mysave")) return;
	
	//Load json
	var json = LoadString("sdsave")
	var rootStruct = json_parse(json)
	global.dollars = rootStruct.money
}