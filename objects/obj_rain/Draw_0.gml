//set drawing data
draw_set_color(c_white);
draw_set_alpha(.6);

var length; //length of drop
var vectorx, vectory; //distance from middle of screen

//calculate 3d vectors
vectorx = (x-(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2))/(__view_get( e__VW.WView, 0 )/2);
vectory = (y-(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2))/(__view_get( e__VW.HView, 0 )/2);

length = 2;//length of rain drop

//draw the rain drop
draw_line_width(x+vectorx*sqr(height) ,y+vectory*sqr(height),
        x+vectorx*sqr(height+length),y+vectory*sqr(height+length),2);
        
//reset draw data
draw_set_alpha(1);

