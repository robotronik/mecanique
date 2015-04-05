include <ouverture_porte_empileur.scad>

module partie_simple() {
	difference() {
		union() {
			attache();
			translate([(empileur_d+axe_d_ext)/2-1,3.5,0])
				rotate([0,0,66])
					barre(17.3,largeur_bras,hauteur_attache);
            translate([empileur_d/2+4,7,0])
                rotate([0,0,15])translate([10,10,0])
					rotate([0,0,14 0])
                        barre(17.3,largeur_bras,hauteur_attache);
            translate([empileur_d/2+4,7,0])
                rotate([0,0,15])translate([10,10,0])
                    cylinder(d=axe_d_ext, h=hauteur_attache);
		}
        translate([empileur_d/2+4,7,-5])
            rotate([0,0,15])translate([10,10,0])
                #cylinder(d=axe_d_int, h=30);
		vis_empileur();
		empileur();
	}
}


mirror([0,1,0]) partie_simple();
