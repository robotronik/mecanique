$fn=50;

translate([0,0,5]) cube([10,6,35]);
translate([-135,0,0]) {
	cube([140,10,10]);
	translate([0,10,5]) rotate([0,90,0]) cylinder(140, d=10);

	translate([140,10,5]) rotate([90,0,0]) cylinder(10, d=10);	
	translate([140,10,5]) sphere(5);
}

translate([-140,0,0]) {
	translate([0,5,0]) cube([10, 95, 5]);
 	translate([5,5,5]) rotate([-90,0,0]) cylinder(95, d=10);

 	translate([5,100,0]) rotate([0,0,0]) cylinder(5, d=10);
	translate([5,100,5]) sphere(d=10);

 	translate([5,5,0]) rotate([0,0,0]) cylinder(5, d=10);
	intersection() {
 		translate([5,5,0]) rotate([0,0,0]) cylinder(10, d=10);
 		translate([5,0,5]) rotate([-90,0,0]) cylinder(10, d=10);
	}
}