$fn=50;

include <../../Modèles/Servo.scad>


difference() {
	cube([25, 24, 55]);
	union() {

		translate([4,1,48])
            rotate([-90,0,0])servo();
		translate([23,0,7]) cube([21,25,41]);
		translate([4,0,7])  cube([21,5,41]);
		translate([0,0,48]) cube([25,5,7]);
	}
}

difference() {
	translate([0,-6,0]) cube([14, 6, 55]);
	translate([4+2.5,-20,30+7])
        rotate([-90,0,0])
        #cylinder(100, d=3.5);
}