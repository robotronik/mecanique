include <./Constantes.scad>;
use <Plaques Alu/plaques.scad>
use <Plaques Plexy/coté.scad>
use <Plaques Plexy/toit.scad>
use <Empileur/support_empileur.scad>
use <Empileur/ouverture_porte_partie_servo.scad>
use <Empileur/ouverture_porte_partie_simple.scad>
use <Empileur/ouverture_porte_partie_porte.scad>
$fn=50;

hauteur_demi_lune=0;
angle_demi_lune=90;
angle_porte_empileur=0;

module structure() {
    translate([0,0,hauteur_bas])
        linear_extrude(height=epaisseur_alu) plaque_bas();
    translate([0,0,hauteur_interm])
        linear_extrude(height=epaisseur_alu) plaque_interm();

    translate([0,0,hauteur_toit])
        linear_extrude(height=epaisseur_plexy) toit();

    translate([0,0,hauteur_bas]) {
    translate([+cote_octogone/2-cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            profile_alu(hauteur_toit);
    translate([-cote_octogone/2+cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            profile_alu(hauteur_toit);
    translate([+cote_octogone/2-cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            profile_alu(hauteur_toit);
    translate([-cote_octogone/2+cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            profile_alu(hauteur_toit);
    }
    translate([-110,60,0])
        rotate([0,0,45])profile_alu(hauteur_interm);
    translate([-110,-60,0])
        rotate([0,0,45])profile_alu(hauteur_interm);
}

module profile_alu(hauteur) {
    translate([0,0,hauteur/2])
        cube([cote_profile,cote_profile,hauteur],center=true);
}


module plexy_tour() {
    #translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
    
    #mirror([0,1,0])
    translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
}

module empileur() {
    translate([-145,0,0])difference() {
        cylinder(d=empileur_d, h=empileur_h);
        cylinder(d=empileur_d_interieur, h=empileur_h);
        translate([-empileur_d/2,0,empileur_h/2])
            cube([empileur_d, 64, empileur_h], center=true);
        translate([empileur_d/2,0,42])
            cube([empileur_d, 70, 95], center=true);
        translate([0,-empileur_d/2-20,37])
            cube([empileur_d/2+8, 70, 200], center=true);
    }
    translate([-145,-empileur_d/2-30.5/2+3, 220]) difference() {
        cube([30.5,30.5,200], center=true);
        translate([0,3,0])
            cube([23,29,200], center=true);
    }
    translate([-145,0,hauteur_interm + epaisseur_alu])
        rotate([0,0,-90])
        support_empileur();
    translate([-145,0,hauteur_interm + epaisseur_alu+100])
        rotate([0,0,125])partie_servo_avec_servo();
    
    translate([-145,0,hauteur_bas + epaisseur_alu+100])
        rotate([0,0,125])mirror([0,1,0]) partie_simple();
        
    translate([-145,0,0])
        empileur_technique();
}

// Système de montage de pieds
module empileur_technique() {
    translate([0,-empileur_d/2-24,80])
        cube([10,10,100]);
    translate([2,-empileur_d/2-19,
        hauteur_demi_lune+hauteur_bas+epaisseur_alu+5]) {
            #cube([6,6,100]);
            translate([-15+3,6,0])cube([30,20,5]);
            translate([12,22,5])rotate([angle_demi_lune,0])
                translate([0,13,0])
                difference() {
                rotate([0,-90,0]) cylinder(d=30,h=18);
                translate([-10,0,12])cube([30,30,20], center=true);
            }
        }
}
module empileur_porte() {
    translate([-145,0,0]) 
    translate([-13.525,52.875,0]) rotate([0,0,-angle_porte_empileur])
    translate([13.525,-52.875,0]) {
        
        intersection() {
            difference() {
                cylinder(d=empileur_d, h=empileur_h);
                cylinder(d=empileur_d_interieur, h=empileur_h);
            }
            translate([-empileur_d/2,0,empileur_h/2])
                cube([empileur_d, 60, empileur_h], center=true);
        }
        translate([0,0,hauteur_bas + epaisseur_alu+100+12])
            rotate([0,0,125]) partie_porte();
        translate([0,0,hauteur_interm + epaisseur_alu+100+12])
            rotate([0,0,125])
        partie_porte();
}
    
    
}
empileur();
empileur_porte();
structure();
//plexy_tour();