instance_destroy(o_ui_back_settings)
instance_destroy(o_settings_display_button)
if(instance_exists(o_ui_med) or instance_exists(o_close_button)) {
	instance_destroy(o_ui_med)	
	instance_destroy(o_close_button)	
}

instance_destroy(self)