/// @description iterate downward
height -= 1; //speed the rain falls, higher = faster

//if the rain hits the ground, it splashes
if(height <= 0)
{
    instance_destroy();
    instance_create(x,y,obj_splash);
}

