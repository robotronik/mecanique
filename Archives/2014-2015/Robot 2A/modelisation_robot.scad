include <./Constantes.scad>;
use <Plaques Alu/plaques.scad>
use <Plaques Plexy/coté.scad>
use <Plaques Plexy/toit.scad>
use <Empileur/support_empileur.scad>
use <Empileur/ouverture_porte_partie_servo.scad>
use <Empileur/ouverture_porte_partie_simple.scad>
use <Empileur/ouverture_porte_partie_porte.scad>
use <Attrape-popcorns/eventail.scad>
use <Attrape-popcorns/support_couronne.scad>
use <Attrape-verres/Bras Verres+Claps.scad>
use <Attrape-verres/Porte-servo.scad>
$fn=100;

hauteur_demi_lune=0;//*$t;
angle_demi_lune=90;//*$t;
angle_porte_empileur=0;//*$t;
angle_attrape_popcorns=100;
angle_bras_verres_droite=130;
angle_bras_verres_gauche=130;
vue_eclatee=0;

module plateau() {
    translate([0,0,-0.1     ])// color("grey")
        %cube([2000,2000,0.1], center=true);
}
module structure() {
    color("silver") {
        // Plaque Bas
        rotate([0,0,180]) translate([-70,-169,hauteur_bas])
            linear_extrude(height=epaisseur_alu)
                import("Plaques Alu/base_gros_15.dxf");
        // Plaque Intermédiaire
        translate([-53.4,46,1.5+hauteur_interm])
            scale([1,1,3])
                import("Plaques Alu/intermédiaire_gros_15.dxf");
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

    translate([0,0,hauteur_toit+100*vue_eclatee]) {
        color("silver") linear_extrude(height=epaisseur_plexy) toit();
        elements_du_toit();
    }
}

module profile_alu(hauteur) {
    translate([0,0,hauteur/2])
        cube([cote_profile,cote_profile,hauteur],center=true);
}

module plexy_tour() {        
    translate([0,-150*vue_eclatee,0])
    %translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
    
    %mirror([0,1,0])
    translate([0,-150*vue_eclatee,0])
    translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
}

module moteur_et_roue() {
    translate([35,0,hauteur_interm-25])
            cube([50,119,50], center=true);
    // Roue motrice
    color("green")translate([0,entraxe_roues/2-8,30])rotate([90,0,0])
        cylinder(h = larg_roues-25, r=30, center=true);
    translate([-15,entraxe_roues_cod/2-44,hauteur_bas])
        cube([30,20,50]);
    // Roue codeuse
    translate([0,entraxe_roues_cod/2+10,20])rotate([90,0,0])
        color("yellow")cylinder(h = larg_roues_cod-3, r=20, center=true);
    translate([-10,entraxe_roues_cod/2+12,hauteur_bas])
        cube([20,20,30]);
    
    // Courroie
    translate([0,entraxe_roues_cod/2-54,30]) rotate([0,17,0]) {
        translate([0,10,0])
            rotate([90,0,0])cylinder(h=10,d=28);
        translate([0,10,110])
                rotate([90,0,0])cylinder(h=10,d=28);
        color("black")difference() {
            minkowski() {
                cube([0.1,10,110]);
                rotate([90,0,0])cylinder(h=0.1,d=40);
            }
            translate([0,1])minkowski() {
                cube([0.3,10,110]);
                rotate([90,0,0])cylinder(h=2,d=30);
            }
        }
    }
    
}

module moteurs_et_roues() {
    translate([-11,0,0])moteur_et_roue();
    translate([-11,0,0])rotate([0,0,180])moteur_et_roue();
}
module empileur() {
    color("grey")translate([-145,0,0])difference() {
        cylinder(d=empileur_d, h=empileur_h);
        translate([0,0,-1])
            cylinder(d=empileur_d_interieur, h=empileur_h+2);
        translate([-empileur_d/2,0,empileur_h/2])
            cube([empileur_d, 64, empileur_h+2], center=true);
        translate([empileur_d/2,0,42])
            cube([empileur_d, 70, 95], center=true);
        translate([0,-empileur_d/2-20,37])
            cube([empileur_d/2+8, 70, 200], center=true);
    }
    color("silver")translate([-145,-empileur_d/2-30.5/2+3, 220]) difference() {
        cube([30.5,30.5,200], center=true);
        translate([0,3,0])
            cube([23,29,200], center=true);
    }
    color("white")translate([-145,0,hauteur_interm + epaisseur_alu])
        rotate([0,0,-90])
        import("Empileur/support_empileur.stl");//support_empileur();
    color("red")translate([-145,0.1,hauteur_interm + epaisseur_alu+100])
        rotate([0,0,125])partie_servo_avec_servo();
    
    color("red")translate([-145,0.1,hauteur_bas + epaisseur_alu+100])
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
        color("grey")intersection() {
            difference() {
                cylinder(d=empileur_d, h=empileur_h);
                translate([0,0,-1])
                    cylinder(d=empileur_d_interieur, h=empileur_h+2);
            }
            translate([-empileur_d/2,0,empileur_h/2])
                cube([empileur_d, 60, empileur_h], center=true);
        }
        color("red")translate([0.1,0,hauteur_bas + epaisseur_alu+100+10])
            rotate([0,0,125]) partie_porte();
        color("red")translate([0.1,0,hauteur_interm + epaisseur_alu+100+10])
            rotate([0,0,125])
        partie_porte();
    }
}
module pied() {
    color("green")cylinder(d=60,h=70);
}

module popcorn() {
    color("white")sphere(d=40);
}

module couronne()
{
    epaisseur_couronne=3;
    color("grey")
    intersection()
    {
        difference()
        {
            cylinder(d=200,h=42);
            translate([0,0,-0.1])
                cylinder(d=200-2*epaisseur_couronne,h=42+0.2);
        }
        rotate([0,0,-60]) cube([200,200,200]);
    }
}
module attrape_popcorns() {
    translate([66,0, hauteur_interm+epaisseur_alu]) {
        rotate([0,0,165+angle_attrape_popcorns])
            eventail();
        translate([8,17,0.2])
            rotate([0,0,90])
                //translate([10,0,0.2])
                support_couronne();
        translate([8,17,0.2])
            rotate([0,0,80])
                //translate([10,0,0.2])
                couronne();
        rotate([0,0,-30+angle_attrape_popcorns-1])
            translate([90,0,25])popcorn();
        rotate([0,0,-60+angle_attrape_popcorns-1])
            translate([90,0,20])popcorn();
        rotate([0,0,-90+angle_attrape_popcorns-1])
            translate([90,0,20])popcorn();
        rotate([0,0,-0+angle_attrape_popcorns-1])
            translate([90,0,20])popcorn();
        }
}


module attrape_verre(angle) {
    rotate([-angle])
        translate([-8,-25,2]) rotate([270,360-90,0])
            color("red") bras_verres_et_claps();
    rotate([180,0,-90])translate([-14,-39,-37.8])
        color("white") porte_servo_avec_servo();
}
module attrape_verres() {
    translate([20,-rayon_inscrit+11,hauteur_interm+20])
        attrape_verre(angle_bras_verres_droite);
    mirror([0,1,0])
    translate([20,-rayon_inscrit+11,hauteur_interm+20])
        attrape_verre(angle_bras_verres_gauche);
}
translate([-100,0,0])pied();
translate([-50,0,0])pied();
translate([-0,0,0])pied();
empileur();
empileur_porte();
//plateau();
structure();
moteurs_et_roues();
attrape_verres();
plexy_tour();
attrape_popcorns();