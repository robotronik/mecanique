$fn=100;

module rail(L) {
	rotate([0,-90,-180]) {
	translate([0,0,0.4])cube([4,L,4.2]);
	translate([0,0,2.5])rotate([0,90,0])cylinder(d=4.2, h=4);
	translate([0,L,2.5])rotate([0,90,0])cylinder(d=4.2, h=4);
	}
}

largeur_Barre = 10;
longueur_Barre = 200;
module fixation_coque_Barre() {
	cube([largeur_Barre,largeur_Barre,longueur_Barre]); 
}

module fixations_coque() {
	translate([3,127,5]) fixation_coque_Barre();
	translate([187,127,5]) fixation_coque_Barre(); 
	translate([60,3,5]) fixation_coque_Barre();
	translate([130,3,5]) fixation_coque_Barre();
	translate([3,80,5])fixation_coque_Barre();
	translate([187,80,5]) fixation_coque_Barre();
}

module fixation_toit_1(){
	difference(){
		union(){
			cube([13,13.5,40]);
			//translate([181,0,0])cube([13,13.5,40]);
			translate([0,44,0])cube([13,17,40]);
			//translate([181,44,0])cube([13,17,40]);
			translate([13,0,0])cube([171/2,123.9,5]);
		}
		cube([10.5,10.5,40]);
		translate([184,0,0])cube([10.5,10.5,40]);
		translate([0,47,0])cube([10,11,40]);
		translate([184,47,0])cube([10,11,40]);


		translate([23,0,0])cube([151,114,5]);
		translate([2.5,9.6,4.5])rotate([-90,0,0])rail(30);
		translate([2.5,43.6,4.5])rotate([-90,0,0])rail(30);
		translate([2.5,57.5,4.5])rotate([-90,0,0])#rail(30);

		translate([186,9.6,4.5])rotate([-90,0,0])#rail(30);
		translate([186.5,43.6,4.5])rotate([-90,0,0])#rail(30);
		translate([186.5,57.5,4.5])rotate([-90,0,0])#rail(30);
	}
}

module fixation_toit_2(){
	mirror([0,1,0])translate([194,0,0])rotate([0,0,180])fixation_toit_1();
}

//fixation_toit_1();
fixation_toit_2();
