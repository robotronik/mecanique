$fn=100;
module moteur_Brushless() {
	difference(){
		union(){
		translate([0,0,0]) rotate([0,90,0]) cylinder(d=47,h=40);
		translate([-4,-10,-16.3]) rotate([0,90,0]) cylinder(d=4.5,h=10);
		translate([-4,10,3.7]) rotate([0,90,0]) #cylinder(d=4.5,h=10);
		translate([-4,-10,3.7]) rotate([0,90,0]) cylinder(d=4.5,h=10);
		translate([-4,10,-16.3]) rotate([0,90,0]) cylinder(d=4.5,h=10);
		}
	}
	translate([-1.7,0,-6.3]) rotate([0,90,0]) cylinder(d=21,h=1.7); 
	translate([-25.5,0,-6.3]) rotate([0,90,0]) cylinder(d=8,h=25.5);
	translate([28,-5,-25.5])cube([1,10,5]);
	
}

module empreinte_vis(d_tete,h_tete,m,l_filetage){
	cylinder(d=d_tete,h=h_tete);
	translate([0,0,-l_filetage])cylinder(d=m,h=l_filetage);

}	

module equerre_fix_moteur(){
	L=14;
	E1=3;
	E2=2;
	l1=15;
	l2=10;
	cube([L,E1,l1]);
	difference(){
		translate([0,E1,0])cube([L,l2,E1]);
		translate([L/2,l2/2+E1,E1])empreinte_vis(7,5,3.5,5);
	}
	translate([0,E1,E1])rotate([180,-90,0])linear_extrude(height = E2)polygon(
			points=[ [0,0],[l2,0],[0,-l2] ],
			paths=[ [0,1,2] ]);
	translate([L-E2,E1,E1])rotate([180,-90,0])linear_extrude(height = E2)polygon(
			points=[ [0,0],[l2,0],[0,-l2] ],
			paths=[ [0,1,2] ]);
}

module fixation_moteurs(){
largeur_base = 84;
longueur_base = 90;
longueur_moteur = 40;
milieu_l = largeur_base/2;
ecart_moteur = 2;
diametre_tete=8;
epaisseur_tete=10;
diametre_vis=3.7;
longueur_filetage=5;
module moteurs_Brushless(){
	translate([milieu_l-(longueur_moteur+ecart_moteur/2),0,0])moteur_Brushless();
	translate([milieu_l+ecart_moteur/2+longueur_moteur,0,0])mirror([1,0,0])moteur_Brushless();
}
	difference(){

		translate([86,-25.5,10])rotate([0,180,0])cube([88,51,36]);
		translate([-4,-5,-11])cube([5,10,22]);
		translate([82,-5,-11])cube([5,10,22]);
		translate([0,0,0])moteurs_Brushless();
		translate([83,-25.5,11])rotate([0,180,0])cube([82,51,16]);
		translate([41,0,0])rotate([0,90,0])cylinder(d=47,h=2);
		translate([27,-8,-26.5])rotate([0,0,0])cube([30,34,10]);
		translate([8,14,-23])empreinte_vis(diametre_tete,epaisseur_tete,diametre_vis,longueur_filetage);
		mirror([0,1,0])translate([8,14,-23])empreinte_vis(diametre_tete,epaisseur_tete,diametre_vis,longueur_filetage);
		translate([76,14,-23])empreinte_vis(diametre_tete,epaisseur_tete,diametre_vis,longueur_filetage);
		mirror([0,1,0])translate([76,14,-23])empreinte_vis(diametre_tete,epaisseur_tete,diametre_vis,longueur_filetage);
	}
}

module fixation_moteurs_V2(){

//parametres support moteur
longueur=88;
largeur=51;
hauteur=36;
diam_axe_moteur=8;
diam_reducteur=45;
epaisseur=3;
marge=2;
//modules utiles pour le design
largeur_base = 84;
longueur_base = 90;
longueur_moteur = 40;
milieu_l = largeur_base/2;

module moteurs_Brushless(){
	translate([milieu_l-(longueur_moteur+ecart_moteur/2),0,0])moteur_Brushless();
	translate([milieu_l+ecart_moteur/2+longueur_moteur,0,0])mirror([1,0,0])moteur_Brushless();
}

ecart_moteur = 2;
diametre_tete=7;
epaisseur_tete=10;
diametre_vis=3.5;
longueur_filetage=5;
module empreinte_vis(d_tete,h_tete,m,l_filetage){
	cylinder(d=d_tete,h=h_tete);
	translate([0,0,-l_filetage])cylinder(d=m,h=l_filetage);

}	
	difference(){

		cube([longueur,largeur,hauteur]);
		translate([0,largeur/2-(diam_axe_moteur+marge)/2,hauteur-22])cube([epaisseur,diam_axe_moteur+marge,22]);
		translate([longueur-epaisseur,largeur/2-(diam_axe_moteur+marge)/2,hauteur-22])cube([epaisseur,diam_axe_moteur+2,22]);
		translate([2,largeur/2,26])moteurs_Brushless();
		translate([epaisseur,0,hauteur/2])cube([longueur-6,largeur,hauteur/2]);
		translate([(longueur-2)/2,largeur/2,26])rotate([0,90,0])cylinder(d=diam_reducteur+marge,h=ecart_moteur);
		translate([longueur/2-15,largeur/2-(5+marge),0])cube([30,34,10]);
		
	}
	translate([5,largeur-2,0])equerre_fix_moteur();
	translate([longueur-19,largeur-2,0])equerre_fix_moteur();
	translate([15,2,0])mirror([0,1,0])equerre_fix_moteur();
	translate([longueur-29,2,0])mirror([0,1,0])equerre_fix_moteur();
}


translate([0,0,0])fixation_moteurs();
//translate([0,0,0])moteur_Brushless();
//translate([0,0,0])fixation_moteurs_V2();
