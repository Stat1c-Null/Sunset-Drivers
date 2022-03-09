edge = 200;//distance outside the view to make extra rain

repeat(30)//number of drops to make each step
{
    //make rain drops appear randomly
    instance_create(__view_get( e__VW.XView, 0 )-edge+random(__view_get( e__VW.WView, 0 )+edge*2),__view_get( e__VW.YView, 0 )-edge+random(__view_get( e__VW.HView, 0 )+edge*2),obj_rain);
}

