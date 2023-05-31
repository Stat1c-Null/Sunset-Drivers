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
	var file = working_directory + "save.txt"
	saveJsonToFile(json, file)
}

load = function() {
		
}