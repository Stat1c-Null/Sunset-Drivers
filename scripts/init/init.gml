gml_pragma("global", "init()")// Run when the game starts

#region Particle Types

//Basic smoke particle
var _p = part_type_create()

part_type_shape(_p, pt_shape_smoke)//Shape of particle
part_type_life(_p, 15, 30)//How long it stays on screen
part_type_alpha2(_p, 1, 0)
part_type_color2(_p, c_white, c_gray)
part_type_size(_p, 0.2, 0.3, 0.03, 0)
part_type_speed(_p, 1, 3, 0, 0)
part_type_direction(_p, 0, 360, 2, 0)

global.ptSmoke = _p;

#endregion

function init(){
	
}