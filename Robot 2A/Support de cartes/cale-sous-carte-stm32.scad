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
    translate([0,-90/2,-epaisseur_fente])
        scale (v=[4,9,1]) 
        cylinder(h = epaisseur_fente+epaisseur_plaque,
            d=10, $fn=100);
    difference() {
        longueur=3+1.65+3;
        translate([-12,(-2*longueur)/2,-epaisseur_fente])
            cube([24,longueur,epaisseur_fente+epaisseur_plaque]);
        translate([-12,-1.65-3,0])
            #cube([24,1.65,epaisseur_plaque]);
        
    }
    }
}

support_ovale();