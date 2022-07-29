/// @description 

//Create particles system
particle_syst = part_system_create_layer("Particles", 0)

particle_trail = part_type_create()

part_type_sprite(particle_trail, s_tree_particle, 0, 0, 1)
part_type_life(particle_trail, 15, 35)
part_type_alpha3(particle_trail, 1, 1, 0)
part_type_size(particle_trail, 1, 3, 0.1, 0.5)
part_type_blend(particle_trail, 1)
part_type_gravity(particle_trail, 0.3, 300)

alarm[0] = 5

loopAlarmMin = 1
loopAlarmMax = 10
