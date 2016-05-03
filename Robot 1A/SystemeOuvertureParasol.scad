$fn=190;

module rouleaux_1(L,D) {
	difference() {
		rotate([0,90,0])cylinder(d=D, h=L);
		translate([-1,0,0])rotate([0,90,0])cylinder(d=D-3, h=L+2);
	}
	difference() {
		union () {	
			translate([0,0,-1.5])cube([L,D/2-1,3]);
			translate([0,1.5,0])rotate([90,0,0])cube([L,D/2-1,3]);
			translate([0,0,1.5])rotate([180,0,0])cube([L,D/2-1,3]);
			translate([0,-1.5,0])rotate([-90,0,0])cube([L,D/2-1,3]);
			translate([L,0,0])rotate([-90,0,90])cylinder(d=8, h=L+6);
		}
		translate([L+17,0,0])rotate([-90,0,90])cylinder(d=6.2, h=81);
	}
	//translate([L+17,0,0])rotate([-90,0,90])#cylinder(d=2.8, h=81);

}

/*module rouleaux_2(L,D) {
		rotate([0,90,0])cylinder(d=D, h=L);
}*/

module fixation_rouleau_1() {
	difference() {

		cube([25,20,3]);
		translate([5,10,-1])rotate([0,0,90]) rail(15);
		//translate([5,22.5,-1])rotate([0,0,90]) rail(15);
	}
	difference() {
		translate([0,0,0])cube([25,3,33]);
		translate([12.5,-1,23])rotate([-90,0,0])cylinder(d=16.35, h=5); // roulement a bille 16.5 avant
	}	
}

/*module fixation_rouleau_2(L_axes, Pos_Y_axes) {
	difference() {
		cube([25,30,3]);
		translate([5,22.5,-1]) rail(15);
		translate([15,22.5,-1]) rail(15);
	}
	difference() {
		translate([0,0,0])cube([25,3,30]);
		translate([12.5,-1,25])rotate([-90,0,0])cylinder(d=10, h=5);
	}
	translate([12.5,Pos_Y_axes,25])rotate([-90,0,0])cylinder(d=5, h=L_axes);	
}*/

module rail(L) {
	rotate([0,-90,-180]) {
	#translate([0,0,0.4])cube([7,L,4.2]);
	translate([0,0,2.5])rotate([0,90,0])cylinder(d=4.2, h=7);
	translate([0,L,2.5])rotate([0,90,0])cylinder(d=4.2, h=7);
	}
}

module rouleau_1(L,D) {
	translate([12.5,10,25])rotate([0,0,90])rouleaux_1(L,D);
	fixation_rouleau_1();
	translate([0,41,0])mirror([0,1,0])fixation_rouleau_1();
}

/*module rouleau_2(L,D) {
	translate([12.5,7,25])rotate([0,0,90])rouleaux_2(L,D);
	fixation_rouleau_2(15,-5);
	translate([0,61,0])mirror([0,1,0])fixation_rouleau_2(15,-5);
}*/

module fixation_roulement_rouleau(){

	cylinder(h=20,r1=5/2,r2=4.3/2);
	//translate([0,0,20])cylinder(h=20,r1=6/2,r2=4.5/2);
}

color("grey")translate([12.5,0,25])rotate([90,0,180])fixation_roulement_rouleau();
//rouleau_1(20,35);
//fixation_rouleau_1();
//rouleaux_1(20,35);
//translate([37,0,0])rouleau_1(47,35);

