$fn=100;
i=44;
module empileur() {
	cube([38,10,10]);
	cube([7,22,10]);
	translate([31,0,0]) cube([7,22,10]);
	translate([11,-12,-50]) #cube([18,12,100]);
	translate([7,10,-25]) #cube([24,12,50]);
}
module plaque() {
	intersection() {
		translate([i,0])circle(i);
		translate([0,-i])square([i,i]);
	}
	translate([i,-i])difference() {
		square([18,i]);
		translate([0,i])rotate([0,0,-45])
			square([27,15]);
	}
square([44,22]);
}



difference() {
translate([-3,0,-5])linear_extrude(height = 20)plaque();
#empileur();
}
