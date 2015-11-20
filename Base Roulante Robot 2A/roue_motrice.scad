
// modèle roue motrice

diametre_roue = 72;
rayon_roue = diametre_roue/2 ;
largeur_roue = 20;
diametre_axe = 9.6;


module roue() {
    cylinder(h=largeur_roue , d=diametre_roue, center=true );
}

module tore(){
    difference() {
        cylinder(h=6, d=46.5, center=true);
        cylinder(h=6, d=27.5, center=true);
    }
}

module roue_motrice() {
    rotate([0,90,0]) difference () {
        roue();
        translate([0, 0, 8.5]) tore();
        translate([0, 0, -8.5]) tore();
        cylinder(h=2*rayon_roue, d=diametre_axe, center=true);
        
    }
}
