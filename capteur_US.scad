$fn=100;

capteurUS_largeur = 19.9;
capteurUS_longueur= 22.1;
capteurUS_ep_PCB= 1.7;

module vis_capteur() {
    translate([2.54,2.54])
        circle(d=3.1);
    translate([2.54+12.6,2.54+17])
        circle(d=3.1);
}
module capteur_US_base() {
    cube([capteurUS_largeur,capteurUS_longueur,capteurUS_ep_PCB]);
    translate([0,0,-10])linear_extrude(height=20)vis_capteur();
    translate([9,capteurUS_longueur/2])cylinder(d=16.4, h=15.5);
    translate([17.9,0,-7]) cube([2,19,7]);
}
module capteur_US() {
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2])capteur_US_base();
}
