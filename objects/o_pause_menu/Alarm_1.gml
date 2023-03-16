/// @description Pause
instance_deactivate_all( true );
instance_activate_object(obj_day_and_night_lights)
instance_activate_layer("Buildings")
instance_activate_layer("GameObjects")
instance_activate_layer("LightStands")
instance_activate_layer("Lights")
instance_activate_layer("UnderPlayer")
instance_activate_layer("Invisible")
audio_pause_all();
//instance_activate_object( ... ); //Activate persistant objects like Cameras & Controllers!

screen_alpha_set	= 0.6;


//Reset Button Values * Put this here to reset the button positions so that they tween when you pause *
for( var i = 0; i< bc; i++; ){
	bx[ i ]		= 0;
	by[ i ]		= 0;
	bsca[ i ]	= 1;
	bcol[ i ]	= c_white;
	balpha[ i ]	= 1;
	bxoff[ i ]	= 0;
	byoff[ i ]	= 0;
}