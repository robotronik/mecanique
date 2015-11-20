
// modèle roue dentée

//\\épaisseur//
largeur_dent = 16.1; //mm
largeur_disque = 1.7; //mm
largeur_cyl = 5.9; //mm
//\\rayon//
rayon_dis = 31.8/2;//mm
rayon_dent = 27.5/2; //mm
rayon_cyl= 19.9/2; //mm
rayon_axe = 5.9/2; //mm

module cyl_ext() {
    cylinder(h=largeur_disque, r=rayon_dis, center=true );
}

module roue1() {
    cylinder(h=largeur_dent, r=rayon_dent, center=true );
    translate([0, 0, (largeur_dent/2+(largeur_disque/2))])
        cyl_ext();
    translate([0, 0, -(largeur_dent/2+(largeur_disque/2))])
        cyl_ext();
    translate([0, 0, -(largeur_dent/2+(largeur_cyl/2))])
        cylinder(h=largeur_cyl, r=rayon_cyl, center=true );
};

module roue_dentee() {
    rotate([0,90,0])difference() {
        roue1();
        cylinder(h=100, r=rayon_axe, center=true);
    }
}

//roue_dentee();