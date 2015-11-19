
module visM(M, L, taraudage) {
    if(taraudage == 0)
        cylinder(d=M  , h=L);
    else
        cylinder(d=M-1, h=L);
}

moteur_longueur = 54.5;
moteur_diametre = 25;

reducteur_longueur = 39;
reducteur_diametre = 32;

moteur_axe_longueur = 20;
moteur_axe_diametre = 6;

centre_moteur = (moteur_longueur+reducteur_longueur)/2;

module moteur() {
    translate([0,0,-centre_moteur]) {
        // Branchements + axe arrière
        mirror([0, 0, 1]) rotate([0,0,35]){
            cylinder(d=3, h=15);
            translate([0, 9.5, 8.7/2])
                cube([3, 2, 8.7], center=true);
            translate([0,-9.5, 8.7/2])
                cube([3, 2, 8.7], center=true);
        }
        // Moteur
        translate([0,0,0])
            cylinder(d=moteur_diametre, h=moteur_longueur);
        
        // Motoréducteur
        translate([0,0,moteur_longueur])
            cylinder(d=reducteur_diametre, h=reducteur_longueur);
        translate([0,0,moteur_longueur+reducteur_longueur]) {
            cylinder(d=20, h=3.01);
            translate([ 26/2,0,0]) visM(M=3,L=4, taraudage=0);
            translate([-26/2,0,0]) visM(M=3,L=4, taraudage=0);
            translate([0, 26/2,0]) visM(M=3,L=4, taraudage=0);
            translate([0,-26/2,0]) visM(M=3,L=4, taraudage=0);
        }
        // Axe
        translate([0,0,moteur_longueur+reducteur_longueur])
            cylinder(d=moteur_axe_diametre, h=moteur_axe_longueur);
    }
}

roue_diametre = 60;
roue_epaisseur= 20;
module roue() {
    rotate([0,90,0])
        cylinder(h = roue_epaisseur, d=roue_diametre, center=true);
    rotate([0,90,0])
        cylinder(h = 80, d=5, center=true);
}

codeuse_diametre    = 41.2;
codeuse_epaisseur   = 10;
codeur_diametre     = 21.6;
codeur_epaisseur    = 12.5;
module roue_codeuse() {
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
        translate([codeur_diametre/2,0,codeur_epaisseur/2])
            cube(center=true, [3,12,6]);
    }
}