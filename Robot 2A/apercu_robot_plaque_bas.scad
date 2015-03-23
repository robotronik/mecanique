$fn=100;
cote_octogone=140;
rayon_circons=cote_octogone/(sqrt(2-sqrt(2)));
rayon_inscrit=cote_octogone*1.2071;

perimetre=1200;
long_cote=140;
epaisseur=3;
hauteur_robot=320;
//base bas
rayon_evidee=70;
entraxe_roues=180+45;
entraxe_roues_cod=230;
larg_roues=45;
long_roues=64;
larg_roues_cod=7;
long_roues_cod=40;
//base interm
hauteur_interm=160;
//base haut
cote_trou=40;
dia_trou=2;
//tourelle
dia_barre=2;
cote_tour=60;
hauteur_max=420;
epaisseur_plaque=3;


module base_bas() {
	difference() {
        rayon=long_cote/2/sin(360/16);
        rotate([0,0,360/16]) circle(r=rayon,$fn=8);
		translate([11,entraxe_roues/2,0]) square([long_roues,larg_roues],center=true);
		translate([11,-entraxe_roues/2,0]) square([long_roues,larg_roues],center=true);
		//passage pieds
        square([300,80], center=true);
		translate([-170,0,0]) rotate([0,0,45]) square([300,300],center=true);
		translate([210,0,0]) rotate([0,0,45]) square([160,160],center=true);
	}
}
base_bas();
