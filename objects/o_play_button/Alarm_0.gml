if not instance_exists(o_ui_back_loadout) and not instance_exists(o_ui_back_settings)
	instance_create_layer(x, y+160, "SettingsBase" ,o_ui_back_play)
	//room_goto(rm_endless_rg_start)