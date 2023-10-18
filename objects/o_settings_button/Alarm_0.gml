
/*switch(settings_on) {
	case false:
		//instance_create_layer(x + 450, y,"BaseBack", o_ui_med)
		instance_create_layer(x, y, "SettingsBase", o_ui_back_settings)
		settings_on = true
		global.mode = "settings"
	break
	
	case true:
		instance_destroy(o_ui_med)
		instance_destroy(o_close_button)
		settings_on = false
	break
}*/
if not instance_exists(o_ui_back_loadout)
	instance_create_layer(x - 130, y - 60, "SettingsBase", o_ui_back_settings)
	settings_on = true
	global.mode = "settings"
