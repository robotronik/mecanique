largeur_fente=4;
longueur_fente=26.1;
epaisseur_fente=3;
epaisseur_plaque=2;

module support_fente() {
translate([0,0,-epaisseur_fente/2])
    cube([largeur_fente, longueur_fente,epaisseur_fente],
        center=true);

translate([0,0,epaisseur_plaque/2])
    cube([largeur_fente*2, longueur_fente,epaisseur_plaque],
        center=true);
    
}

module support_ovale() {
    intersection() {
        translate([0,-85,0]) scale (v=[4,9,1]) 
            cylinder(h = 10, r=10, $fn=100, center=true);
        union() {
        cube([50,10,10], center=true);
        }
    }
    
}

support_fente();