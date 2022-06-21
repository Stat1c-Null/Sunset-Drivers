draw_set_color(c_olive)
draw_set_alpha(image_alpha)
if previd != 0 and instance_exists(previd) {draw_line_width(x,y,previd.x,previd.y,7)} 
draw_set_alpha(1)
if global.teleport_collision == true {instance_destroy(self)}
