/// @description draw appSrf
//DRAW LIGHTING SURFACE

//Disable alpha blending
gpu_set_blendenable(false)

if (pause) { // Draw frozen image to screen while paused
	
	surface_set_target(application_surface)
	if (surface_exists(pause_surf)) {
		draw_surface(pause_surf, 0, 0)	
	} else { //Restore from buffer if we lost surface
		pause_surf = surface_create(res_width, res_height)
		buffer_set_surface(pause_surf_buff, pause_surf, 0)
	}
	surface_reset_target()
	//Draw day night filter after game got paused
	if(!surface_exists(srf_lights))
	{
		srf_lights = surface_create(res_width, res_height)	
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
}

if (keyboard_check_pressed(vk_escape)) {
	if(!pause) { // Pause game
		pause = true
		
		//Draw pause menu
		//Find position of camera and place buttons accordingly
		var vx = camera_get_view_x(view_camera[0])
		var vy = camera_get_view_y(view_camera[0])
		var v_width = camera_get_view_width(view_camera[0])/2
		var v_height = camera_get_view_height(view_camera[0])/2
		//instance_create_layer(vx + v_width, vy + v_height, "UI", o_ui_back)
		
		//Deactivate everything except of this instance
		instance_deactivate_all(true)
		
		//Capture this game moment
		pause_surf = surface_create(res_width, res_height)
		surface_set_target(pause_surf)
		draw_surface(application_surface, 0, 0)
		surface_reset_target()
		
		//Back up this surface to a buffer in case we lose it
		if(buffer_exists(pause_surf_buff)) {
			buffer_delete(pause_surf_buff)	
		}
		pause_surf_buff = buffer_create(res_width * res_height * 4, buffer_fixed, 1)
		buffer_get_surface(pause_surf_buff, pause_surf, 0)
	
	} else { //Unpause game
		pause = false
		instance_activate_all()
		if (surface_exists(pause_surf)) {
			surface_free(pause_surf)	
		}
		if (buffer_exists(pause_surf_buff)) {
			buffer_delete(pause_surf_buff)
		}
		
	}
}

//Draw DayNight filter by default
if(!surface_exists(srf_lights))
{
	srf_lights = surface_create(res_width, res_height)	
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

//Enable blending again
gpu_set_blendenable(true)

//DEBUG
//draw_surface(srf_lights, 0, 0)