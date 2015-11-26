
// modèle roue dentée

//\\épaisseur//
largeur_roue_dentee = 26.0;   // Épaisseur totale
largeur_dent    = 20.4;
largeur_disque  =  1.7;
largeur_cyl     =  5.6;
//\\rayon//
rayon_dis   = 31.8;
rayon_dent  = 27.5;
rayon_cyl   = 19.9;
rayon_axe   =  5.9;

module cyl_ext() {
    cylinder(h=largeur_disque, d=rayon_dis, center=true );
}

module roue1() {
    translate([0,0, largeur_disque/2])
        cyl_ext();
    translate([0,0, largeur_dent/2])
        cylinder(h=largeur_dent, d=rayon_dent, center=true);
    translate([0,0, largeur_dent-largeur_disque/2])
        cyl_ext();
    translate([0,0, largeur_dent+largeur_cyl/2])
        cylinder(h=largeur_cyl, d=rayon_cyl, center=true );
};

module roue_dentee() {
    rotate([0,90,0])difference() {
        roue1();
        cylinder(h=100, d=rayon_axe, center=true);
    }
}
