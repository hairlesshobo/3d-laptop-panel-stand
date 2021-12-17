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