$fn=100;

include <../Constantes.scad>;

module plaque_bas() {
	difference() {
        rotate([0,0,360/16]) circle(r=rayon_circons,$fn=8);
		translate([-11, entraxe_roues/2,0])
            square([long_roues,larg_roues],center=true);
		translate([-11,-entraxe_roues/2,0])
            square([long_roues,larg_roues],center=true);
		//passage pieds
        square([300,80], center=true);
		translate([170,0,0])
            rotate([0,0,45]) square([300,300],center=true);
		translate([-210,0,0])
            rotate([0,0,45]) square([160,160],center=true);
	}
}

module plaque_milieu() {
	difference() {
        rotate([0,0,360/16]) circle(r=rayon_circons,$fn=8);
        translate([-rayon_inscrit,0,0])
            circle(d=cote_octogone);
    }
}
//*
plaque_bas();
translate([0,0,300])plaque_milieu();
//*/