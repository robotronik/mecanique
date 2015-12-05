module courroie() {
    _diam_roue = 29.1;
    _larg_courroie = 14.9;
    translate([0,0,-_diam_roue/2])
        cube([74-_diam_roue,_larg_courroie,_diam_roue]);
        rotate([-90,0,0]) cylinder(d=_diam_roue,_larg_courroie );
    translate([74-_diam_roue,0,0])
        rotate([-90,0,0]) cylinder(d=_diam_roue,_larg_courroie );
}