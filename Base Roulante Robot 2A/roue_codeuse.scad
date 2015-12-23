
codeuse_diametre    = 41.2;
codeuse_epaisseur   = 10;
codeur_diametre     = 21.6;
codeur_epaisseur    = 12.5;

module _roue_codeuse() {
    hull() {
        cylinder(center=true,
                d=codeuse_diametre*0.8,
                h=codeuse_epaisseur);
        cylinder(center=true,
                d=codeuse_diametre,
                h=codeuse_epaisseur*0.5);
    }
    // Axe
    translate([0,0,codeuse_epaisseur/2])cylinder(d=3,h=8.5);
    // Codeur
    translate([0,0,codeuse_epaisseur/2 + 8.5]) {
        cylinder(d=codeur_diametre, h=codeur_epaisseur);
        translate([-codeur_diametre/2,0,codeur_epaisseur/2])
            cube(center=true, [3,12,6]);
    }
}

module roue_codeuse() {
    rotate([0,90,0])_roue_codeuse();
}
