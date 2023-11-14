/// @description Increase number of levels done with each complete
var roomname = room_get_name(room)
if(roomname != "rm_mainmenu") {
	levels_done += 1
	global.streets_driven += 1//Add number of streets player has visited
}

