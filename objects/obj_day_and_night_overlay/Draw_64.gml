/// @description draw appSrf

//
shader_set(shader);
shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
draw_surface(application_surface, 0, 0);
shader_reset();