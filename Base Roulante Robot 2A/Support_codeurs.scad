$fn = 40;
codeur_diam_pasdevis = 9.3;
include <../Modèles/support_roulement_lineaire.scad>;
include <roue_codeuse.scad>

// TODO déterminer ces dimensions
rails_distance      = 46;
rails_diametre      =  8;
roulements_diametre = 15;



chariot_hauteur     = 15;
chariot_epaisseur   =  4;
dim_supports_roulements = roulements_diametre + 8;
dim_supports_roulements_carres = roulements_diametre ;

support_rails_larg  = 15;
support_rails_epp   = 3;

module chariot() {
    translate([-8.5,0,0])
    difference() {
        %translate([-11,0,0])roue_codeuse();
        translate([-chariot_epaisseur/2,-rails_distance/2,-chariot_hauteur/2])
            cube([  chariot_epaisseur,   rails_distance,  chariot_hauteur+5]);
        rotate([0,90,0])cylinder(d = codeur_diam_pasdevis, h = 20, center=true);
    }


    // Un hack affreux (l'intersection) pour avoir des supports en dessous des attaches
    // pour que ça ne s'imprime pas dans le vide…
    translate([0, rails_distance/2,-chariot_hauteur/2+2]) {
        support_roulement_lineaire_simple();
        intersection() {
           translate([0,0,-1])cube([100,100,2], center=true);
           translate([0,0,-20])support_roulement_lineaire_simple();
        } };
    translate([0,-rails_distance/2,-chariot_hauteur/2+2]) {
        support_roulement_lineaire_simple();
        intersection() {
           translate([0,0,-1])cube([100,100,2], center=true);
           translate([0,0,-20])support_roulement_lineaire_simple();
        } };
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

translate([0,0,14])chariot();
%union() {
    translate([0, rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
    translate([0,-rails_distance/2,2])  cylinder(d = rails_diametre, h = 50);
}


supports_rails();
translate([0,0,50]) supports_rails_haut();
%translate([0,0,-3/2])cube([1000,1000,3], center=true);


