moteur_longueur = 40;
moteur_diametre = 45;

module moteur_Brushless() {
    rotate([0,-90,0]) {
        translate([0,0,-moteur_longueur])
            cylinder(d=moteur_diametre,
                     h=moteur_longueur);
        translate([-6.3, 0, 0]) {
            cylinder(d=19, h= 1.7); 
            cylinder(d= 8, h=27.2);
        }
    }
}

