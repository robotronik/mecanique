$fn=100;

capteurUS_largeur = 19.9;
capteurUS_longueur= 22.1;
capteurUS_ep_PCB= 1.7;

module capteur_US_base() {
    cube([capteurUS_largeur,capteurUS_longueur,capteurUS_ep_PCB]);
    translate([2.54,2.54])
        cylinder(d=3.1, h=20, center=true);
    translate([2.54+12.6,2.54+17])
        cylinder(d=3.1, h=20, center=true);
    translate([9,capteurUS_longueur/2])cylinder(d=16.4, h=15.5);
    translate([17.9,0,-7]) cube([2,19,7]);
}
module capteur_US() {
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2])capteur_US_base();
}
