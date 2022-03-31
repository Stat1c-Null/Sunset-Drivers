/// @description draw appSrf
//DRAW LIGHTING SURFACE
if(!surface_exists(srf_lights))
{
	srf_lights = surface_create(surface_get_width(application_surface), surface_get_height(application_surface))	
	tex_lights = surface_get_texture(srf_lights)
}
surface_set_target(srf_lights)
//Set surface and GPU
draw_clear(c_black)
gpu_set_blendmode(bm_add)
gpu_set_tex_filter(true) // optional
//draw light sprites
var lights_strength = 0.7 //0 no light 1 max light
var vx = camera_get_view_x(view_camera[0])
var vy = camera_get_view_y(view_camera[0])
//with(o_light_parent)
//	draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * lights_strength)
//reset GPU
gpu_set_tex_filter(false)
gpu_set_blendmode(bm_normal)
surface_reset_target()

//DRAW APPLICATION SURFACE
shader_set(shader);
shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
texture_set_stage(s_lights, tex_lights)//MAYBE NEEDS TO BE CHANGED LATER
draw_surface(application_surface, 0, 0);
shader_reset();

//DEBUG
//draw_surface(srf_lights, 0, 0)
