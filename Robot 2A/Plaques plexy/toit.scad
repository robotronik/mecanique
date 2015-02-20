cote=140;
rayon=cote/(sqrt(2-sqrt(2)));
rayon_inscrit=cote*1.2071;

module trou_vis() { circle(d=4); }

module arret_urgence() { circle(45); }

module commutateur_couleur() {
	x_interr=30;
	y_interr=25;
	square([x_interr,y_interr], center=true);
	translate([-x_interr/2-12,0])circle(d=5.05);
	translate([ x_interr/2+12,0])circle(d=5.05);
}

module alimentation() {
  translate([8, 0]) circle (d=4);
  translate([-8, 0]) circle(d=4);
  translate([0, 32]) circle(d=4);
}

module tous_les_trous() {
	translate([0,70]) commutateur_couleur();
	translate([70-10.5,rayon_inscrit-10.5]) trou_vis();
}


module plateau() {
	rotate([0,0,22.5])circle(rayon, $fn=8);
}

difference() {
	plateau();
	tous_les_trous();
}