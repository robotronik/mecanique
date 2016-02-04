
// Valeur réelle : 41.2
codeuse_diametre    = 41.2;
codeuse_epaisseur   = 10;
codeur_diametre     = 21.36;
codeur_epaisseur    = 12.5;

module _roue_codeuse() {
    $fn=15;
    hull() {
        cylinder(center=true,
                d=codeuse_diametre*0.8,
                h=codeuse_epaisseur);
        cylinder(center=true,
                d=codeuse_diametre,
                h=codeuse_epaisseur*0.5);
    }
    // Axe
    translate([0,0,codeuse_epaisseur/2])cylinder(d=9.5,h=8.5, $fn=50);
    // Codeur
    translate([0,0,codeuse_epaisseur/2 + 8.5]) {
            cylinder(d=17.7, h=1.2);
        translate([0, 0, 1.2])
            cylinder(d=21.3, h=8);
        translate([0, 0, 1.2+8])
            cylinder(d=18.9, h=3.3);
        translate([21.3/2-23.2,-11.9/2,3.9])
            cube([10,11.9,5.1]);
    }
}

module roue_codeuse() {
    rotate([0,90,0])_roue_codeuse();
}
//_roue_codeuse();