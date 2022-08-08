function scr_OLDTVFilter_Draw() {
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

	// Bilinear Filter
	gpu_set_tex_filter(true);
   
	//  Surface Size
	var window_width  = window_get_width();
	var window_height = window_get_height();
	var surface_width = surface_get_width(application_surface);
	var surface_height = surface_get_height(application_surface);

	//	Do nothing if the windows size is too small
	if ( window_width < 1 || window_height < 1 ) {
		return 0;
	}

	var surface_aspect = global.game_lines / window_height;
    
	// Resize GUI
	display_set_gui_size(surface_width, surface_height);

	if( global.oldtvfilter_enabled ) {
	    //  Surface Flag
	    var surfaceFlag = 0;
    
	    //  Create or Resize the Surfaces
		//	Disable it to keep the aspect ratio??
		if( !global.keep_aspect_ratio ) {
			if (surface_width != window_width || surface_height != window_height) {
			    surface_resize(application_surface, window_width, window_height);
			}
		}
		
	    for( var i=0; i < 2; i++ ) {
	        if( surface_exists(global.bufferSurface[i]) ) {
				if (surface_width != window_width || surface_height != window_height) {
					surface_resize(global.bufferSurface[i], window_width, window_height);
				}
			} else {
	            global.bufferSurface[i] = surface_create( window_width, window_height );
			}
	    }
	
	    surface_set_target(global.bufferSurface[!surfaceFlag]);
	    draw_surface_stretched(application_surface, 0, 0, window_width, window_height);
	    surface_reset_target();

	    global._oldtv_timer += 15.0 / room_speed;
	    if( global._oldtv_timer > 1.0 ) {
	        global._oldtv_timer -= 1.0;
	        global.noise_offset = random_range(0.0, 10.0);
	        global._composite_kernel_flag = !global._composite_kernel_flag;
	    }
    
	    //  Noise
	    if( global.noise_enabled ) {
	        gpu_set_texrepeat_ext(global._noise_pattern, true);
	        gpu_set_texrepeat_ext(global._static_pattern, true);
	        gpu_set_texrepeat_ext(global._dirt_pattern, true);
    
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Noise);
	                texture_set_stage(global._noise_pattern, global.noise_pattern);
	                shader_set_uniform_f(global._noise_magnetude, global.noise_magnetude);
	                shader_set_uniform_f(global._noise_offset, global.noise_offset);
                
	                texture_set_stage(global._static_pattern, global.static_pattern);
	                shader_set_uniform_f(global._static_magnetude, global.static_magnetude*global.static_magnetude);
					shader_set_uniform_f(global._static_offset, global.static_offset);

	                texture_set_stage(global._dirt_pattern, global.dirt_pattern);
	                shader_set_uniform_f(global._dirt_magnetude, global.dirt_magnetude*global.dirt_magnetude);
                
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
	    }
    
	    //  Composite
	    if( global.composite_enabled ) {
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Composite);
	                shader_set_uniform_f(global._composite_width, 1.0/(window_width*surface_aspect));
	                shader_set_uniform_f(global._composite_height, 1.0/(window_height*surface_aspect));
	                shader_set_uniform_f(global._composite_distortion, global.composite_distortion);
	                shader_set_uniform_f(global._composite_artifact, global.composite_artifact);
	                shader_set_uniform_f(global._composite_fringing, global.composite_fringing);
	                if( global._composite_kernel_flag )
	                    shader_set_uniform_f_array(global._composite_kernel, global._composite_kernel_positive);
	                else
	                    shader_set_uniform_f_array(global._composite_kernel, global._composite_kernel_negative);                
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
    
	        if( global.composite_secondpass_enabled ) {
	            surface_set_target(global.bufferSurface[surfaceFlag]);
	                shader_set(sh_OLDTVFilter_Composite);
	                    shader_set_uniform_f(global._composite_width, 0.5/(window_width*surface_aspect));
	                    shader_set_uniform_f(global._composite_height, 0.5/(window_height*surface_aspect));
	                    shader_set_uniform_f(global._composite_distortion, global.composite_distortion);
	                    shader_set_uniform_f(global._composite_artifact, global.composite_artifact);
	                    shader_set_uniform_f(global._composite_fringing, global.composite_fringing);
	                    if( global._composite_kernel_flag )
	                        shader_set_uniform_f_array(global._composite_kernel, global._composite_kernel_positive);
	                    else
	                        shader_set_uniform_f_array(global._composite_kernel, global._composite_kernel_negative);                
	                    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	                shader_reset();
	            surface_reset_target();
            
	            surfaceFlag = !surfaceFlag;
	        }
        
	        if( global.composite_bleeding != 0.0 ) {
	            surface_set_target(global.bufferSurface[surfaceFlag]);
	                shader_set(sh_OLDTVFilter_Bleeding);
	                    shader_set_uniform_f(global._bleeding_width, 1.0/(window_width*surface_aspect));
	                    shader_set_uniform_f(global._bleeding_height, 1.0/(window_height*surface_aspect));
	                    shader_set_uniform_f(global._bleeding_bleeding, global.composite_bleeding);
	                    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	                shader_reset();
	            surface_reset_target();
            
	            surfaceFlag = !surfaceFlag;
	        }
	    }
       
	    //  Television
	    if( global.television_enabled ) {
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Television);
	                shader_set_uniform_f(global._television_width, 1.0/(window_width*surface_aspect));
	                shader_set_uniform_f(global._television_brightness, global.television_brightness);
	                shader_set_uniform_f(global._television_contrast, (1.016 * (global.television_contrast + 1.0)) / (1.016 * (1.016 - global.television_contrast)));
	                shader_set_uniform_f(global._television_saturation, -(global.television_saturation * 2.0 - 1.0));
	                shader_set_uniform_f(global._television_sharpness, global.television_sharpness);
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
	    }
    
	    //  Chromatic Aberration
	    if( global.chromatic_enabled ) {
	        gpu_set_texrepeat_ext(global._chromatic_pattern, true);
    
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Chromatic);
	                texture_set_stage(global._chromatic_pattern, (global.chromatic_pattern));
	                shader_set_uniform_f(global._chromatic_magnetude, global.chromatic_magnetude * global.chromatic_magnetude);
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
	    }
    
	    //  Scanline
	    if( global.scanline_enabled ) {
	        gpu_set_texrepeat_ext(global._scanline_pattern, true);
    
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Scanline);
	                shader_set_uniform_f(global._scanline_width, window_width * ( global.scanline_count / window_height ));
	                shader_set_uniform_f(global._scanline_height, global.scanline_count);
	                texture_set_stage(global._scanline_pattern, (global.scanline_pattern));
	                shader_set_uniform_f(global._scanline_magnetude, 1.0 - global.scanline_magnetude);
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
	    }
    
	    //  Tube
	    if( global.tube_enabled ) {
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Tube);
	                texture_set_stage(global._tube_mask, (global.tube_mask));
	                shader_set_uniform_f(global._tube_distortion, global.tube_distortion);
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
    
	        surfaceFlag = !surfaceFlag;
	    }
    
	    //  Draw
	    draw_surface_stretched(global.bufferSurface[!surfaceFlag], 0, 0, surface_width, surface_height);
	    //draw_surface_stretched(global.bufferSurface[!surfaceFlag], 0, 0, surface_get_width(global.bufferSurface[!surfaceFlag]), surface_get_height(global.bufferSurface[!surfaceFlag]));
	    //draw_surface_stretched(global.bufferSurface[!surfaceFlag], 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
	    //draw_surface_stretched(global.bufferSurface[!surfaceFlag], 0, 0, surface_width, surface_height);
	} else {
	    draw_surface_stretched(application_surface, 0, 0, surface_width, surface_height);
	}

	/// DRAW PLAYER GUI
	/// DRAW PLAYER GUI
	//VHS PLAY
	draw_set_color(c_ltgray)
	draw_set_font(f_vhs)
	draw_text(100, 100, "PLAY >")
	draw_text(100, 1230, "SP")

	//Gas Gas Gas i am gonna step on the gas tonight we'll fly
	draw_sprite_ext(GasUI, 1, 146, 200, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
	draw_sprite(UIBack, 1, 100, 200)

	//Condition
	draw_sprite_ext(s_condition_front, 1, 1656, 200, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
	draw_sprite(s_condition_back, 1, 1610, 200)

	//Speeeeeed
	//draw_text(1600, 270, "MPH: " + string(round(global.mphSpeed)) + "/" + string(round(global.phySpeed)))
	draw_sprite(s_speedometer, 1, 1710, 500)
	var arrow_rot = 360 - global.mphSpeed
	draw_sprite_ext(s_speed_arrow, 1, 1710, 500, image_xscale, image_yscale, arrow_rot, image_blend, image_alpha)
	draw_set_color(c_green)
	draw_text(1750, 630, round(global.mphSpeed))
	draw_set_color(c_red)
	draw_text(1775, 585, global.gear)
	draw_sprite(s_gear_m, 1,1855, 630)
	//Score
	//draw_set_font(f_debug)
	draw_set_color(c_yellow)
	draw_text(907, 100, "SCORE")
	draw_text(905, 105, "_____")
	draw_set_color(c_orange)
	calculate_score(obj_car.player_score, obj_car.score_y_pos)
	draw_text(930, 180, string(round(obj_car.player_score)))
	draw_sprite(s_dollar_bill_ui, 1, 160, 425)
	if(global.not_enough_money){
		global.not_enough_money = false
		draw_set_color(c_red) 
		alarm[2] = room_speed * obj_car.money_timer
	} else {
		draw_set_color(c_lime)
	}
	draw_text(260, 400, "$" + string(global.dollars))
	//Draw Time Clock
	draw_set_color(c_ltgray)
	draw_text(1600, 1000, string(global.army_time))
	draw_text(1600, 1000, "MAR.0" + string(global.day) + ".1997")
	draw_text(1600, 1000, "MAR.0" + string(global.day) + ".1997")
	//Draw Police Timer
	draw_text(100, 1000, "Distance to Police: ")
	draw_set_color(c_fuchsia)
	draw_text(550, 1000, string(floor(global.final_dist)) + " feet")


}
