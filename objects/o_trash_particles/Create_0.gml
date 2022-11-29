//Create particles system
var min_speed = 7
var max_speed = 15
var min_life = 100
var max_life = 200
var size_inc = 0.01
var size_wiggle = 0

particle_syst = part_system_create_layer("Particles", 0)

particle_trail = part_type_create()

part_type_sprite(particle_trail, s_trash_particles, 0, 1, 1)
part_type_life(particle_trail, min_life, max_life)
part_type_orientation(particle_trail, 0, 359, 30, 40, 0)
//part_type_alpha3(particle_trail, 1, 1, 0)
part_type_size(particle_trail, 1, 2, size_inc, size_wiggle)
//part_type_blend(particle_trail, 1)
part_type_speed(particle_trail, min_speed, max_speed, -0.001, 0)

alarm[0] = 5




