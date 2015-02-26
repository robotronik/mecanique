$fn=50;

module bloc() {
    translate([0,0,0])       cube([20,41,36]);
    translate([0,-6.5,23.5]) cube([20,54,10]);

	translate([ 5.5,  -3.25,14]) vis();
	translate([14.5,  -3.25,14]) vis();
	translate([ 5.5,41+3.25,14]) vis();
	translate([14.5,41+3.25,14]) vis();

    translate([10,10,36]) cylinder(d=15, h=2);
}
module vis(l) {
    cylinder(d=1,5, h=10);
}

bloc();
//#vis();
/*
translate([0,0,48]) cube([25,5,7]);
difference() {
	cube([25, 24, 55]);
	union() {
		translate([4,0,7]) cube([21,25,41]);
		translate([0,0,48]) cube([25,5,7]);
	}
}

difference() {
	translate([0,-11,0]) cube([14, 11, 55]);
	// Impression directe
	//translate([-1,-5.5,22]) rotate([0,90,0])cylinder(100, d=3.5);
	// Impression retournée
	translate([-1,-5.5,20]) rotate([0,90,0])cylinder(100, d=3.5);
}
*/