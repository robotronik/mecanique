include <ouverture_porte_empileur.scad>

module partie_servo() {
	difference() {
		union() {
            charniere_simple();
            translate([empileur_d/2+4,7,-45+hauteur_attache]) 
                rotate([0,0,15])difference() {
                    union() {
                        translate([-4-16,-6.5,-3])cube([28+12,35,33]);
                        translate([-4-16,-6.5,-3])cube([20,44,38]);
                        
                    }
                    servo();
                }
		}
    translate([-long_securite,-long_securite,-empileur_h/2])
        cube([long_securite*2,long_securite,empileur_h]);
		vis_empileur();
		empileur();
	}
}
module partie_servo_avec_servo() {
    mirror([0,1,0]) partie_servo();
    mirror([0,1,0]) translate([empileur_d/2+4,7,-45+hauteur_attache]) 
        rotate([0,0,15])difference()
            servo();
    
}
partie_servo_avec_servo();