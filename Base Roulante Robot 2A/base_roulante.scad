include <roue_motrice.scad>;
include <roue_dentee.scad>;
include <mdp_ts10093.scad>;

$fn=50;

// Dimensions en millimètres
ecart = 30;     // écart moteur
hauteur = 20;
d_moteur = 32;
d_rouem = 72;
d_roued = 27.5;
epp = 3;        // épaisseur des plaques
d_perc = 3;     // diamètre perçage

//****\\Placement des moteurs //****\\//
module placement() {
    translate([0, -ecart, hauteur+rayon_roue]) {
        rotate([0, 90, 0]) mdp_ts10093();
        translate([ 63, 0, 0]) mirror([1,0,0])roue_dentee();
    }
    translate([63, 0, rayon_roue])roue_dentee();
    //translate([90, 0, rayon_roue])roue_motrice();
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
    translate([0, -ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, -ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=longueur, r=d_perc/2, center=true);
    translate([0, ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
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


module plaque_dessous() {
   difference() {
    translate([ -40 , -(d_moteur*2+ecart)*1.2*0.5 , rayon_roue])
        cube([ 80+epp , (d_moteur*2+ecart)*1.2 , epp]);
        vis_support();
    }
}

module plaques() {
    // Grandes plaques
    translate([ 40    ,-(d_moteur+ecart/2)*1.2, rayon_roue])
        cube([epp, (d_moteur*2+ecart)*1.2, (d_moteur*1.3)]);
    translate([-40-epp,-(d_moteur+ecart/2)*1.2, rayon_roue])
        cube([epp, (d_moteur*2+ecart)*1.2, (d_moteur*1.3)]);
    // Petites plaques
    translate([ 49    ,-ecart-d_moteur/2-(d_moteur*0.2/2), rayon_roue])
        cube([epp, (d_moteur)*1.2, (d_moteur*1.3)]);
    translate([-49-epp, ecart-d_moteur/2-(d_moteur*0.2/2), rayon_roue])
        cube([epp, (d_moteur)*1.2, (d_moteur*1.3)]);
}


module trous_roues() {
    translate([-90,0,0])
        cube([largeur_roue+6, 55, 25], center=true);
    translate([ 90,0,0])
        cube([largeur_roue+6, 55, 25], center=true);
}

module support_roues() {
    difference() {
    translate([0,0,7+epp/2])
        // Plaque principale
        cube([250, 90, epp], center=true);
        trous_roues();
    }
    // Supports des axes
    translate([-78.5,-15,7+epp/2])
        #cube([5,30,40]);
    translate([-48.5,-15,7+epp/2])
        #cube([5,30,40]);
}
support_roues();

placement();
rotate ([0,0,180])
#placement();
difference() {
    plaques();
    moteurs_pour_diff();
}
plaque_dessous();



/*
plaque1();
plaque2();
plaque3();
platine1();
platine2();
*/

/*
//****\\platine des roues dentees et motrices//****\\//
module equerre1()
{
 translate([81, -((d_moteur*2+ecart)*1.2)/2, -d_roued])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);
    translate([40, -((d_moteur*2+ecart)*1.2)/2, -d_roued])rotate([0, 90, 0])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);  
}
*/
