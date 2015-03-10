$fn=100;
long_trou=3;
long_bosse=2;
long_totale=long_trou+long_bosse;

largeur_courroie=10;
hauteur_courroie=2.4;

epaisseur_plaque=2;

module dent() {
	difference() {
		square([long_totale,hauteur_courroie]);
		translate([long_totale/2,hauteur_courroie]) circle(d=long_trou);
	}
}
module dent_inverse() {
	difference() {
		square([long_totale,hauteur_courroie+epaisseur_plaque]);
		dent();
	}
}

module courroie_inverse(dents) {
	for(i=[0:dents-1])
		translate([i*long_totale,0,0])dent_inverse();
}


translate([0,0,hauteur_courroie+epaisseur_plaque]) rotate([-90,0,0])
	linear_extrude(height=largeur_courroie) courroie_inverse(4);

epaisseur_supports=2;
hauteur_supports=15;
translate([0,-epaisseur_supports])
	cube([4*long_totale,epaisseur_supports,hauteur_supports]);
translate([0,largeur_courroie])
	cube([4*long_totale,epaisseur_supports,hauteur_supports]);
