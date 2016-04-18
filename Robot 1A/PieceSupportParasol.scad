$fn = 40;

diametre_trou_parasol=3;
diametre_vis=3;
epaisseur=3;

module support() {
    translate([3,0,6]) cube([8,8,epaisseur]);
    translate([0,0,0]) cube([epaisseur,8,9]);
    translate([11,0,0]) cube([epaisseur,8,9]);
    translate([-10,0,-2]) cube([13,8,epaisseur]);
    translate([11,0,-2]) cube([13,8,epaisseur]);
}

module supportfin() {
    difference(){
        support();
        translate([7,4,5]) cylinder(d=diametre_trou_parasol, h=8);
        translate([-5,4,-3]) cylinder(d=diametre_vis, h=8);
        translate([19,4,-3]) cylinder(d=diametre_vis, h=8);
    }
}
supportfin();