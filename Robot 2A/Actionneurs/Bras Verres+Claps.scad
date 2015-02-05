$fn=50;

translate([-9,6,10])rotate([90,0,0])difference() {
	translate([0,-6,0])cube([18,34,6]);
	
	union() {
		translate([7,5.5,0]) cylinder(20, d=2.5);
		translate([7,15,0]) cylinder(20, d=8);
		translate([7,24.5,0]) cylinder(20, d=2.5);
	}
}
translate([4,0,5])polyhedron(
  points=[ [0,0,0], [0,0,30], [0,-15,0],
          [5,0,0],[5,0,30],[5,-15,0]],
  faces=[ [0,1,2],[3,4,5],[0,1,3],[1,3,4],
              [1,2,4],[2,5,4],[0,2,3],[5,2,3] ] );

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