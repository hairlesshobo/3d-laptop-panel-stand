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

kbd_peg_off_y = kbd_board_w/2 - peg_size_female/2;
kbd_origin_x = cross_board_w/2 - kbd_l/2;
kbd_origin_y = kbd_board_w/2 - kbd_w/2;

module make_keyboard_cross()
{
    difference()
    {
        cube([cross_board_w, kbd_board_w, cross_board_th]);

        // left peg hole
        translate([foot_w/2 - peg_size_female/2, kbd_peg_off_y, 0])
            make_peg(peg_size_female, 2);
            
        // right peg hole
        translate([cross_board_w - foot_w/2 - peg_size_female/2, kbd_peg_off_y, 0])
            make_peg(peg_size_female, 2);
    };


    // left standoff
    translate([kbd_origin_x + kbd_hole_l_x + kbd_hole_d/2, kbd_origin_y + kbd_hole_l_y + kbd_hole_d/2, cross_board_th])
        make_standoff(d=kbd_hole_d, h=kbd_pcb_th, pad=kbd_hole_pad_d, offset=kbd_pin_h);

    // pad 1
    translate([kbd_origin_x + kbd_pad_1_x + kbd_hole_d/2, kbd_origin_y + kbd_hole_l_y + kbd_hole_d/2, cross_board_th])
        make_standoff(pad=kbd_pad_d, offset=kbd_pin_h);

    // pad 2
    translate([kbd_origin_x + kbd_pad_2_x + kbd_hole_d/2, kbd_origin_y + kbd_hole_l_y + kbd_hole_d/2, cross_board_th])
        make_standoff(pad=kbd_pad_d, offset=kbd_pin_h);


    // pad 3
    translate([kbd_origin_x + kbd_pad_3_x + kbd_hole_d/2, kbd_origin_y + kbd_pad_y, cross_board_th])
        make_standoff(pad=kbd_pad_d, offset=kbd_pin_h);

    // pad 4
    translate([kbd_origin_x + kbd_pad_4_x + kbd_hole_d/2, kbd_origin_y + kbd_pad_y, cross_board_th])
        make_standoff(pad=kbd_pad_d, offset=kbd_pin_h);

    // right standoff
    translate([kbd_origin_x + kbd_hole_r_x + kbd_hole_d/2, kbd_origin_y + kbd_hole_r_y + kbd_hole_d/2, cross_board_th])
        make_standoff(d=kbd_hole_d, h=kbd_pcb_th, pad=kbd_hole_pad_d, offset=kbd_pin_h);

}

make_keyboard_cross();