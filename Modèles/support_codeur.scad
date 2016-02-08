$fn = 40;
codeur_diam_pasdevis = 9.5;
include <../Modèles/support_roulement_lineaire.scad>;
include <roue_codeuse.scad>

rails_distance      = 46;
rails_diametre      =  8.23;
roulements_diametre = 15;


delta_hauteur_chariot = 13.5;
chariot_hauteur     = delta_hauteur_chariot + 26.7;
chariot_epaisseur   =  4;
dim_supports_roulements = roulements_diametre + 8;
dim_supports_roulements_carres = roulements_diametre ;


support_rails_larg  = rails_diametre+10;
support_rails_epp   = 3;


module chariot() {
    difference() {
        union() {
            echo(rails_distance/2-12.65);
            // Plaque principale
            translate([-8.4-chariot_epaisseur/2,4.5-rails_distance/2, 0])
                cube([  chariot_epaisseur, rails_distance-9  , chariot_hauteur]);
            translate([-8.4-chariot_epaisseur/2,   -rails_distance/2, 0])
                cube([  2, rails_distance  , chariot_hauteur]);

            // Haut
            translate([-8.5,9-rails_distance/2, chariot_hauteur-2])
                cube([ 15.5,-18+rails_distance, 2]);

            translate([0,0, chariot_hauteur-18])difference() {
                translate([-8.5,9-rails_distance/2, 0])
                    cube([ 15.5,-18+rails_distance, 2]);
                cube([2,1,10], center=true);
            }

            // Droite
            cote();
            // Gauche
            mirror([0,1,0])cote();

        }
        translate([-8.5,0,6.5]) {
            //rotate([0,90,0]) cylinder(d = codeur_diam_pasdevis, h = 20, center=true);
            translate([-11.4,0,0])roue_codeuse();
            translate([-3,0])rotate([0,90,0]) cylinder(d=13,h=2);
        }
        translate([-11, 4,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-20, epaisseur = 20);
        mirror([0,1,0])
        translate([-11, 4,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-20, epaisseur = 20);
    }
}
module cote() {
    rayon_courbure = 2.3;
    translate([0,-rails_distance/2,delta_hauteur_chariot])rotate([0,0,-90])
        support_roulement_lineaire_simple();
    /*translate([-6.5,-rails_distance/2+8,0]) {
        cube([7, 2.5, chariot_hauteur]);
        translate([0,-5,0])
        #cube([7,2.5,100]);
    }*/
    translate([-6.4,-rails_distance/2+10.5,0])
        scale([3.2,1.8,1]) difference() {
            union() {
                cube([rayon_courbure, rayon_courbure, chariot_hauteur-2]);
                translate([0, -2.22,0])
                cube([4.185, 2.22,delta_hauteur_chariot]);
            }
            translate([rayon_courbure,rayon_courbure,0])
                cylinder(h=chariot_hauteur-1, d = 2*rayon_courbure);
    }
}

module supports_rails() {
    diametre_vis = 3;
    difference() {
        union() {
            hull() {
                translate([0,0,support_rails_epp/2])
                cube([support_rails_larg,rails_distance, support_rails_epp], center=true);
                translate([0, rails_distance/2,0])
                    cylinder(d = support_rails_larg, h = support_rails_epp);
                translate([0,-rails_distance/2,0])
                    cylinder(d = support_rails_larg, h = support_rails_epp);

                translate([0, rails_distance/2+12,0])
                    cylinder(d = diametre_vis + 4, h = support_rails_epp);
                translate([0,-rails_distance/2-12,0])
                    cylinder(d = diametre_vis + 4, h = support_rails_epp);
            }
            translate([0, rails_distance/2,support_rails_epp]) difference()
                cylinder(d = rails_diametre+7, h = 11);
            translate([0,-rails_distance/2,support_rails_epp]) difference()
                cylinder(d = rails_diametre+7, h = 11);

            translate([0, rails_distance/2,support_rails_epp]) difference()
                cylinder(d1 = support_rails_larg,d2 = rails_diametre+7, h = 3);
            translate([0,-rails_distance/2,support_rails_epp]) difference()
                cylinder(d1 = support_rails_larg,d2 = rails_diametre+7, h = 3);
        }
        // Pour que le codeur puisse aller plus bas
            cube([support_rails_larg-4, codeur_diametre, 2.1*support_rails_epp], center=true);
            //rotate([0,90,0]) cylinder(d=codeur_diametre, h=support_rails_larg-4, center=true);

        // Supports de barres
        translate([0, rails_distance/2,1])      cylinder(d = rails_diametre,    h = 50);
        translate([0, rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0, rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);

        translate([0,-rails_distance/2,1])      cylinder(d = rails_diametre,    h = 50);
        translate([0,-rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0,-rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);

        // Vis extérieures
        translate([0, rails_distance/2+12,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([0,-rails_distance/2-12,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);

        // Vis centrales
        translate([ support_rails_larg/2-3, rails_distance/2-10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([ support_rails_larg/2-3,-rails_distance/2+10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([-support_rails_larg/2+3, rails_distance/2-10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([-support_rails_larg/2+3,-rails_distance/2+10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
    }
}
module supports_rails_haut() {
    difference() {
        union() {
            translate([0,0,support_rails_epp/2])
            cube([support_rails_larg,rails_distance, support_rails_epp], center=true);
            translate([0, rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0,-rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0, rails_distance/2, 0]) difference()
                mirror([0,0,1])attache_rail();
            translate([0,-rails_distance/2, 0]) difference()
                mirror([0,0,1])attache_rail();
        }

        translate([0, rails_distance/2,-50-2])  cylinder(d = rails_diametre, h = 50);
        translate([0,-rails_distance/2,-50-2])  cylinder(d = rails_diametre, h = 50);
    }
}


module courbe(hauteur = 2, ecartement = 20, epaisseur = 5) {
    rayon = hauteur/4 + (ecartement*ecartement)/(16*hauteur);
    intersection() {
        union(){
            translate([rayon-hauteur, ecartement/2,0])cylinder(r=rayon, h = epaisseur);
            difference() {
                translate([-hauteur/2, 0,0])cube([hauteur/2,ecartement/2, epaisseur]);
                translate([-rayon,0,0])cylinder(r=rayon, h = epaisseur);
            }
        }
        translate([-hauteur,0,0])cube([hauteur,ecartement/2, epaisseur]);
    }
    translate([-hauteur, ecartement/2,0])cube([hauteur,100,epaisseur]);
}

module support_codeur() {
    // Contre la plaque : 4.5
    translate([0,0,3.2]) chariot();

    %union() {
        translate([0, rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
        translate([0,-rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
    }

    //supports_rails();
    //translate([0,0,50]) supports_rails_haut();
    //%translate([0,0,-3/2])cube([1000,1000,3], center=true);
}


support_codeur();
