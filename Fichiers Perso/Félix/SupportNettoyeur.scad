// Syntaxe C en général
// Mets un # devant un objet pour le "voir" en rouge
// (pratique pour intersections et différences)

// Paramètre de "précision" pour la sphère
$fn=100;

// Toutes les dimensions sont en millimètres
rayon=40;
hauteur =10;
epaisseur_fond=0.5;

difference() {
    intersection() {
        translate([0,0,hauteur-rayon]) sphere(rayon);
        translate([-rayon, -rayon,0])
        cube([2*rayon, 2*rayon, hauteur]);
    }
    translate([0,0,hauteur/2 + epaisseur_fond])
    #cube([15,20,hauteur], center=true);

}
