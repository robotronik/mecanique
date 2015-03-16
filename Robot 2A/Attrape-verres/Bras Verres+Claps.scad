$fn=50;
module tout() {
translate([-9,6,10])rotate([90,0,0])difference() {
	translate([0,-6,0])cube([18,34,6]);
	
	union() {
		translate([7,5.5,0]) cylinder(20, d=2.5);
		translate([7,15,0]) cylinder(20, d=8);
		translate([7,24.5,0]) cylinder(20, d=2.5);
	}
}
translate([2.5,-18,7]) difference(){cube([6.5,18,28]);
rotate([57.5,0,0])cube([7,100,100]);
}
translate([0,0,0]) {
	translate([-9,-56,0])cube([14,62,10]);
	translate([5,-62,5]) rotate([-90,0,0]) cylinder(68, d=10);	
}

translate([-130,-62,0]) {
	cube([135,10,10]);
	translate([0,10,5]) rotate([0,90,0]) cylinder(135, d=10);
}

translate([-135,-62,0]) {
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
}
tout();