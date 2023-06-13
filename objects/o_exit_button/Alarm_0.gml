if(not instance_exists(o_ui_back_settings) and not instance_exists(o_ui_back_loadout))
	o_save_manager.save()
	game_end()
	