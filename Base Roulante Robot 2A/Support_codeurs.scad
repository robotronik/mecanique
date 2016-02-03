$fn = 40;
codeur_diam_pasdevis = 9.3;
include <../Modèles/support_roulement_lineaire.scad>;
include <roue_codeuse.scad>

rails_distance      = 46;
rails_diametre      =  8;
roulements_diametre = 15;


chariot_hauteur     = 20;
chariot_epaisseur   =  4;
dim_supports_roulements = roulements_diametre + 8;
dim_supports_roulements_carres = roulements_diametre ;

delta_hauteur_chariot = 3;

support_rails_larg  = 15;
support_rails_epp   = 3;


module chariot() {
    difference() {
        union() {
            echo(rails_distance/2-12.65);
            translate([-8.5-chariot_epaisseur/2,5-rails_distance/2, 0])
                cube([  chariot_epaisseur,-10+rails_distance  , chariot_hauteur]);

            rayon_courbure = 2;

            // Droite
            translate([0, rails_distance/2,delta_hauteur_chariot])
                support_roulement_lineaire_simple();
            translate([-6.5, rails_distance/2-10.35,delta_hauteur_chariot])
                cube([7, 2.5, chariot_hauteur-delta_hauteur_chariot]);
            translate([-6.5,rails_distance/2-10.35 - rayon_courbure,0]) difference() {
                cube([rayon_courbure, rayon_courbure, chariot_hauteur]);
                translate([rayon_courbure,0,0])cylinder(h=chariot_hauteur, d = 2*rayon_courbure);
            }
        
            // Gauche
            translate([0,-rails_distance/2,delta_hauteur_chariot])
                support_roulement_lineaire_simple();
            translate([-6.5,-rails_distance/2+10.35-2.5,delta_hauteur_chariot])
                cube([7, 2.5, chariot_hauteur-delta_hauteur_chariot]);
            translate([-6.5,-rails_distance/2+10.35,0]) difference() {
                cube([rayon_courbure, rayon_courbure, chariot_hauteur]);
                translate([rayon_courbure,rayon_courbure,0])cylinder(h=chariot_hauteur, d = 2*rayon_courbure);
            }
        }
        translate([-8.5,0,6.5]) {
            rotate([0,90,0]) cylinder(d = codeur_diam_pasdevis, h = 20, center=true);
            %translate([-11,0,0])roue_codeuse();
        }
        translate([-11,0,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-20.7, epaisseur = 15);
    }
}

module attache_rail() {
    difference() {
        cylinder(d = rails_diametre+4, h = 5);
        translate([0,0,4.5]) cube([rails_diametre+4,1,7], center=true);
    }
}
module supports_rails() {
    difference() {
        union() {
            translate([0,0,support_rails_epp/2])
            cube([support_rails_larg,rails_distance, support_rails_epp], center=true);
            translate([0, rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0,-rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0, rails_distance/2,support_rails_epp]) difference()
                attache_rail();
            translate([0,-rails_distance/2,support_rails_epp]) difference()
                attache_rail();
        }

        translate([0, rails_distance/2,0])  cylinder(d = rails_diametre, h = 50);
        translate([0,-rails_distance/2,0])  cylinder(d = rails_diametre, h = 50);
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

//translate([0,0,14])
chariot();


%union() {
    translate([0, rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
    translate([0,-rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
}

/*
supports_rails();
translate([0,0,50]) supports_rails_haut();
%translate([0,0,-3/2])cube([1000,1000,3], center=true);
*/

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


