
switch(settings_on) {
	case false:
		instance_create_layer(x + 450, y,"BaseBack", o_ui_med)	
		settings_on = true
		global.mode = "settings"
	break
	
	case true:
		instance_destroy(o_ui_med)
		instance_destroy(o_close_button)
		settings_on = false
	break
}