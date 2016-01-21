$fn = 40;
codeur_diam_pasdevis = 9.3;

// TODO déterminer ces dimensions
rails_distance      = 50;
rails_diametre      =  8;
roulements_diametre = 15;

chariot_hauteur     = 15;
chariot_epaisseur   =  3;
dim_supports_roulements = roulements_diametre + 8;
dim_supports_roulements_carres = roulements_diametre ;

support_rails_larg  = 15;
support_rails_epp   = 3;

module chariot() {
    difference() {
        union() {
            cube([chariot_epaisseur,rails_distance, chariot_hauteur], center=true);
            translate([0, rails_distance/2,0])
                cylinder(d = dim_supports_roulements, h = chariot_hauteur, center=true);
            translate([0, rails_distance/2,-chariot_hauteur/2]) rotate([0,0,-90-45])
                cube([dim_supports_roulements/2,
                      dim_supports_roulements/2,chariot_hauteur]);

            translate([0,-rails_distance/2,0])
                cylinder(d = dim_supports_roulements, h = chariot_hauteur, center=true);
            translate([0,-rails_distance/2,-chariot_hauteur/2]) rotate([0,0, 45])
                cube([dim_supports_roulements/2,
                      dim_supports_roulements/2,chariot_hauteur]);
        }
        rotate([0,90,0])cylinder(d = codeur_diam_pasdevis, h = 20, center=true);
        translate([0, rails_distance/2,0])
            cylinder(d = roulements_diametre, h = 50, center=true);
        translate([0,-rails_distance/2,0])
            cylinder(d = roulements_diametre, h = 50, center=true);
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
            translate([0, rails_distance/2,support_rails_epp]) difference() {
                cylinder(d = rails_diametre+4, h = 5);
                translate([0,0,4.5]) cube([rails_diametre+4,1,7], center=true);
            }
            translate([0,-rails_distance/2,support_rails_epp]) difference() {
                cylinder(d = rails_diametre+4, h = 5);
                translate([0,0,4.5]) cube([rails_diametre+4,1,7], center=true);
            }
            
        }

        translate([0, rails_distance/2,2])  cylinder(d = rails_diametre-0.3, h = 50);
        translate([0,-rails_distance/2,2])  cylinder(d = rails_diametre-0.3, h = 50);
    }
}

translate([0,0,20])chariot();
supports_rails();