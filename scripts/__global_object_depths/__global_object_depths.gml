function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_car
	global.__objectDepths[1] = 1; // obj_skid_mark
	global.__objectDepths[2] = 0; // obj_ball_piece1
	global.__objectDepths[3] = 0; // obj_ball_piece2
	global.__objectDepths[4] = 0; // obj_ball_piece3
	global.__objectDepths[5] = 0; // obj_ball_piece4
	global.__objectDepths[6] = 0; // obj_ball
	global.__objectDepths[7] = 0; // obj_parent_physics
	global.__objectDepths[8] = 0; // obj_rain_generator
	global.__objectDepths[9] = 0; // obj_rain
	global.__objectDepths[10] = 0; // obj_guy
	global.__objectDepths[11] = 0; // obj_splash


	global.__objectNames[0] = "obj_car";
	global.__objectNames[1] = "obj_skid_mark";
	global.__objectNames[2] = "obj_ball_piece1";
	global.__objectNames[3] = "obj_ball_piece2";
	global.__objectNames[4] = "obj_ball_piece3";
	global.__objectNames[5] = "obj_ball_piece4";
	global.__objectNames[6] = "obj_ball";
	global.__objectNames[7] = "obj_parent_physics";
	global.__objectNames[8] = "obj_rain_generator";
	global.__objectNames[9] = "obj_rain";
	global.__objectNames[10] = "obj_guy";
	global.__objectNames[11] = "obj_splash";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
