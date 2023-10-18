if not credits_on and not instance_exists(o_ui_back_settings){
	instance_create_layer(x + 140,y - 55, "SettingsBase", o_ui_back_credits)
	credits_on = true
}