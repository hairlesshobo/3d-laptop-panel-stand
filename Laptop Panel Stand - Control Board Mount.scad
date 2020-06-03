include <_shared.scad>;

ctlb_peg_off_y = kbd_board_w/2 - peg_size_female/2;
ctlb_origin_x = cross_board_w/2 - ctlb_l/2;
ctlb_origin_y = ctlb_board_w/2 - ctlb_w/2;

module make_control_board_cross()
{
    difference()
    {
        cube([cross_board_w, ctlb_board_w, cross_board_th]);

        // left rear peg hole
        translate([foot_w/2 - peg_size_female/2, ctlb_board_w - peg_size_female - rear_peg_offset, 0])
            make_peg(peg_size_female, 2);
    
        // left front peg hole
        translate([foot_w/2 - peg_size_female/2, ctlb_board_w - peg_size_female - rear_peg_offset - rear_peg_spacing, 0])
            make_peg(peg_size_female, 2);
            
        // right rear peg hole
        translate([cross_board_w - foot_w/2 - peg_size_female/2, ctlb_board_w - peg_size_female - rear_peg_offset, 0])
            make_peg(peg_size_female, 2);
    
        // right front peg hole
        translate([cross_board_w - foot_w/2 - peg_size_female/2, ctlb_board_w - peg_size_female - rear_peg_offset - rear_peg_spacing, 0])
            make_peg(peg_size_female, 2);
    };
    

    // top left standoff
    translate([ctlb_origin_x + ctlb_hole_1[0] + ctlb_hole_d/2, ctlb_origin_y + ctlb_hole_1[1] + ctlb_hole_d/2, cross_board_th])
        make_standoff(d=ctlb_hole_d, h=ctlb_pcb_th, pad=ctlb_hole_pad_d, offset=ctlb_pin_h);
    
    // top right standoff
    translate([ctlb_origin_x + ctlb_hole_2[0] + ctlb_hole_d/2, ctlb_origin_y + ctlb_hole_2[1] + ctlb_hole_d/2, cross_board_th])
        make_standoff(d=ctlb_hole_d, h=ctlb_pcb_th, pad=ctlb_hole_pad_d, offset=ctlb_pin_h);
    
    // bottom right standoff
    translate([ctlb_origin_x + ctlb_hole_3[0] + ctlb_hole_d/2, ctlb_origin_y + ctlb_hole_3[1] + ctlb_hole_d/2, cross_board_th])
        make_standoff(d=ctlb_hole_d, h=ctlb_pcb_th, pad=ctlb_hole_pad_d, offset=ctlb_pin_h);
    
    // bottom left standoff
    translate([ctlb_origin_x + ctlb_hole_4[0] + ctlb_hole_d/2, ctlb_origin_y + ctlb_hole_4[1] + ctlb_hole_d/2, cross_board_th])
        make_standoff(d=ctlb_hole_d, h=ctlb_pcb_th, pad=ctlb_hole_pad_d, offset=ctlb_pin_h);
}

make_control_board_cross();