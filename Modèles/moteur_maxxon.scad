moteur_longueur = 54.5;
moteur_diametre = 25;

reducteur_longueur = 39;
reducteur_diametre = 32;

moteur_axe_longueur = 20;
moteur_axe_diametre = 6;

centre_moteur = (moteur_longueur+reducteur_longueur)/2;

module visM(M, L, taraudage) {
    if(taraudage == 0)
        cylinder(d=M  , h=L);
    else
        cylinder(d=M-1, h=L);
}


module moteur_maxxon() {
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


moteur_maxxon();