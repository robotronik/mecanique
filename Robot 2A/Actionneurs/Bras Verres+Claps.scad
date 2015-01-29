$fn=50;

translate([-8,0,5]) cube([18,6,40]);
translate([-135,0,0]) {
	cube([140,10,10]);
	translate([0,10,5]) rotate([0,90,0]) cylinder(140, d=10);

	translate([140,10,5]) rotate([90,0,0]) cylinder(10, d=10);	
	translate([140,10,5]) sphere(5);
}

translate([-140,0,0]) {
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