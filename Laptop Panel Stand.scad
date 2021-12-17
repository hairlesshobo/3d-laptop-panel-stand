/*
 *  Laptop Panel Stand
 * 
 *  Copyright (c) 2019-2021 Steve Cross <flip@foxhollow.cc>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

include <_shared.scad>;

module make_vertical_support()
{
    union()
    {
        cube([foot_w, v_support_th, support_h]);

        // bottom channel
        difference()
        {
            //color("green")
            translate([0, -clamp_d, 0]) 
            cube([foot_w, clamp_d, clamp_h]);
                
            //color("red")
            translate([0, -clamp_d + clamp_front_th, clamp_h-clamp_channel])
            cube([foot_w+2, screen_d, clamp_channel+1]);
        };

        // top channel
        translate([foot_w, 0, support_h])
        rotate([0, 180, 0])
        difference()
        {
            //color("green")
            translate([0, -clamp_d, 0]) 
            cube([foot_w, clamp_d, clamp_h]);
                
            //color("red")
            translate([0, -clamp_d + clamp_front_th, clamp_h-clamp_channel])
            cube([foot_w+2, screen_d, clamp_channel+1]);
        };
    };
};

module make_screw_hole()
{
    union()
    {
        color("purple")
        translate([0, 0, 0])
        cylinder(d=screw_shaft_d*1.15, h=foot_h, $fn=360);
        
        color("purple")
        translate([0, 0, -1])
        cylinder(d=screw_head_d, h=screw_head_h+1, $fn=360);
        
    };
}

module make_thread_hole()
{
    color("orange")
    translate([0, 0, 0])
    cylinder(d=screw_shaft_d-0.4, h=screw_thread_hole_l, $fn=360);
}

module make_base()
{
    difference()
    {
        union()
        {    
            cube([foot_w, foot_depth, foot_h]);
            
            translate([(foot_w/2 - peg_size/2), (foot_front_l/2 - peg_size/2), foot_h])
            make_peg();
            
            rps = foot_depth - peg_size - rear_peg_offset;
            
            translate([(foot_w/2 - peg_size/2), rps, foot_h])
            make_peg();
            
            translate([(foot_w/2 - peg_size/2), rps - rear_peg_spacing, foot_h])
            make_peg();
        };
        
        translate([foot_w/2, hsp_y, 0])
            make_screw_hole();

        translate([foot_w/2, hsp_y + screw_head_d + 2, 0])
            make_screw_hole();
    };
}

module make_stand_no_brace()
{
    translate([0, foot_front_l + clamp_d + vertical_support_offset, foot_h/1.5])
        rotate([-screen_v_angle, 0, 0])
        color("green")
        make_vertical_support();

    make_base();
}

module make_stand_with_brace()
{
    bsp_x = foot_h;
    bsp_y = foot_front_l + clamp_d + v_support_th;

    triangle_points =
    [
        // point 0 (origin)
        [bsp_x,bsp_y],

        // point 1 (vertical support)
        [v_support_attach_h * cos(screen_v_angle) + bsp_x,v_support_attach_h * sin(screen_v_angle) + bsp_y],

        // point 2 (base)
        [bsp_x,bsp_y + v_support_d]
    ];

    difference()
    {
        translate([0, 0, 0])
        union()
        {
            color ("blue")
            translate([foot_w, vertical_support_offset, 0])
            rotate([0, -90, 0])
            linear_extrude(height=foot_w)
                polygon(triangle_points, [[0,1,2]], 10);

            make_stand_no_brace();
        }
        
        translate([foot_w/2, hsp_y, foot_h])
            make_thread_hole();

        translate([foot_w/2, hsp_y + screw_head_d + 2, foot_h])
            make_thread_hole();
    };
}


module make_only_stand()
{
    difference()
    {
        make_stand_with_brace();
        make_base();
        translate([foot_w/2, hsp_y, 0])
            make_screw_hole();

        translate([foot_w/2, hsp_y + screw_head_d + 2, 0])
            make_screw_hole();
    };
}
