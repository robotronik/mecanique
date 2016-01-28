$fn=75;

module rouleaux_1(L,D) {
	difference() {
		rotate([0,90,0])cylinder(d=D, h=L);
		translate([-1,0,0])rotate([0,90,0])cylinder(d=5.5, h=L+2);
	}
}

module rouleaux_2(L,D) {
		rotate([0,90,0])cylinder(d=D, h=L);
}

module fixation_rouleau_1() {
	difference() {

		cube([30,30,5]);
		translate([5,22.5,-1]) rail(15);
		translate([20,22.5,-1]) rail(15);
	}
	
	translate([0,0,0])cube([30,3,30]);
	translate([15,0,25])rotate([-90,0,0])cylinder(d=5, h=15);	
}

module fixation_rouleau_2(L_axes, Pos_Y_axes) {
	difference() {

		cube([30,30,5]);
		translate([5,22.5,-1]) rail(15);
		translate([20,22.5,-1]) rail(15);
	}
	difference() {
		translate([0,0,0])cube([30,3,30]);
		translate([15,-1,25])rotate([-90,0,0])cylinder(d=10, h=5);
	}
	translate([15,Pos_Y_axes,25])rotate([-90,0,0])cylinder(d=5, h=L_axes);	
}

module rail(L) {
	rotate([0,-90,-180]) {
	cube([7,L,5]);
	translate([0,0,2.5])rotate([0,90,0])cylinder(d=5, h=7);
	translate([0,L,2.5])rotate([0,90,0])cylinder(d=5, h=7);
	}
}

module rouleau_1(L,D) {
	translate([15,7,25])rotate([0,0,90])rouleaux_1(L,D);
	fixation_rouleau_1();
	translate([0,61,0])mirror([0,1,0])fixation_rouleau_1();
}

module rouleau_2(L,D) {
	translate([15,7,25])rotate([0,0,90])rouleaux_2(L,D);
	fixation_rouleau_2(15,-5);
	translate([0,61,0])mirror([0,1,0])fixation_rouleau_2(15,-5);
}

rouleau_1(47,35);
translate([37,0,0])rouleau_2(47,35);