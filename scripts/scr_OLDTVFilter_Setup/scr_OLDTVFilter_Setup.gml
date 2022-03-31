function scr_OLDTVFilter_Setup() {
	//
	//  OLD TV Filter for GameMaker Studio 2
	//
	//  Version 1.0
	//  
	//  Developed by Vortex Game Studios LTDA ME. (http://vortexstudios.com)
	//  Author: Alexandre Ribeiro de Sá (@alexribeirodesa)
	//

	//  ATTENTION!
	//  DO NOT EDIT THIS FILE, USE THE PRESET OBJECT

	//  Vídeo Buffer
	application_surface_draw_enable(false);
	
	// shader:
	shader = shd_day_and_night_lights;
	u_col = shader_get_uniform(shader, "col");
	u_con_sat_brt = shader_get_uniform(shader, "con_sat_brt")
	
	s_lights = shader_get_sampler_index(shader, "lights")
	tex_lights = -1
	srf_lights = -1
	global.time = 0.00//What time in the world is it
	global.army_time = "AM 12:00"
	global.night = false
	global.day = 1
	//Ideal time changer 0.0042
	time_changer = 0.0042
	// COLOR VARS:
	// ----------------------------------------------------------------------------
	color_mix = -1
	color[0,0] = undefined
	key_previous = -1//Previous key time of day
	key_next = -1//Next key time of the day
	con_sat_brt_mix = -1
	
	// KEY TIMES:
	// ----------------------------------------------------------------------------


	// arguments:	  R      G       B       con     sat    brt      popS   popT
	scr_add_key_time(030,	120,	225,	0.60,	1.00,  -0.20,	0.80,	0.65);	// 00h
	scr_add_key_time(040,	125,	215,	0.65,	0.90,  -0.20,	0.70,	0.65);	// 02h
	scr_add_key_time(050,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 04h
	scr_add_key_time(75,	090,	175,	1.00,	0.85,  -0.10,  -0.50,	0.60);	// 06h
	scr_add_key_time(160,	145,	100,	1.20,	0.65,  -0.03,	0.00,	1.00);	// 08h
	scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 10h
	scr_add_key_time(128,	128,	128,	1.20,	0.85,	0.05,	0.00,	1.00);	// 12h
	scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 14h
	scr_add_key_time(140,	130,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 16h
	scr_add_key_time(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 18h
	scr_add_key_time(030,	060,	180,	1.25,	0.70,  -0.05,  -0.50,	0.60);	// 20h
	scr_add_key_time(050,	050,	215,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 22h

	num_of_key_times = array_height_2d(color)

	// WATER REFLECTION:
	// ----------------------------------------------------------------------------
	//var lyr_refl = layer_get_id("lyr_reflection")
	//layer_script_begin(lyr_refl, scr_set_alpha_lights)
	//layer_script_end(lyr_refl, scr_reset_alpha)

	alpha = 0
	u_alpha = shader_get_uniform(shd_alpha, "alpha")
	
	//  the real game resolution
	global._oldtv_timer = 0.0;
	global.surface_width  = window_get_width();
	global.surface_height = window_get_height();

	global.bufferLastFrame = surface_create( global.surface_width, global.surface_height );
	global.bufferSurface[0] = surface_create( global.surface_width, global.surface_height );
	global.bufferSurface[1] = surface_create( global.surface_width, global.surface_height );

	//  Last frame shadow
	//global._ghost_width = shader_get_uniform(sh_OLDTVFilter_Ghost, "f_screenWidth");
	//global._ghost_height = shader_get_uniform(sh_OLDTVFilter_Ghost, "f_screenHeight");
	//global._ghost_lastframe = shader_get_sampler_index(sh_OLDTVFilter_Ghost, "t_texLastframe")

	//  Noise
	global._noise_pattern = shader_get_sampler_index(sh_OLDTVFilter_Noise, "t_texNoise");
	global._noise_magnetude = shader_get_uniform(sh_OLDTVFilter_Noise, "f_magnetudeNoise");
	global._noise_offset = shader_get_uniform(sh_OLDTVFilter_Noise, "f_offsetNoise");
	global._static_pattern = shader_get_sampler_index(sh_OLDTVFilter_Noise, "t_texStatic");
	global._static_magnetude = shader_get_uniform(sh_OLDTVFilter_Noise, "f_magnetudeStatic");
	global._static_offset = shader_get_uniform(sh_OLDTVFilter_Noise, "f_offsetStatic");
	global._dirt_pattern = shader_get_sampler_index(sh_OLDTVFilter_Noise, "t_texDirt");
	global._dirt_magnetude = shader_get_uniform(sh_OLDTVFilter_Noise, "f_magnetudeDirt");
	gpu_set_texrepeat_ext(global._noise_pattern, true);
	gpu_set_texrepeat_ext(global._static_pattern, true);
	gpu_set_texrepeat_ext(global._dirt_pattern, true);

	//  Composite Filter (NTSC)
	global._composite_count = 0.0;
	global._composite_width = shader_get_uniform(sh_OLDTVFilter_Composite, "f_screenWidth");
	global._composite_height = shader_get_uniform(sh_OLDTVFilter_Composite, "f_screenHeight");
	global._composite_distortion = shader_get_uniform(sh_OLDTVFilter_Composite, "f_distortion");
	global._composite_artifact = shader_get_uniform(sh_OLDTVFilter_Composite, "f_artifact");
	global._composite_fringing = shader_get_uniform(sh_OLDTVFilter_Composite, "f_fringing");
	global._composite_kernel = shader_get_uniform(sh_OLDTVFilter_Composite, "a_kernel");
	global._composite_kernel_flag = false;
	global._composite_kernel_positive[0] = -1.0; global._composite_kernel_positive[1] = 2.0; global._composite_kernel_positive[2] = -1.0; 
	global._composite_kernel_negative[0] = 1.0; global._composite_kernel_negative[1] = -2.0; global._composite_kernel_negative[2] = 1.0; 

	global._bleeding_width = shader_get_uniform(sh_OLDTVFilter_Bleeding, "f_screenWidth");
	global._bleeding_height = shader_get_uniform(sh_OLDTVFilter_Bleeding, "f_screenHeight");
	global._bleeding_bleeding = shader_get_uniform(sh_OLDTVFilter_Bleeding, "f_bleeding");

	//  Television Filter
	global._television_width = shader_get_uniform(sh_OLDTVFilter_Television, "f_screenWidth");
	global._television_brightness = shader_get_uniform(sh_OLDTVFilter_Television, "f_brightness");
	global._television_contrast = shader_get_uniform(sh_OLDTVFilter_Television, "f_contrast");
	global._television_saturation = shader_get_uniform(sh_OLDTVFilter_Television, "f_saturation");
	global._television_sharpness = shader_get_uniform(sh_OLDTVFilter_Television, "f_sharpness");

	//  Chromatic Aberration
	global._chromatic_pattern = shader_get_sampler_index(sh_OLDTVFilter_Chromatic, "t_texChromatic")
	global._chromatic_magnetude = shader_get_uniform(sh_OLDTVFilter_Chromatic, "f_magnetudeChromatic");
	gpu_set_texrepeat_ext(global._chromatic_pattern, true);

	//  Scanline Filter
	global._scanline_width = shader_get_uniform(sh_OLDTVFilter_Scanline, "f_screenWidth");
	global._scanline_height = shader_get_uniform(sh_OLDTVFilter_Scanline, "f_screenHeight");
	global._scanline_pattern = shader_get_sampler_index(sh_OLDTVFilter_Scanline, "t_texScanline")
	global._scanline_magnetude = shader_get_uniform(sh_OLDTVFilter_Scanline, "f_magnetude");
	gpu_set_texrepeat_ext(global._scanline_pattern, true);

	//  Tube Filter
	global._tube_mask = shader_get_sampler_index(sh_OLDTVFilter_Tube, "t_texMask")
	global._tube_distortion = shader_get_uniform(sh_OLDTVFilter_Tube, "f_magnetudeTube");

	surface_resize(application_surface, global.surface_width, global.surface_height);


}
