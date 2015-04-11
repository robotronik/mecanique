include <ouverture_porte_empileur.scad>

module partie_porte() {
	difference() {
		union() {
			attache();
			translate([(empileur_d+axe_d_ext)/2-1.5,0,0])
				rotate([0,0,-68])
					barre(20.5,largeur_bras,hauteur_attache);
            translate([empileur_d/2+4,-7,0])
                rotate([0,0,-15])translate([10,-10,0])
                    cylinder(d=axe_d_ext, h=hauteur_attache);
		}
        translate([empileur_d/2+4,-7,-5])
            rotate([0,0,-15])translate([10,-10,0]) {
                cylinder(d=axe_d_int, h=30);
                #cylinder(d=0.05, h=30);
            }
		vis_empileur();
		mirror([0,1,0])vis_empileur();
		empileur();
	}
}


translate([0,0,hauteur_attache]) partie_porte();
