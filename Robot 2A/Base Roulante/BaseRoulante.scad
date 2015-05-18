$fn=100;

moteur_longueur = 54.5;
moteur_diametre = 25;

reducteur_longueur = 35;  //?
reducteur_diametre = 32;

moteur_axe_longueur = 20;
moteur_axe_diametre = 6;

centre_moteur = (moteur_longueur+reducteur_longueur)/2;

distance_securite_moteurs = 5;

module moteur() {
    translate([0,0,-centre_moteur]) {
        // Branchements + axe arrière
        mirror([0, 0, 1]) {
            cylinder(d=3, h=15.7);
            translate([0, 9, 8.7/2])
                cube([3, 1, 8.7], center=true);
            translate([0,-9, 8.7/2])
                cube([3, 1, 8.7], center=true);
        }
        // Moteur
        translate([0,0,0])
            cylinder(d=moteur_diametre, h=moteur_longueur);
        
        // Motoréducteur
        translate([0,0,moteur_longueur])
            cylinder(d=reducteur_diametre, h=reducteur_longueur);
        translate([0,0,moteur_longueur+reducteur_longueur])
            cylinder(d=20, h=3);
        
        // Axe
        translate([0,0,moteur_longueur+reducteur_longueur])
            cylinder(d=moteur_axe_diametre, h=moteur_axe_longueur);
    }
}
main();


module moteurs() {
translate([0,-(reducteur_diametre+moteur_diametre+distance_securite_moteurs)/4])
    rotate([0,  90]) moteur();

translate([0, (reducteur_diametre+moteur_diametre+distance_securite_moteurs)/4])
    rotate([0, -90]) moteur();
}
module placement_moteurs() {
    translate([0,0,reducteur_diametre/2 + distance_securite_moteurs])moteurs();
}

module main() {
    largeur = 70;
    longueur_supp_moteurs = 80;
    hauteur_supp_moteurs = 40;
    square([200,largeur], center=true);
    translate([0,0,hauteur_supp_moteurs])
        square([longueur_supp_moteurs,largeur], center=true);

    difference() {
        union() {
            translate([ longueur_supp_moteurs/2,-largeur/2])
                rotate([0,-90])square([hauteur_supp_moteurs,largeur]);
            translate([-longueur_supp_moteurs/2,-largeur/2])
                rotate([0,-90])square([hauteur_supp_moteurs,largeur]);
        }
        #placement_moteurs();
        
        
    }
}
