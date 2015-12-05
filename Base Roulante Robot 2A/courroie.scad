module courroie() {
    _diam_roue = 29.1;
    _larg_courroie = 14.9;

    rotate([0,0,90]) {
    difference() {
        translate([0, 0,-_diam_roue/2])
            cube([74-_diam_roue, _larg_courroie, _diam_roue]);
        translate([0,-1,-_diam_roue/2+1])
            cube([74-_diam_roue, _larg_courroie+1, _diam_roue-2]);
    }
    rotate([-90,0,0]) cylinder(d=_diam_roue,_larg_courroie );
    translate([74-_diam_roue,0,0])
        rotate([-90,0,0]) cylinder(d=_diam_roue,_larg_courroie );

    }
}
