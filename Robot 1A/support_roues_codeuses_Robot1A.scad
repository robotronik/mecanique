$fn=100;
use <support_codeur_Robot1A.scad>;	
module fixation_roue_codeuse_1A(){

	color("green")translate([0,2,-2])cube([76,56,5]);
	translate([0,2,0])fixation_plaque(10,5);
	translate([66,58,0])rotate([0,0,-90])fixation_plaque(10,5);

	translate([0,12,-15])cube([5,8.5,13]);
	translate([0,17.5,0])rotate([0,90,90])cube([15,10,3]);

	translate([57.5,53,-15])cube([8.5,5,13]);
	translate([57.5,58,0])rotate([0,90,0])cube([15,10,3]);
}

module fixation_plaque(L,e) {
	 // e = epaisseur
	cube([25,L,e-2]); 
	difference() {
		rotate([0,90,0])cube([15,L,e]);
		translate([-1,5,-10])rotate([0,90,0])cylinder(d=4,h=7);
		translate([-1,L-5,-10])rotate([0,90,0])cylinder(d=4,h=7);
	}
	translate([0,L,0]) rotate([90,0,0])linear_extrude(height = L)polygon(
		points=[ [0,0],[10,0],[0,-8] ],
		paths=[ [0,1,2] ]
	);	
}


module fixation_roue_codeuse_gauche_Robot1A(){
	fixation_roue_codeuse_1A();
	translate([35.5,25,3])rotate([180,0,90])supports_rails_haut();
	
	//translate([37.5,25,-74])rotate([0,0,90])support_codeur();
}

module fixation_roue_codeuse_droite_Robot1A(){
	mirror([1,1,0])fixation_roue_codeuse_1A();
	mirror([1,1,0])translate([35.5,25,3])rotate([180,0,90])supports_rails_haut();
			
	//translate([37.5,25,-74])rotate([0,0,90])support_codeur();
}

fixation_roue_codeuse_gauche_Robot1A();
fixation_roue_codeuse_droite_Robot1A();