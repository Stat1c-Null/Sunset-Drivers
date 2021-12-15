if(instance_exists(obj_car)) {
	//Gas Gas Gas i am gonna step on the gas tonight we'll fly
	draw_sprite(UIBack, 1, 100, 100)
	draw_sprite_ext(GasUI, 1, 146, 100, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
}
