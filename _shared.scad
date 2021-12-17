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

v_support_th = 8;
v_support_attach_h = 35;
v_support_d = 20;

//
// Panel Dimensions
//
// Add 3.5 to screen_h (not sure why, but do it)
//
// B156XTN02.2
screen_h = 211.5;
screen_d_space = 2;
screen_d = 5.5;
screen_bezel_w = 5;

// N156B3-L02
//screen_h = 211.5;
//screen_d_space = 2;
//screen_d = 6.2;
//screen_bezel_w = 5;

// 
// END Panel Dimensions
//

vertical_support_offset = 2;
screen_v_angle = 0;

clamp_front_th = 2;
clamp_th = 5;

foot_h = 7.5;
foot_w = 30;
foot_rear_l = 90;
foot_front_l = 35;

peg_height = 3;
peg_size = 6;
peg_size_female = 6.5;
rear_peg_offset = 10;
rear_peg_spacing = 30;

screw_head_d = 11.75;
screw_head_h = 2.75;
screw_shaft_d = 4.0;
screw_shaft_l = 13.25;

cross_board_th = 3;
cross_board_w = 190;

kbd_l = 104.09;
kbd_w = 22.6;
kbd_pcb_th = 1.5;
kbd_pin_h = 2.65;

// measured from origin, which is front left
kbd_hole_l_x = 8.4;
kbd_hole_l_y = 12.9;
kbd_hole_r_x = 93.46;
kbd_hole_r_y = 12.75;

kbd_pad_d = 3.5;
kbd_pad_1_x = 70;
kbd_pad_2_x = 30;
kbd_pad_3_x = 65.21;
kbd_pad_4_x = 35.19;
kbd_pad_y = 5.5;

kbd_hole_d = 2.75; //subtract 0.15 for tolerance
kbd_hole_pad_d = 5.5;

kbd_board_w = 25;

ctlb_l = 139;
ctlb_w = 58;
ctlb_board_w = 60;
ctlb_pin_h = 2.65;
ctlb_pcb_th = 1.2;

ctlb_hole_d = 3.25; // subtract 0.15 for tolerance
ctlb_hole_pad_d = 8;

// from origin [x, y]
ctlb_hole_1 = [11.6, 35.45];
ctlb_hole_2 = [124.4, 35.24];
ctlb_hole_3 = [123.56, 7.23];
ctlb_hole_4 = [17.86, 7.38];



/*
 *
 * End Configuration
 *
 */
 
support_h = screen_h + ( clamp_th * 2);
clamp_channel = screen_bezel_w - 1;
clamp_d = screen_d + screen_d_space + clamp_front_th;
clamp_h = clamp_channel + clamp_th;

foot_depth = foot_front_l + foot_rear_l + clamp_d + v_support_th;

hsp_y = foot_front_l + clamp_d + v_support_th;

total_screw_length = screw_head_h + screw_shaft_l;
screw_thread_hole_l = (total_screw_length - foot_h) + 1;

module make_peg(size = peg_size, extra_z=0)
{
    color("red")
    cube([size, size, peg_height + extra_z]);
}

module make_standoff(d=undef, h=undef, pad, offset)
{
    translate([0, 0, 0]);
    if (d != undef && h != undef)
        cylinder(d=d, h=ceil(h) + ceil(offset), $fn=360);
    cylinder(d=pad, h=offset, $fn=360);
}