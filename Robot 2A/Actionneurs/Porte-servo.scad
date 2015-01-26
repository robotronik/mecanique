difference() {
	cube([25, 24, 55]);
	translate([4,0,7]) union() {
		cube([21,25,41]);
		translate([6,0,40]) cube([15,5,10]);
	}
}
translate([0,-11,0]) cube([14, 11, 55]);