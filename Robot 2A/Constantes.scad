// Contient les constantes utilisées un peu partout pour le gros robot.
// Utiliser 
// include <../Constantes.scad>;

// Structure principale
cote_octogone=140;
rayon_circons=cote_octogone/(sqrt(2-sqrt(2)));
rayon_inscrit=cote_octogone*1.2071;

perimetre = 8*cote_octogone;
// perimetre=1200;

hauteur_robot=320;

// Plaques
epaisseur_alu=3;
epaisseur_plexy=5;

hauteur_bas=3;
hauteur_interm=163;
hauteur_toit=hauteur_robot-epaisseur_plexy;

hauteur_plexy=310;
larg_pliure=cote_octogone/sqrt(2);


cote_profile=11;

//base bas
rayon_evidee=70;
entraxe_roues=180+45;
entraxe_roues_cod=230;
larg_roues=45;
long_roues=64;
larg_roues_cod=7;
long_roues_cod=40;
//base haut
cote_trou=40;
dia_trou=2;
//tourelle
dia_barre=2;
cote_tour=60;
hauteur_max=420;
epaisseur_plaque=3;