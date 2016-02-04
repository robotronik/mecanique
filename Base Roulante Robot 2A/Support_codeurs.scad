$fn = 40;
codeur_diam_pasdevis = 9.5;
include <../Modèles/support_roulement_lineaire.scad>;
include <roue_codeuse.scad>

rails_distance      = 46;
rails_diametre      =  8.23;
roulements_diametre = 15;


delta_hauteur_chariot = 7;
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
            translate([-8.5-chariot_epaisseur/2,5-rails_distance/2, 0])
                cube([  chariot_epaisseur,-10+rails_distance  , chariot_hauteur]);

            // Haut
            translate([-8.5,9-rails_distance/2, chariot_hauteur-2])
                cube([ 8.5,-18+rails_distance  , 2]);

            // Droite
            cote();
            // Gauche
            mirror([0,1,0])cote();

        }
        translate([-8.5,0,6.5]) {
            //rotate([0,90,0]) cylinder(d = codeur_diam_pasdevis, h = 20, center=true);
            #translate([-11.4,0,0])roue_codeuse();
        }
        translate([-11,0,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-10.7, epaisseur = 20);
    }
}
module cote() {
    rayon_courbure = 2.3;
    translate([0,-rails_distance/2,delta_hauteur_chariot])
        support_roulement_lineaire_simple();
    translate([-6.5,-rails_distance/2+10.3-2.5,0])
        cube([7, 2.5, chariot_hauteur]);
    translate([-6.5,-rails_distance/2+10.35,0])
        scale([3.0,1.8,1])difference() {
        cube([rayon_courbure, rayon_courbure, chariot_hauteur-2]);
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
        translate([0,0,10.6])
            rotate([0,90,0]) cylinder(d=codeur_diametre, h=support_rails_larg-4, center=true);

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

// Contre la plaque : 4.5
translate([0,0,4]) chariot();

%union() {
    translate([0, rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
    translate([0,-rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
}

supports_rails();
//translate([0,0,50]) supports_rails_haut();
//%translate([0,0,-3/2])cube([1000,1000,3], center=true);


module courbe(hauteur = 2, ecartement = 20, epaisseur = 5) {
    rayon = hauteur/4 + (ecartement*ecartement)/(16*hauteur);
    intersection() {
        union(){
        translate([rayon-hauteur, ecartement/2,0])cylinder(r=rayon, h = epaisseur, $fn=100);
        translate([rayon-hauteur,-ecartement/2,0])cylinder(r=rayon, h = epaisseur, $fn=100);
        difference() {
            translate([-hauteur/2,-ecartement/2,0])cube([rayon,ecartement, epaisseur]);
            translate([-rayon,0,0])cylinder(r=rayon, h = epaisseur, $fn=100);
        }
        }
        translate([-hauteur,-ecartement/2,0])cube([hauteur,ecartement, epaisseur]);
    }
    translate([-hauteur, ecartement/2,0])cube([hauteur,100,epaisseur]);
    translate([-hauteur,-ecartement/2-100,0])cube([hauteur,100,epaisseur]);
}

