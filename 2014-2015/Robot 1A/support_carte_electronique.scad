$fn=100;
carte_largeur =45; 
carte_longueur=104;
carte_delta_vis=2.9;

epaisseur_plaque = 2.3;
hauteur_support  = 9;
largeur_support  = 6;

module vis_carte() {
    cylinder(d=2.5, h=20, center=true);
}
module carte() {
    cube([carte_largeur, carte_longueur,100]);
    translate([0,76,-1.5])
        cube([carte_largeur,2,2]);
    translate([largeur_support,largeur_support,-epaisseur_plaque-0.1])
        cube([carte_largeur  -   largeur_support,
              carte_longueur - 2*largeur_support,5]);
    //Vis
    translate([carte_delta_vis,carte_delta_vis])
        vis_carte();
    translate([carte_delta_vis,carte_longueur-carte_delta_vis])
        vis_carte();
    translate([carte_largeur-carte_delta_vis,carte_delta_vis])
        vis_carte();
    translate([carte_largeur-carte_delta_vis,carte_longueur-carte_delta_vis])
        vis_carte();
}
difference() {
    translate([-epaisseur_plaque,0,-epaisseur_plaque])
        cube([carte_largeur + epaisseur_plaque,
              carte_longueur,
              epaisseur_plaque + hauteur_support]);
    carte();
}