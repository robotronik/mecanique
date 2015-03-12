$fn=100;
long_trou=3;
long_bosse=2;
long_totale=long_trou+long_bosse;

largeur_courroie=12;
hauteur_courroie=2.4;

epaisseur_plaque=0.5;


hauteur=8;

difference() {
cube([largeur_courroie+3,14,hauteur], center=true);
cube([largeur_courroie,	11,hauteur], center=true);
}