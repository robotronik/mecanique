include <roue_motrice.scad>;
include <roue_dentee.scad>;
include <mdp_ts10093.scad>;
include <roue_codeuse.scad>
include <courroie.scad>
use <../Modèles/stm32f4discovery.scad>

$fn=50;

// Dimensions en millimètres
ecart   = 30;       // écart moteur
ecartx  = -5;       // écart x moteur 
hauteur = 35;
d_moteur= 32;
d_rouem = 72;
d_roued = 27.5;
epp     = 3;        // épaisseur des plaques
d_perc  = 3;        // diamètre perçage

//****\\Placement des moteurs //****\\//
module placement() {
    translate([ecartx, -ecart, hauteur+rayon_roue]) {
        rotate([0, 90, 0]) mdp_ts10093();
        translate([52.5, 0, 0]) roue_dentee();
    }
    translate([73+ecartx, 0, rayon_roue]) {
        mirror([1,0,0])roue_dentee();
        rotate([130,0,0])
        translate([-3,0,0])rotate([0,0,90]);//courroie();
    }
    translate([90+ecartx, 0, rayon_roue])roue_motrice();
}

module moteurs_pour_diff() {
translate([0,0,rayon_roue]) {
    translate([0, -ecart, hauteur])
        rotate([0, 90, 0]) mdp_ts10093();
    rotate ([0,0,180])
    translate([0, -ecart, hauteur])
        rotate([0, 90, 0]) mdp_ts10093();

    longueur = 150;
    /////// percage \\\\\\/
    translate([0, -ecart*0.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  ecart*0.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0,  ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
}
}

module _vis_support() {
    longueur = 8;
    translate([-36+3,0,0]) cylinder(h=longueur, d=d_perc, center=true);
    translate([-16+3,0,0]) cylinder(h=longueur, d=d_perc, center=true);
    translate([ 36-3,0,0]) cylinder(h=longueur, d=d_perc, center=true);
    translate([ 16-3,0,0]) cylinder(h=longueur, d=d_perc, center=true);
}
module vis_support() {
    translate([0,-(d_moteur*2+ecart)*0.6+3,0])
        _vis_support();
    translate([0, (d_moteur*2+ecart)*0.6-3,0])
        _vis_support();
}


//****\\Platine des moteurs//****\\//


module support_moteur(){
    _epp = 2;
    /// plaque droite (opposee à la roue dentee)
    difference(){
        translate([ -50-_epp/2  -ecartx ,-(d_moteur+ecart/2)*1.2, rayon_roue+hauteur-18])
            cube([_epp, (d_moteur+ecart/2)*1.2, (d_moteur*1.3)]);
        placement();
    }
    /// plaque gauche (cote roue dentee)
    translate([-5,0,0])
    difference(){
        translate([ 53+ecartx+_epp/2  ,-(d_moteur+ecart/2)*1.2, rayon_roue+hauteur-18])
            cube([_epp, (d_moteur+ecart/2)*1.2, (d_moteur*1.3)]);
        moteurs_pour_diff();
    }
    /// plaque tenant l'axe
    /*difference(){
        translate([ 49  ,-ecart-d_moteur/2-(d_moteur*0.2/2), rayon_roue])
            cube([_epp, (d_moteur)*1.2, (d_moteur*1.3)]);
        moteurs_pour_diff();
    }*/
    /// plaque en dessous
    translate([ -50-_epp/2-ecartx , -(d_moteur*2+ecart)*0.6 , rayon_roue-_epp+hauteur-18])
        cube([ 101+_epp/2+ecartx*2 , (d_moteur*2+ecart)*0.6 , _epp]);

}




module trous_roues() {
    translate([-94-ecartx,0,0])
        cube([largeur_roue+codeuse_epaisseur*1.2, 55, 25], center=true);
    translate([ 94+ecartx,0,0])
        cube([largeur_roue+codeur_epaisseur*1.2, 55, 25], center=true);
}

module trous_codeur() {
    translate([-94-ecartx-codeuse_epaisseur*2.5,0,0])
        cube([codeur_diametre*1.2, 25, 25], center=true);
    translate([ 94+ecartx+codeuse_epaisseur*2.5,0,0])
        cube([codeur_diametre*1.2, 25, 25], center=true);
}

module trous_percage()  {
    
    translate([0,-(2*d_moteur+ecart)*facteur/2,0])
    for(i=[1:4])
    {
        translate([10,18-20*i,0])
    cylinder(h=20,d=3,center=true);
    }
}


module support_roue() {
    _epaisseur =  3;
    _largeur   = 26;
    _hauteur   = 40;
    _espace    = 27;
    _posin     = 46.5 - _epaisseur+ecartx;
    _posout    = _posin + _espace + _epaisseur;
    // Supports des axes
    difference() {
        union(){
        translate([_posout, -_largeur/2, 7+epp])
            cube([_epaisseur,_largeur,_hauteur]);
        translate([_posin,  -_largeur/2, 7+epp])
            cube([_epaisseur,_largeur,_hauteur]);
        }
        translate([_posin-0.2, 0, rayon_roue])
            rotate([0,90,0]) cylinder(d=18,_espace + 2*_epaisseur+0.4);
    }
    translate([_posin,  -_largeur/2, 7+epp])
        cube([_espace + 2*_epaisseur,_largeur,_epaisseur]);
}

module support_roues() {
    difference() {
    translate([0,0,7+epp/2])
        // Plaque principale
        cube([270, 90, epp], center=true);
        trous_roues();
        trous_codeur();
        translate([10,32,10])
        trous_percage();
        rotate([0,0,180])translate([10,32,10])
        trous_percage();
    }
    
    support_roue();
    mirror([1,0,0])
    support_roue();

    translate([30,-48,20]) rotate([0,0,90])stm32f4();
    translate([101,0,codeuse_diametre/2])
    roue_codeuse();

}

module support_rail() {
    
        facteur = 2.0;//
    
    translate([20,-(2*d_moteur+ecart)*facteur/2,0])
        cube([epp,2*d_moteur+ecart*facteur,rayon_roue+hauteur-30]);
    //plaque bas
    
difference(){
    translate([0,-(2*d_moteur+ecart)*facteur/2,0])
    cube([20,2*d_moteur+ecart*facteur,epp]);
    trous_percage();
    
    }
    translate([0,-(2*d_moteur+ecart)*facteur/2,rayon_roue+hauteur-27-2*epp])
    difference(){
        cube([20,2*d_moteur+ecart*facteur,epp]);
        translate([5,(2*d_moteur+ecart*facteur-(2*d_moteur+ecart*facteur*0.9))/2,-5])
        cube([epp,2*d_moteur+ecart*facteur*0.9,20]);
    }

}
    
/// AFFICHAGE //////


translate([10,32,10])
support_rail();


rotate([0,0,180])translate([10,32,10])
support_rail();
support_moteur();
rotate([0 , 0, 180 ])
#support_moteur();


#support_roues();
placement();
rotate ([0,0,180])
placement();


