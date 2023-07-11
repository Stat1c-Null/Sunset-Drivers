if not loadout_on and not instance_exists(o_ui_back_settings){
	instance_create_layer(x,y + 30, "SettingsBase", o_ui_back_loadout)
	loadout_on = true
}