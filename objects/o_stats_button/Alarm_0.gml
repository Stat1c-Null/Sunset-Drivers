if not stats_on and not instance_exists(o_ui_back_settings){
	instance_create_layer(x - 150,y - 20, "SettingsBase", o_ui_stats)
	stats_on = true
}