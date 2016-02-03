include <roue_motrice.scad>;
include <roue_dentee.scad>;
include <mdp_ts10093.scad>;
include <roue_codeuse.scad>
include <courroie.scad>
use <../Modèles/stm32f4discovery.scad>

$fn=50;

// Dimensions en millimètres
mot_ecart_y = 30;   // écart entre les
mot_ecart_x = -5;   // écart x moteur
mot_hauteur = 35;
mot_diam    = 32;
d_rouem     = 72;
d_roued     = 27.5;
plaque_epp  = 3;    // épaisseur des plaques
d_perc      = 3;    // diamètre perçage

/**** Placement des moteurs ****/
module placement() {
    translate([mot_ecart_x, -mot_ecart_y, mot_hauteur+rayon_roue]) {
        //rotate([0, 90, 0]) mdp_ts10093();
        translate([52.5, 0, 0]) roue_dentee();
    }
    translate([mot_ecart_x+73, 0, rayon_roue]) {
        mirror([1,0,0]) roue_dentee();
        rotate([130,0,0])
            translate([-3,0,0]) courroie();
    }
    translate([mot_ecart_x+90, 0, rayon_roue])  roue_motrice();
    translate([101, 0, codeuse_diametre/2])     roue_codeuse();
}

module placement_moteur() {
        translate([mot_ecart_x, -mot_ecart_y, mot_hauteur+rayon_roue]) {
        rotate([0, 90, 0]) mdp_ts10093();}
}

module moteurs_pour_diff() {
translate([0,0,rayon_roue]) {
    translate([0, -mot_ecart_y, mot_hauteur])
        rotate([0, 90, 0]) mdp_ts10093();
    rotate ([0,0,180])
    translate([0, -mot_ecart_y, mot_hauteur])
        rotate([0, 90, 0]) mdp_ts10093();

    longueur = 150;
    /////// percage \\\\\\/
    translate([0, -mot_ecart_y*0.5, mot_hauteur*1.75+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -mot_ecart_y*1.5, mot_hauteur*1.75+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -mot_ecart_y*1.5, mot_hauteur*0.25+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -mot_ecart_y*0.5, mot_hauteur*0.25+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  mot_ecart_y*0.5, mot_hauteur*1.75+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  mot_ecart_y*1.5, mot_hauteur*1.75+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  mot_ecart_y*1.5, mot_hauteur*0.25+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  mot_ecart_y*0.5, mot_hauteur*0.25+d_perc])rotate([0, 90, 0])
        cylinder(h=longueur, r=d_perc/2, center=true);
}
}


/**** Platine des moteurs ****/


module support_moteur(){
    _epp = 2;
    /// plaque droite (opposee à la roue dentee)
    difference(){
        translate([ -50-_epp/2  -mot_ecart_x ,-(mot_diam+mot_ecart_y/2)*1.2, rayon_roue+mot_hauteur-18])
            cube([_epp, (mot_diam*2+mot_ecart_y)*0.59, (mot_diam*1.3)]);
        placement_moteur();
    }
    /// plaque gauche (cote roue dentee)
    translate([-5,0,0])
    difference(){
        translate([ 53+mot_ecart_x+_epp/2  ,-(mot_diam+mot_ecart_y/2)*1.2, rayon_roue+mot_hauteur-18])
            cube([_epp, (mot_diam*2+mot_ecart_y)*0.59, (mot_diam*1.3)]);
        moteurs_pour_diff();
    }
    /// plaque tenant l'axe
    /*difference(){
        translate([ 49  ,-mot_ecart_y-mot_diam/2-(mot_diam*0.2/2), rayon_roue])
            cube([_epp, (mot_diam)*1.2, (mot_diam*1.3)]);
        moteurs_pour_diff();
    }*/
    /// plaque en dessous
    translate([ -50-_epp/2-mot_ecart_x , -(mot_diam*2+mot_ecart_y)*0.6 , rayon_roue-_epp+mot_hauteur-18])
    /// percage de la plaque
    difference(){
        cube([ 101+_epp/2+mot_ecart_x*2 , (mot_diam*2+mot_ecart_y)*0.59 , _epp]);
        translate([ 29.5 , mot_ecart_y*0.5, 0])cylinder(h=10, r=d_perc/2, center=true);
        translate([ 29.5 , mot_ecart_y*1.5, 0])cylinder(h=10, r=d_perc/2, center=true);
        translate([ 62.5 , mot_ecart_y*0.5, 0])cylinder(h=10, r=d_perc/2, center=true);
        translate([ 62.5 , mot_ecart_y*1.5, 0])cylinder(h=10, r=d_perc/2, center=true);
    }
}

module trous_roues() {
    _largeur = 55;
    _longueur= largeur_roue+codeuse_epaisseur+5;

    translate([78+mot_ecart_x, -_largeur/2, 0])
        cube([_longueur, _largeur, 11]);

    _largeur2=25;
    //translate([78+mot_ecart_x+_longueur,-_largeur2/2,0])
    //    cube([20, _largeur2, 11]);
}

module trous_percage()  {
    translate([10, -2,0]) cylinder(h=20,d=3,center=true);
    translate([10,-62,0]) cylinder(h=20,d=3,center=true);
    
    translate([45, -22, 0]) cylinder(h=20, d=3, center=true);
    translate([45, -39, 0]) cylinder(h=20, d=3, center=true);
    
    translate([110, -12, 0]) cylinder(h=20, d=3, center=true);
    translate([110, -52, 0]) cylinder(h=20, d=3, center=true);
}

module trous_profiles() {
    translate([44, 99, 0]) cylinder(h=30, d=4, center=true);
    translate([124, 44, 0]) cylinder(h=30, d=4, center=true);
    translate([124, -99, 0]) cylinder(h=30, d=4, center=true);
}

module support_roue() {
    _epaisseur =  3;
    _largeur   = 26;
    _mot_hauteur=40;
    _espace    = 27;
    _posin     = 46.5 - _epaisseur+mot_ecart_x;
    _posout    = _posin + _espace + _epaisseur;
    // Supports des axes
    difference() {
        union(){
            translate([_posout, -_largeur/2, 7+plaque_epp])
                cube([_epaisseur,_largeur,_mot_hauteur]);
            translate([_posin,  -_largeur/2, 7+plaque_epp])
                cube([_epaisseur,_largeur,_mot_hauteur]);
        translate([_posin,  -_largeur/2, 7+plaque_epp])
            cube([_espace + 2*_epaisseur,_largeur,_epaisseur]);
        }
        translate([_posin-0.2, 0, rayon_roue])
            rotate([0,90,0])
                cylinder(d=18,_espace + 2*_epaisseur+0.4);
       
        
        translate([10,32,10]) trous_percage();
        mirror([1,0,0])
        translate([10,32,10]) trous_percage();
    }
}

module plaque_base() {
    difference() {
        translate([-135,-110,7])
          cube([270,220,plaque_epp]);
    //translate([0,0,7+plaque_epp/2])
        // Plaque principale
        translate([77,47,2])
      linear_extrude(height=10) polygon(points=[[65,65],[0,65],[65,0]]);
                translate([-77,47,2])
      linear_extrude(height=10) rotate([0,0,90]) polygon(points=[[65,65],[0,65],[65,0]]);
        trous_roues();
        mirror([1,0,0])
        trous_roues();

        translate([10,32,10]) trous_percage();
        mirror([1,0,0])
        translate([10,32,10]) trous_percage();
        trous_profiles();
        mirror([1,0,0]) trous_profiles();
    }
}

module plaque_sup() {
    translate([0, 0, 100])
    difference() {
        translate([-135,-110,7])
          cube([270,220,plaque_epp]);
    //translate([0,0,7+plaque_epp/2])
        // Plaque principale
        translate([77,47,2])
      linear_extrude(height=10) polygon(points=[[65,65],[0,65],[65,0]]);
                translate([-77,47,2])
      linear_extrude(height=10) rotate([0,0,90]) polygon(points=[[65,65],[0,65],[65,0]]);
        translate([70, 70, 0]) cylinder(h=30, d=20, center=true);
        translate([-70, 70, 0]) cylinder(h=30, d=20, center=true);
        translate([70, -70, 0]) cylinder(h=30, d=20, center=true);
        translate([-70, -70, 0]) cylinder(h=30, d=20, center=true);
        
        trous_profiles();
        mirror([1,0,0]) trous_profiles();
    }
}


module support_rail() {
    facteur = 2.0;//

    translate([20,-(2*mot_diam+mot_ecart_y)*facteur/2,0])
        cube([plaque_epp,2*mot_diam+mot_ecart_y*facteur,rayon_roue+mot_hauteur-30]);
    //plaque bas

    difference(){
        translate([0,-(2*mot_diam+mot_ecart_y)*facteur/2,0])
        cube([20,2*mot_diam+mot_ecart_y*facteur,plaque_epp]);
        trous_percage();
    }
    translate([0,-(2*mot_diam+mot_ecart_y)*facteur/2,rayon_roue+mot_hauteur-27-2*plaque_epp])
    difference(){
        cube([20,2*mot_diam+mot_ecart_y*facteur,plaque_epp]);
        translate([5,(2*mot_diam+mot_ecart_y*facteur-(2*mot_diam+mot_ecart_y*facteur*0.9))/2,-5])
        cube([plaque_epp,2*mot_diam+mot_ecart_y*facteur*0.9,20]);
    }

}

/*** AFFICHAGE ****/

// Moteurs + roues

placement();
rotate ([0,0,180])
    placement();
/*
placement_moteur();
rotate([0,0,180])placement_moteur();*/


// Support des roues dentées + motrices
support_roue();
mirror([1,0,0])
    support_roue();


translate([10,32,10])
    support_rail();
mirror([1,0,0])
translate([10,32,10])
    support_rail();

// projection(cut = false)
*union(){
    translate([0, 56, 0]) support_moteur();
    
    translate([0, 6, 0]) rotate([90, 0, 0]) support_moteur();
    
    difference(){
        translate([-40, -1, 0]) rotate([0, 90, 180]) support_moteur();
        translate([-200, -5, -200]) cube(200);
    }
    
    difference(){
        translate([40, -1, 0]) rotate([0, -90, 180]) support_moteur();
        translate([0, -5, -200]) cube(200);
    }
}
rotate([0 , 0, 180 ])
    support_moteur();

plaque_base();

plaque_sup();

//translate([30,-48,20]) rotate([0,0,90])stm32f4();
