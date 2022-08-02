/// @description 
if(global.final_dist <= death_distance){
	global.health = 0	
}

//Calculate if police came close enough to the player
var player_x = instance_nearest(x,y,obj_car).x
var player_y = instance_nearest(x,y,obj_car).y
var police_x = instance_nearest(x,y,o_police_car).x
var police_y = instance_nearest(x,y,o_police_car).y

distance_betw = point_distance(player_x, player_y, police_x, police_y)

global.final_dist = distance_betw / 10
