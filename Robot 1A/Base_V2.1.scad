$fn=50;
use <support_codeur_Robot1A.scad>;	
use <support_toit.scad>;
use <Supports_moteurs_brushless.scad>;
use <SupportUS_1A.scad>;
use <support_roues_codeuses_Robot1A.scad>;
use <Equerre_fixation_etage.scad>;
Tx = 35;
Ty = 20;
Tz = 0;
module base()
{
    difference(){
                    color ("blue") cube([200,140,5]);
                    translate ([-1,-1,-1]) cube([milieu_l-(longueur_moteur-1),81,7]);
                    translate ([milieu_l+longueur_moteur,-1,-1]) cube([61,81,7]);
               }     
     
}

module moteur_Brushless() {
	difference(){
		
		translate([0,0,0]) rotate([0,90,0]) cylinder(d=45,h=40);
		translate([-1,-10,-16.3]) rotate([0,90,0]) cylinder(d=3,h=7);
		translate([-1,10,3.7]) rotate([0,90,0]) cylinder(d=3,h=7);
		translate([-1,-10,3.7]) rotate([0,90,0]) cylinder(d=3,h=7);
		translate([-1,10,-16.3]) rotate([0,90,0]) cylinder(d=3,h=7);
	}
	translate([-1.7,0,-6.3]) rotate([0,90,0]) cylinder(d=19,h=1.7); 
	translate([-25.5,0,-6.3]) rotate([0,90,0]) cylinder(d=8,h=25.5);
	translate([28,-5,-25.5])cube([1,10,5]);
	
}

largeur_base = 200;
longueur_base = 140;
longueur_moteur = 40;
milieu_l = largeur_base/2;
ecart_moteur = 2;
module moteurs_Brushless(){
	translate([milieu_l-(longueur_moteur+ecart_moteur/2),43,31.3])moteur_Brushless();
	translate([milieu_l+ecart_moteur/2+longueur_moteur,43,31.3])mirror ([1,0,0])moteur_Brushless();
}

largeur_roue = 15;
module roue() {
   difference() {
	 rotate([0,90,0]) cylinder(d=72,h=largeur_roue);
	 translate ([-1,0,0]) rotate ([0,90,0])  cylinder(d=9, h=largeur_roue+3);
	}
}

ecart_RoueMot = 2+1.7;
module roues()
{
    translate([ milieu_l-(ecart_moteur/2+longueur_moteur+ecart_RoueMot+largeur_roue),23+Ty,25]) roue();
    translate([milieu_l+(ecart_moteur/2+longueur_moteur+ecart_RoueMot),23+Ty,25]) roue();
}

module roues_codeuses(){
	translate([13,43,22])rotate ([0,-90,180])codeur_optique();
	mirror([1,0,0]) translate([-195,43,10])rotate ([0,-90,180])codeur_optique();
}

module coque_exterieure() {
	difference() {
		translate([0,3,5]) cube([3,134,200]);
		translate([-1,21,0]) cube([5,44,35]);
	}
	translate([0,137,5]) cube([200,3,200]);	
	difference() {
		translate([197,3,5]) cube([3,134,200]);
		translate([196,21,0]) cube([5,44,35]);
	}
	translate([0,0,5]) cube([200,3,200]);
}

largeur_Barre = 10;
longueur_Barre = 250;
module fixation_coque_Barre() {
	cube([largeur_Barre,largeur_Barre,longueur_Barre]); 
}

longueur_equerre = 20;
largeur_equerre = 10;
epaisseur_equerre = 5;
module fixation_coque_Equerre() {
	cube([longueur_equerre,largeur_equerre,epaisseur_equerre]); 
	translate([epaisseur_equerre,0,0])rotate([0,-90,0])cube([longueur_equerre,largeur_equerre,epaisseur_equerre]); 
}

epaisseur_plaquePlexi_base = 5;
epaisseur_plaquePlexi_coque = 3;
module fixations_coque() {
	translate([3,127,5]) fixation_coque_Barre();
	translate([187,127,5]) fixation_coque_Barre(); 
	translate([60,3,5]) fixation_coque_Barre();
	translate([130,3,5]) fixation_coque_Barre();
	translate([3,80,5])fixation_coque_Barre();
	translate([187,80,5]) fixation_coque_Barre();
}

module fixation_etage(L,e) {
	 // e = epaisseur
	cube([25,L,e]); 
	difference() {
		rotate([0,90,0])cube([20,L,e]);
		translate([-1,5,-10])rotate([0,90,0])cylinder(d=4,h=7);
		translate([-1,L-5,-10])rotate([0,90,0])cylinder(d=4,h=7);
	}
	translate([0,L/2+2.5,0]) rotate([90,0,0])linear_extrude(height = 5)polygon(
		points=[ [0,0],[20,0],[0,-20] ],
		paths=[ [0,1,2] ]
	);	
}

module fixations_etage1(L,H_etage,e) {
	translate([13,80,H_etage])fixation_etage(L,e);
	translate([L+83,13,H_etage])rotate([0,0,90])fixation_etage(80,e);
	translate([130+L,80+L,H_etage])rotate([0,0,-180])fixation_etage(L,e);
}

module fixations_etage2(L,H_etage,e) {	
	translate([13,80,H_etage])fixation_etage2(L,e);
	translate([L+83,13,H_etage])rotate([0,0,90])fixation_etage2(80,e);
	translate([130+L,80+L,H_etage])rotate([0,0,-180])fixation_etage2(L,e);

}

//bille 3mm plus haute sous openscad
module bille_jockey() {
	difference() {
	cylinder(d=30.2, h=1.5);
	translate([0,12.6,-1])cylinder(d=3,h=3);
	rotate([0,0,-120])translate([0,12.6,-1])cylinder(d=3,h=3);
	rotate([0,0,120])translate([0,12.6,-1])cylinder(d=3,h=3);
	}
	translate([0,0,1.5])cylinder(h=8, r1=10, r2=7);
	difference() {
	translate([0,0,-1.5])sphere(r=10.5);
	translate([0,0,0]) cylinder(d=21,h=5);
	}
}

module billes_jockey() {
	translate([38.1,111.9,-1.5])bille_jockey(); 
	translate([161.9,111.9,-1.5])bille_jockey(); 
}

module etages(h1,h2) {
	translate([14,14,h1]) cube([173,122,3]) ;
	translate([14,14,h2]) cube([173,122,3]) ;
}

module batterie() {
	translate([14,14,68]) cube([170,110,70]) ;
}

module fixation_roues_codeuses() {
	rotate([0,0,90]){linear_extrude(height=20)polygon(
			points=[ [0,0],[26,0],[26,-9], [18,-9], [18,-6], [23,-6], [23,-3], [3,-3],[3,-6],[8,-6],[8,-9],[0,-9] ],
			paths=[ [0,1,2,3,4,5,6,7,8,9,10,11] ]
		);	
	translate([0,-2,10])cube([65,5,20]);
	translate([0,-2,0])cube([26,5,10]);
	translate([0,-9,20])cube([26,7,10]);
	}
}
module fixations_roues_codeuses () {
	mirror([1,0,0])translate([-21,30,30]) fixation_roues_codeuses();
	translate([179,30,30]) fixation_roues_codeuses();
}

module Robot_1A_2016(){

	base();
	// -->
	color ("red") moteurs_Brushless();
	%coque_exterieure();
	color ("orange") fixations_coque();
	translate([milieu_l,111.9,-1.5])bille_jockey(); 
	color("purple") etages(74.1,145);
	//color("black") batterie();
	color("blue") fixations_etage1(57,71.1,3);
	color("blue") fixations_etage2(57,142,3);
	translate([27,43,-3.2])rotate([0,0,0])support_codeur();
	translate([2,79,71])rotate([0,0,-90])fixation_roue_codeuse_gauche_Robot1A();
	mirror([1,0,0])translate([-173,43,-3.2])rotate([0,0,0])support_codeur();
	translate([198,79,71])fixation_roue_codeuse_droite_Robot1A();
	translate([58,43,31])fixation_moteurs();
	translate([2.9,137,250])rotate([180,0,0])fixation_toit_1();
	translate([2.9,137,250])rotate([180,0,0])fixation_toit_2();
	translate([65,118,71.1])rotate([90,0,-90])supportUS_ar();
	translate([159,118,71.1])rotate([90,0,-90])supportUS_ar();
	translate([57,30,79])rotate([90,180,-90])supportUS_av();
	translate([167,30,79])rotate([90,180,-90])supportUS_av();
	// -->
	roues();
}

translate([0,0,0])rotate([0,0,0])Robot_1A_2016();