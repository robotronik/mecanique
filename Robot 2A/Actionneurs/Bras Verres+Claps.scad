$fn=50;

translate([-9,6,10])rotate([90,0,0])difference() {
	translate([0,-2,0])cube([18,42,6]);
	union() {
		translate([9,10,0]) cylinder(20, d=2.5);
		translate([9,20,0]) cylinder(20, d=8);
		translate([9,30,0]) cylinder(20, d=2.5);
	}
}
translate([0,0,0]) {
	translate([-9,-36,0])cube([14,42,10]);
	translate([-9,0,5]) cube([18,6,5]);
	translate([4,-42,5]) rotate([-90,0,0]) cylinder(48, d=10);	
}

translate([-135,-42,0]) {
	cube([140,10,10]);
	translate([0,10,5]) rotate([0,90,0]) cylinder(140, d=10);
}

translate([-140,-42,0]) {
	translate([0,5,0]) cube([10, 85, 5]);
 	translate([5,5,5]) rotate([-90,0,0]) cylinder(85, d=10);

 	translate([5,90,0]) rotate([0,0,0]) cylinder(5, d=10);
	translate([5,90,5]) sphere(d=10);

 	translate([5,5,0]) rotate([0,0,0]) cylinder(5, d=10);
	intersection() {
 		translate([5,5,0]) rotate([0,0,0]) cylinder(10, d=10);
 		translate([5,0,5]) rotate([-90,0,0]) cylinder(10, d=10);
	}
}