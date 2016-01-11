$fn=50;

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


/*module moteur_DC() {
    translate ([  0,111.5, 0]) rotate([90,0,0]) cube([40,55,111.5]);
    translate ([-20, 20.5,20]) rotate([0,90,0]) cylinder(d=7, h=80);
}*/

module moteur_Brushless() {
	translate([0,0,0]) rotate([0,90,0]) cylinder(d=45,h=40);
	translate([-1.7,0,-6.3]) rotate([0,90,0]) cylinder(d=19,h=1.7); 
	translate([-25.5,0,-6.3]) rotate([0,90,0]) cylinder(d=8,h=25.5);
}

/*module moteurs_DC() {
    translate([  3+Tx,2.5+Ty,5])
        moteur_DC();
    translate([157-Tx,2.5+Ty,5])
        moteur_DC();
}*/

largeur_base = 200;
longueur_base = 140;
longueur_moteur = 40;
milieu_l = largeur_base/2;
ecart_moteur = 0;
module moteurs_Brushless(){
	translate([milieu_l-(longueur_moteur+ecart_moteur/2),43,31.3])moteur_Brushless();
	translate([milieu_l+ecart_moteur/2+longueur_moteur,43,31.3])mirror ([1,0,0])moteur_Brushless();
}

largeur_roue = 22;
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

codeuse_diametre    = 41.2;
codeuse_epaisseur   = 10;
codeur_diametre     = 21.6;
codeur_epaisseur    = 12.5;
module roue_codeuse() {
    hull() {
        cylinder(center=true,
                d=codeuse_diametre*0.8,
                h=codeuse_epaisseur);
        cylinder(center=true,
                d=codeuse_diametre,
                h=codeuse_epaisseur*0.5);
    }
    // Axe
    translate([0,0,codeuse_epaisseur/2])cylinder(d=3,h=8.5);
    // Codeur
    translate([0,0,codeuse_epaisseur/2 + 8.5]) {
        cylinder(d=codeur_diametre, h=codeur_epaisseur);
        translate([codeur_diametre/2,0,codeur_epaisseur/2])
            cube(center=true, [3,12,6]);
    }
}

module roues_codeuses(){
	translate([5,43,10])rotate ([0,-90,180])roue_codeuse();
	mirror([1,0,0]) translate([-195,43,10])rotate ([0,-90,180])roue_codeuse();
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
longueur_Barre = 200;
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
	
	translate([13,80,5]) fixation_coque_Equerre();
	translate([13,90,5]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([13,127,5]) mirror([0,1,0]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([13,127,5]) fixation_coque_Equerre();
	translate([187,127,5])mirror([1,0,0]) fixation_coque_Equerre();
	translate([197,127,5]) mirror([0,1,0]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([197,90,5]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([187,80,5])mirror([1,0,0]) fixation_coque_Equerre();
	translate([70,3,5]) fixation_coque_Equerre();
	translate([70,13,5]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([130,3,5])mirror([1,0,0]) fixation_coque_Equerre();
	translate([140,13,5]) rotate([0,0,90]) fixation_coque_Equerre();
}

module fixation_etage(L) {
	cube([25,L,5]); 
	difference() {
		rotate([0,90,0])cube([20,L,5]);
		translate([-1,5,-10])rotate([0,90,0])cylinder(d=4,h=7);
		translate([-1,L-5,-10])rotate([0,90,0])cylinder(d=4,h=7);
	}
	translate([0,L/2+2.5,0]) rotate([90,0,0])linear_extrude(height = 5)polygon(
		points=[ [0,0],[20,0],[0,-20] ],
		paths=[ [0,1,2] ]
	);	
}

module fixations_etage1(L,H_etage) {
	translate([13,80,H_etage])fixation_etage(L);
	translate([L+83,13,H_etage])rotate([0,0,90])fixation_etage(80);
	translate([130+L,80+L,H_etage])rotate([0,0,-180])fixation_etage(L);
}

module fixations_etage2(H_etage) {	
	//translate([13,80,5+H_etage]) fixation_coque_Equerre();
	translate([13,127,5+H_etage]) fixation_coque_Equerre();
	translate([187,127,5+H_etage])mirror([1,0,0]) fixation_coque_Equerre();
	//translate([187,80,5+H_etage])mirror([1,0,0]) fixation_coque_Equerre();
	translate([70,13,5+H_etage]) rotate([0,0,90]) fixation_coque_Equerre();
	translate([140,13,5+H_etage]) rotate([0,0,90]) fixation_coque_Equerre();
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

module etages() {
	translate([14,14,65]) cube([173,122,3]) ;
	translate([14,14,145]) cube([173,122,3]) ;
}

module batterie() {
	translate([14,14,68]) cube([170,110,70]) ;
}


base();
//#moteurs_DC();
// -->
color ("red") moteurs_Brushless();
color ("green") roues_codeuses();
//color("grey")coque_exterieure();
color ("orange") fixations_coque();
//translate([milieu_l,111.9,-1.5])bille_jockey(); 
billes_jockey();
color("purple") etages();
color("black") batterie();
color("blue") fixations_etage1(57,60);
color("blue") fixations_etage2(143);
// -->
roues();
