

switch(global.mode) {
	case "settings":
		instance_create_layer(x + 160, y - 110, "SettingsTop", o_close_button)
		instance_create_layer(x - 130, y - 30, "SettingsTop", o_metric_checkmark)
	break
}