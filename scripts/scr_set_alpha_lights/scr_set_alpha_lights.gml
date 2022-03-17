function scr_set_alpha_lights() {

	shader_set(shd_alpha)
	with obj_day_and_night_lights shader_set_uniform_f(u_alpha, alpha)

}
