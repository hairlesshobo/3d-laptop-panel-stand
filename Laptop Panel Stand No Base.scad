include <Laptop Panel Stand.scad>;

rotate([0, 90, 0])
make_only_stand();
/*
intersection()
{
    make_only_stand();
    translate([0, foot_front, base_h])
    cube([vertical_support_attach, vertical_support_attach+10, vertical_support_attach-20]);
};
*/