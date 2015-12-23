$fn=100;

include <../Constantes.scad>;

module trou_vis()    { circle(d=4 ); }
module arretUrgence(){ circle(d=23); }

module commutateur_couleur() {
	x_interr=31;
	y_interr=22;
	square([x_interr,y_interr], center=true);
	translate([-x_interr/2-12,0])circle(d=5.05);
	translate([ x_interr/2+12,0])circle(d=5.05);
}

module vis_pour_profiles() {
    translate([+cote_octogone/2-cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            trou_vis();
    translate([-cote_octogone/2+cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            trou_vis();
    translate([+cote_octogone/2-cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            trou_vis();
    translate([-cote_octogone/2+cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            trou_vis();
}
module support_tourelle() {
	translate([+21,+21]) trou_vis(); 
	translate([+21,-21]) trou_vis(); 
	translate([-21,+21]) trou_vis(); 
	translate([-21,-21]) trou_vis(); 
}

module alimentation() {
    translate([ 12, 0]) circle(d=11);
    translate([-12, 0]) circle(d=11);
    translate([ 0,32]) circle(d=6);
}

module tous_les_trous() {
	vis_pour_profiles();
	support_tourelle();
	translate([0,-130]) alimentation();
	translate([0,  75]) commutateur_couleur();
	translate([0, 120]) arretUrgence();
}


module plateau() {
    difference() {
        rotate([0,0,22.5])
            circle(rayon_circons, $fn=8);
        translate([rayon_inscrit, 0])
            circle(d=cote_octogone);
        translate([-rayon_inscrit, 0])
        square([150, 100], center=true);
    }
}

module toit() {
    rotate([0,0,180])difference() {
        plateau();
        tous_les_trous();
    }
}


module tourelle(dia_barre,cote_trou,cote_tour,hauteur) {
		translate([cote_trou/2,cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([-cote_trou/2,cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([cote_trou/2,-cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([-cote_trou/2,-cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([0,0,hauteur-epaisseur_plaque])
			linear_extrude(epaisseur_alu)
				square(cote_tour,center=true);
}
module elements_du_toit() {
    rotate([0,0,180]) {
        color("grey")tourelle(4,42,60,75);
        translate([0,0,-10])
            color("purple")linear_extrude(height=20)translate([0,-130])
                alimentation();
        translate([0,0,-10])
            color("yellow")linear_extrude(height=20)translate([0,  75])
                commutateur_couleur();
        translate([0,0,-10])
            color("red")linear_extrude(height=40)translate([0, 120])
                arretUrgence();
    }
}
toit();
elements_du_toit();