difference() {
	cube([25, 24, 55]);
	union() {
		translate([4,0,7]) cube([21,25,41]);
		translate([0,0,48]) cube([25,5,7]);
	}
}
translate([0,-11,0]) cube([14, 11, 55]);