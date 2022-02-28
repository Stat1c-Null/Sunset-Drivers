draw_set_alpha(1)
draw_sprite_ext(spr_wheel,0,x+lengthdir_x(center_to_front*0.75,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/12,-phy_rotation+90),y+lengthdir_y(center_to_front*0.75,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/12,-phy_rotation+90),1,1,-phy_rotation + richting*0.8,c_white,image_alpha)
draw_sprite_ext(spr_wheel,0,x+lengthdir_x(center_to_front*0.75,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/12,-phy_rotation-90),y+lengthdir_y(center_to_front*0.75,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/12,-phy_rotation-90),1,1,-phy_rotation + richting*0.8,c_white,image_alpha)
draw_self()


