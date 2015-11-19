use <../lib/ISOThread.scad>

$fn=100;

// modèle roue motrice

diametre_roue = 72; //mm
rayon_roue = diametre_roue/2 ; //mm
largeur_roue = 20; //m
diametre_axe = 9.6; //mm


module roue(){
    cylinder(h=largeur_roue , d=diametre_roue, center=true );
}

module tore(){
    difference()
    {
        cylinder(h=6, d=46.5, center=true);
        cylinder(h=6, d=27.5, center=true);
    }
}
/*
module tore1(){
    rotate_extrude () translate([20,0,0]) circle (r=9, $fn=100,center=true);
}
tore1();
tore();*/

module roue_motrice() {difference () 
{
    roue();
    translate([0, 0, 8.5]) tore();
    translate([0, 0, -8.5]) tore();
    cylinder(h=2*rayon_roue, d=diametre_axe, center=true);
    
}
}
//rotate([90,0,0]) roue_motrice();

