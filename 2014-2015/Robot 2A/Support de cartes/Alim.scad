
epaisseur_support=3;
hauteur_bords=3;
largeur_bords=3;

largeur_carte=70.385;
longueur_carte=102.88;

module carte() {
    square([longueur_carte,largeur_carte]); 
}

module carte_plus_grand() {
minkowski() {
    carte();
    square([2*largeur_bords,3*largeur_bords], center=true);
}
}

module main() {
difference() {
    linear_extrude(height=epaisseur_support+hauteur_bords) carte_plus_grand();
    translate([0,0,epaisseur_support])
    linear_extrude(height=hauteur_bords) carte();
}
}

main();