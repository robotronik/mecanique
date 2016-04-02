$fn = 40;

module support() {
    translate([3,0,6]) cube([8,8,3]);
    translate([0,0,0]) cube([3,8,9]);
    translate([11,0,0]) cube([3,8,9]);
    translate([-10,0,-2]) cube([13,8,3]);
    translate([11,0,-2]) cube([13,8,3]);
}

module supportfin() {
    difference(){
        support();
        translate([7,4,5]) cylinder(d=3, h=8);
        translate([-5,4,-3]) cylinder(d=2, h=8);
        translate([19,4,-3]) cylinder(d=2, h=8);
    }
}
supportfin();