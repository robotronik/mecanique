$fn=100;

include <../Plaques Alu/plaques.scad>;
include <modules.scad>

decalage_y_moteurs = 5;
decalage_x_moteurs = 0;

hauteur_plaque_bas = 6;
demie_entraxe_roues = 90;
demie_entraxe_codeurs= demie_entraxe_roues + 50;

hauteur_axe_roues = roue_diametre/2 - hauteur_plaque_bas;

roues();
codeurs();
//main();
moteurs();
rotate([0,0,90])plaque_bas();

module moteurs() {
translate([0,0,reducteur_diametre/2 + 6+1]) {
    translate([decalage_x_moteurs,
        -(reducteur_diametre+moteur_diametre+decalage_y_moteurs)/4])
        rotate([0,  90]) moteur();

    translate([-decalage_x_moteurs,
         (reducteur_diametre+moteur_diametre+decalage_y_moteurs)/4])
        rotate([0, -90]) moteur();
}
}

module roues() {
    translate([0,0,hauteur_axe_roues]) {
        translate([ demie_entraxe_roues,0])roue();
        translate([-demie_entraxe_roues,0])roue();
        
    }
}

module codeurs() {
    translate([ demie_entraxe_codeurs,0,15])
        rotate([0,-90,0])roue_codeuse();
    translate([-demie_entraxe_codeurs,0,15])mirror([1,0,0])
        rotate([0,-90,0])roue_codeuse();
}

module main() {
    largeur = 70;
    longueur_supp_moteurs = (centre_moteur+decalage_x_moteurs)*2-3;
    hauteur_supp_moteurs = 40;
    linear_extrude(height=6) square([250,largeur], center=true);
    translate([0,0,hauteur_supp_moteurs])
        linear_extrude(height=3)square([longueur_supp_moteurs+6,largeur], center=true);

    difference() {
        union() {
            translate([ longueur_supp_moteurs/2,-largeur/2])
                rotate([0,-90]) translate([0,0,-3])
                linear_extrude(height=3)
                square([hauteur_supp_moteurs,largeur]);
            translate([-longueur_supp_moteurs/2,-largeur/2])
                rotate([0,-90])
                linear_extrude(height=3)
                square([hauteur_supp_moteurs,largeur]);
        }
        #moteurs();
    }
    
    
    
}
