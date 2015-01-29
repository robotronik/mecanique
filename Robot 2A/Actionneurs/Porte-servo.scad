$fn=50;
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
	translate([0,-5.5,22]) rotate([0,90,0])cylinder(100, d=3.5);
	// Impression retournée
	translate([0,-5.5,20]) rotate([0,90,0])cylinder(100, d=3.5);
}