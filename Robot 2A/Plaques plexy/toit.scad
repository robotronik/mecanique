$fn=100;
cote_octogone=140;
rayon_circons=cote_octogone/(sqrt(2-sqrt(2)));
rayon_inscrit=cote_octogone*1.2071;

cote_profile=21;

module trou_vis()    { circle(d=4 ); }

module arretUrgence(){ circle(d=45); }

module commutateur_couleur() {
	x_interr=30;
	y_interr=25;
	square([x_interr,y_interr], center=true);
	translate([-x_interr/2-12,0])circle(d=5.05);
	translate([ x_interr/2+12,0])circle(d=5.05);
}

module vis_pour_profiles() {
    translate([ cote_octogone/2-cote_profile/2,
                rayon_inscrit  -cote_profile/2]) trou_vis();
    translate([-cote_octogone/2+cote_profile/2,
                rayon_inscrit  -cote_profile/2]) trou_vis();
    translate([ cote_octogone/2-cote_profile/2,
               -rayon_inscrit  +cote_profile/2]) trou_vis();
    translate([-cote_octogone/2+cote_profile/2,
               -rayon_inscrit  +cote_profile/2]) trou_vis();
}

module alimentation() {
  translate([ 8, 0]) circle(d=4);
  translate([-8, 0]) circle(d=4);
  translate([ 0,32]) circle(d=4);
}

module tous_les_trous() {
	translate([0,70]) commutateur_couleur();
	vis_pour_profiles();
	translate([0,-130])alimentation();
}


module plateau() {
	rotate([0,0,22.5])circle(rayon_circons, $fn=8);
}
difference() {
	plateau();
	tous_les_trous();
}