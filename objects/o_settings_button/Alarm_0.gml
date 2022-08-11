
switch(settings_on) {
	case false:
		instance_create(x + 450, y, o_ui_med)	
		settings_on = true
	break
	
	case true:
		instance_destroy(o_ui_med)
		settings_on = false
	break
} 