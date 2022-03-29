/// @description Init

// BASICS:
// ----------------------------------------------------------------------------
application_surface_draw_enable(false)
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

