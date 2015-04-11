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
    translate([ cote_octogone/2-cote_profile/2, rayon_inscrit-cote_profile/2]) trou_vis();
    translate([-cote_octogone/2+cote_profile/2, rayon_inscrit-cote_profile/2]) trou_vis();
    translate([ cote_octogone/2-cote_profile/2,-rayon_inscrit+cote_profile/2]) trou_vis();
    translate([-cote_octogone/2+cote_profile/2,-rayon_inscrit+cote_profile/2]) trou_vis();
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
     rotate([0,0,22.5])circle(rayon_circons, $fn=8);
     union () {  translate([rayon_inscrit, 0]) circle(d=cote_octogone);
                  translate([-rayon_inscrit, 0]) square([150, 100], center=true);
	}
  }
}

module toit() {
    difference() {
        plateau();
        tous_les_trous();
    }
}
toit();