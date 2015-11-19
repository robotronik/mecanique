$fn=50;
carre_haut=18*sqrt(2);
carre_bas=35;
hauteur=9;
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
// En imprimer 2 ou pas du tout


include <capteur_US.scad>
translate([0,0,12.5])rotate([180,0,90]) %capteur_US();
module emplacement_vis() {
    mirror([0,0,1]) rotate([180,0,90])
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2]) {
        translate([2.54,        2.54,   hauteur])
            support_vis();
        translate([2.54+12.6,   2.54+17,hauteur])
            support_vis();
    }
}
module support_vis() {
    difference() {
        cylinder(d=dia_vis,h=long_vis);
        cylinder(d=dia_trou_vis,h=long_vis);
    }
}

module support_emplacement_vis() {
    mirror([0,0,1])rotate([180,0,90])
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2])
        vis_capteur();
    translate([6.5,5])square([4,5]);
    translate([17/2,5.2])circle(d=dia_vis);
    
    translate([-17/2,-7.4])circle(d=dia_vis);
    translate([-10.5,-10.4])square([4,3]);
}

module cadre() {
    support_emplacement_vis();
    rotate([180,0,90]) difference() {
        square([capteurUS_largeur+3,capteurUS_longueur+1], center=true);
        translate([-1,0])
        //circle(d=18.5);
        square([capteurUS_largeur-2.6,capteurUS_longueur-4.2],
            center=true);
    }
    
}

module base_fixation() {
    difference()
    {
        union()
        {
            cylinder(d=dia_fixation,h=epaisseur_fixation);
            translate([-dia_fixation/2,0,0])
                cube([dia_fixation,dia_fixation-2,epaisseur_fixation]);
        }
        cylinder(d=dia_trou_fixation,h=epaisseur_fixation);
    }
}

module fixation() {
    translate([0,ecart_fixation/2,0])
        mirror([0,1,0]) base_fixation();
    translate([0,-ecart_fixation/2,0])
        base_fixation();
}

translate([0,0,hauteur]) mirror([0,0,1])
    linear_extrude(height=hauteur,scale=carre_bas/carre_haut)
        cadre();

emplacement_vis();
fixation();