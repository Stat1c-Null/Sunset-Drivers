var amount = irandom_range(5, 35)

repeat(amount) {
	
	var angleDiff = random_range(-35, 35)
	
	part_type_direction(particle_trail, direction - angleDiff, direction - angleDiff,0, 5)
	
	part_particles_create(particle_syst, x, y, particle_trail, 1)
	
}
