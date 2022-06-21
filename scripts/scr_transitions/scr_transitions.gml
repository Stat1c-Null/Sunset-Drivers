global.midTransition = false
global.roomTarget = -1

//Start specific sequence
function TransitionPlaceSeq(style){
	if (layer_exists("transition"))layer_destroy("transition")//Destroy if old one exists
	var lay = layer_create(-9999, "transition")//create transition above everything else -9999 depth
	layer_sequence_create(lay, 0,0,style)
}
//Transition template
function TransitionStart(roomTarget, styleOut, styleIn)
{
	if(!global.midTransition)
	{
		global.midTransition = true
		global.roomTarget = roomTarget
		TransitionPlaceSeq(styleOut)
		layer_set_target_room(roomTarget)
		TransitionPlaceSeq(styleIn)
		layer_reset_target_room()
		return true
	}
	else return false
}

function TransitionChangeRoom()
{
	room_goto(global.roomTarget)
	obj_car.x = 1100
	obj_car.y = 12860
}

function TransitionFinished()
{
	layer_sequence_destroy(self.elementID)
	global.midTransition = false
	global.teleport_collision = false
}

