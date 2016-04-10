$fn=50;
include <../Modèles/support_roulement_lineaire.scad>;
include <roue_codeuse_2016.scad>
rails_distance      = 46;
rails_diametre      =  8.23;
roulements_diametre = 15;

support_roulement_haut = 26.7;
support_roulement_diam = 10.34;

demi_largeur_milieu = rails_distance/2 - support_roulement_diam;

// Différence entre bas des supports de roulement et axe
delta_hauteur_chariot = 15.5;
// La position du "dos" est à -10 en x

chariot_epaisseur   =  4;
chariot_hauteur = delta_hauteur_chariot + support_roulement_haut;

module cote() {
    translate([0.5,-rails_distance/2,
                delta_hauteur_chariot])
        support_roulement_lineaire_simple();
    // Cubes pour faire le coin du support du roulement
    translate([-10,-rails_distance/2+support_roulement_diam-2.5,
                delta_hauteur_chariot])
        cube([10, 2.5, support_roulement_haut]);
    translate([-10,-rails_distance/2+support_roulement_diam-4,
                delta_hauteur_chariot])
        cube([4, 4, support_roulement_haut]);
    
    translate([-8,-rails_distance/2+support_roulement_diam+6,
                delta_hauteur_chariot+14.4])
        rotate([0,0,-40]) cube([13, 2.5, support_roulement_haut-14.4]);
}

module chariot_a() {
    // Gauche
    cote();
    // Droite
    mirror([0,1,0])cote();
    
    // Plaque haute
    translate([-10, -demi_largeur_milieu, chariot_hauteur-2])
        cube([10, 2*demi_largeur_milieu, 2]);
    
    // Plaque milieu
    difference() {
    translate([-10, -demi_largeur_milieu, chariot_hauteur-14.4])
        cube([17, 2*demi_largeur_milieu, 2]);
    translate([2, 0, chariot_hauteur-14.4])
        cube([6,9,5], center=true);
    }
    
    translate([-10, -demi_largeur_milieu, delta_hauteur_chariot])
        cube([chariot_epaisseur,
                2*demi_largeur_milieu, support_roulement_haut]);
}
module antiquartdecercle(r, h) {
    rotate([0,90,0])difference() {
        cube([r*1.01,r*1.01,h]);
        translate([0,0,-h*0.01]) cylinder(r=r*1.01,h=h*1.02);
    }
}
module chariot() {
    courbure=7;
    largeur_support = 2*demi_largeur_milieu + 5;
    difference() {
        union() {
            chariot_a();
            translate([-10,-largeur_support/2, 0])
                #cube([6, largeur_support,delta_hauteur_chariot+5]);
        translate([-10, largeur_support/2+courbure,
            delta_hauteur_chariot-courbure])
            mirror([0,1,0])mirror([0,0,1])antiquartdecercle(courbure,4);
        translate([-10, -largeur_support/2-courbure,
            delta_hauteur_chariot-courbure])
            mirror([0,0,1])antiquartdecercle(courbure,4);

        translate([-8, -largeur_support/2-0.1, delta_hauteur_chariot-9])
            rotate([0,40,0])cube([3, 2.6, 20]);
        translate([-8,  largeur_support/2-2.5, delta_hauteur_chariot-9])
            rotate([0,40,0])cube([3, 2.6, 20]);

        }
        
        translate([-10, largeur_support/2-courbure,courbure])
            antiquartdecercle(courbure,10);
        translate([-10,-largeur_support/2+courbure,courbure])
            mirror([0,1,0])antiquartdecercle(courbure,10);
        
        #translate([-18.8,0,8.5])roue_codeuse_new();
        translate([-8,0,8.5]) rotate([0,-90,0]) cylinder(d=17,h=10);
        translate([-13,0,5]) cube([10,largeur_support+2,10], center=true);


        
    }
        
    
}
chariot();

