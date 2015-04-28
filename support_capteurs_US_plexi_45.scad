$fn=50;
carre_haut=18*sqrt(2);
carre_bas=35;
hauteur=12-3-3; //longueur capteur-epaisseur plaque-long_vis
hauteur_support=hauteur+22.2;
epaisseur_haut=3;
epaisseur_bas=5;
long_vis=3;
dia_vis=4;
dia_trou_vis=2;
ecart_vis=21.7;
ecart_fixation=35;
dia_fixation=6;
dia_trou_fixation=4;
epaisseur_fixation=2;
include <capteur_US.scad>

difference() {
    mirror([1,1,0]) {
        translate([0,0,-2])
            cube([capteurUS_largeur-2,2,capteurUS_longueur+4]);
        translate([0,0,-2])
            cube([capteurUS_largeur,2,capteurUS_longueur]);
        
        translate([0,0,-2])linear_extrude(height=2) {
            polygon([
                [0,0],
                [capteurUS_largeur,2],
                [(-capteurUS_largeur+2)/1.414,
                 ( capteurUS_largeur+2)/1.414]]);
        }
        rotate([0,0,90+45]) difference() {
            translate([0,-2,-2]) cube([capteurUS_largeur,2,capteurUS_longueur+4]);
            translate([capteurUS_largeur/2,0,5])rotate([90,0,0])
                cylinder(d=dia_trou_fixation, h=100);
            translate([capteurUS_largeur/2,0,capteurUS_longueur-5])rotate([90,0,0])
                cylinder(d=dia_trou_fixation, h=100);
        }
        
    }
    
    
translate([0,-capteurUS_largeur/2,capteurUS_longueur/2])
    rotate([-90,0,-90])#capteur_US();
}
