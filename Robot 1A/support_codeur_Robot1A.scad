$fn = 100;
codeur_diam_pasdevis = 9.5;
include </home/jordan/robotronik/mecanique/Modèles/support_roulement_lineaire.scad>;
include </home/jordan/robotronik/mecanique/Modèles/roue_codeuse_2016.scad>

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
            translate([-10.34,9-rails_distance/2, chariot_hauteur-2])
                cube([  10.34,-18+rails_distance, 2]);

            translate([0,0, chariot_hauteur-14.4])difference() {
                translate([-8.5,9-rails_distance/2, 0])
                    cube([ 15.5,-18+rails_distance, 2]);
                translate([2,0,0])#cube([10,15,10], center=true);
            }
		   difference(){
		   union(){
            // Droite
            translate([23,-22.9,0])rotate([0,0,-90])cote();
            // Gauche
            mirror([0,1,0])translate([23,-22.9,0])rotate([0,0,-90])cote();
		  }
		  translate([8.9,15.9,-3.2])cube([5,8,16.7]);
		  translate([10.34,15.9,-3.2])#cube([5,8,45]);
		  mirror([0,1,0])union(){
		  translate([8.9,15.9,-3.2])cube([5,8,16.7]);
		  translate([10.34,15.9,-3.2])#cube([5,8,45]);
		  }
		  }
        }
        translate([-8.5,0,6.5])
            #translate([-11.4,0,0])roue_codeuse_new();

        translate([-11, 4,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-20, epaisseur = 20);
        mirror([0,1,0])
        translate([-11, 4,-0.01])rotate([0,90,0])
            courbe(hauteur = delta_hauteur_chariot, ecartement = rails_distance-20, epaisseur = 20);
    }
}
module cote() {
    translate([0.1,-rails_distance/2,delta_hauteur_chariot])
        support_roulement_lineaire_simple();
    translate([0.1,-rails_distance/2,delta_hauteur_chariot])
        translate([0,10.34,0])mirror([0,1,0])mirror([1,0,0])
        cube([7.36, 2.5, chariot_hauteur-delta_hauteur_chariot]);


    translate([0,-rails_distance/2,0])
         difference() {
            difference() {
                translate([-10.35+chariot_epaisseur,0,0])
                    cube([10.34-chariot_epaisseur, 10.34+4.14, chariot_hauteur-2]);
                difference() {
                    cylinder(r=7.7, h=100);
                    translate([-10.5,-7,0])cube([4,14,100]);
                }
            }
            translate([0,10.34,0]) scale([1.3,0.828,1])
                translate([0,5,0])cylinder(h=chariot_hauteur-1, d = 10);
        }
}

module supports_rails() {
    diametre_vis = 3;
    difference() {
        union() {
		translate([-9.115,20,0])cube([18.23,30,3]);
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
           //cube([support_rails_larg-4, codeur_diametre, 2.1*support_rails_epp], center=true);
            //rotate([0,90,0]) cylinder(d=codeur_diametre, h=support_rails_larg-4, center=true);
			translate([-6.5,-codeur_diametre/2,0])#cube([support_rails_larg-5.5, codeur_diametre, 2.1*support_rails_epp]);

        // Supports de barres
        translate([0, rails_distance/2,1])     # cylinder(d = rails_diametre-1,    h = 50);
        translate([0, rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0, rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);

        translate([0,-rails_distance/2,1])      #cylinder(d = rails_diametre-1,    h = 50);
        translate([0,-rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0,-rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);

        // Vis extérieures
        translate([5, rails_distance/2+20,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([-5, rails_distance/2+20,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([0,-rails_distance/2-12,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);

        // Vis centrales
        /*translate([ support_rails_larg/2-3, rails_distance/2-10,0])
            #cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([ support_rails_larg/2-3,-rails_distance/2+10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([-support_rails_larg/2+3, rails_distance/2-10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);
        translate([-support_rails_larg/2+3,-rails_distance/2+10,0])
            cylinder(d = diametre_vis, h = support_rails_epp+5);*/
    }
}
module supports_rails_haut() {
    diametre_vis = 3;
    difference() {
        union() {
            translate([0,0,support_rails_epp/2])
            cube([support_rails_larg,rails_distance, support_rails_epp], center=true);
            translate([0, rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0,-rails_distance/2,0])
                cylinder(d = support_rails_larg, h = support_rails_epp);

            translate([0, rails_distance/2,support_rails_epp]) difference()
                cylinder(d = rails_diametre+7, h = 11);
            translate([0,-rails_distance/2,support_rails_epp]) difference()
                cylinder(d = rails_diametre+7, h = 11);

            translate([0, rails_distance/2,support_rails_epp]) difference()
                cylinder(d1 = support_rails_larg,d2 = rails_diametre+7, h = 3);
            translate([0,-rails_distance/2,support_rails_epp]) difference()
                cylinder(d1 = support_rails_larg,d2 = rails_diametre+7, h = 3);
		
        }

        // Supports de barres
        translate([0, rails_distance/2,1])      cylinder(d = rails_diametre,    h = 50);
        translate([0, rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0, rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);

        translate([0,-rails_distance/2,1])      cylinder(d = rails_diametre,    h = 50);
        translate([0,-rails_distance/2,-0.1])   cylinder(d = rails_diametre-2,  h = 50);
        translate([0,-rails_distance/2,8])      rotate([0,90,0]) cylinder(d=2,h=10);
	
		translate([-6.5,-codeur_diametre/2,0])#cube([support_rails_larg-5.5, codeur_diametre, 2.1*support_rails_epp]);
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
        translate([0, rails_distance/2,1])  cylinder(d = rails_diametre, h = 75);
        translate([0,-rails_distance/2,1])  cylinder(d = rails_diametre, h = 75);
    }

    supports_rails();
    translate([0,0,1+75+1]) rotate([180,0,0])supports_rails_haut();
    //%translate([0,0,-3/2])cube([1000,1000,3], center=true);
}
supports_rails();
//supports_rails_haut();
//support_codeur();
//chariot();