epaisseur_plaque = 2.3;
hauteur_support  = 9;

difference() {
    cube([45,104,epaisseur_plaque + hauteur_support]);
    union() {
        translate([epaisseur_plaque,0,epaisseur_plaque])
            cube([43,104,hauteur_support]);
        translate([epaisseur_plaque+5,7,0]) cube([40,90,epaisseur_plaque]);
    }
}