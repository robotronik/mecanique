$fn=100;
codeur_diametre = 21.6;
codeur_epaisseur = 12.5;
diametre_axe = 6;
diametre_filetage = 9.5;
longueur_filetage = 8;
longueur_axe = 9;

module codeur_optique() {
    // Axe
	translate([0,0,0.5])cylinder(d=diametre_filetage,h=longueur_filetage);
	translate([0,0,-(longueur_filetage+0.5)])cylinder(d=diametre_axe,h=longueur_axe);
    // Codeur
	translate([0,0,longueur_filetage+0.5]) {
        cylinder(d=codeur_diametre, h=codeur_epaisseur);
        translate([codeur_diametre/2,0,codeur_epaisseur/2])
            cube(center=true, [3,12,6]);
    }
}

codeur_optique();