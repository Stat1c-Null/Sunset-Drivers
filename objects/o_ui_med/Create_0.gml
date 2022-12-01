

switch(global.mode) {
	case "settings":
		instance_create_layer(x, y - 50, "Base", o_fullscreen_button)
		instance_create_layer(x + 160, y - 110, "Base", o_close_button)
		//instance_create_layer(x, y + 50, "Base", o_filter_button)
	break
}