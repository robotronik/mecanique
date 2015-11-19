use <../lib/ISOThread.scad>;
include <roue_motrice.scad>;
include <roue_dentee.scad>;
include <mdp_ts10093.scad>;
include <axe56.scad>;
$fn=30;

// ecart moteur
ecart = 30; //mm
hauteur = 20; //mm
d_moteur = 32; //mm
d_rouem = 72; //mm
d_roued = 27.5; //mm
epp = 1; //mm epaisseur des plaques
d_perc = 3; //mm diametre perçage

//****\\Placement des moteurs //****\\//
translate([0, -ecart, hauteur])rotate([0, 90, 0])mdp_ts10093();
translate([0, ecart, hauteur])rotate([180, 90, 0])mdp_ts10093();

//****\\Placements des roues dentees en lien avec les moteurs//****\\//
translate([67, -ecart, hauteur])rotate([0, 90, 0])roue_dentee();
translate([-67, ecart, hauteur])rotate([180, 90, 0])roue_dentee();

//****\\Placements des roues dentees en lien avec les roues motrices//****\\//
translate([67, 0, 0])rotate([0, 90, 180])roue_dentee();
translate([-67, 0, 0])rotate([180, 90, 180])roue_dentee();

//****\\Placements des roues //****\\//
translate([95, 0, 0])rotate([0, 90, 0])roue_motrice();
translate([-95, 0, 0])rotate([180, 90, 0])roue_motrice();



//****\\Platine des moteurs//****\\//
//grande platine
module plaque1() {
    difference() {
        translate([40, -(d_moteur+ecart/2)*1.2, 0])
            cube([epp, (d_moteur*2+ecart)*1.2, (d_moteur*1.3)]);
        translate([0, -ecart, hauteur])rotate([  0, 90, 0])mdp_ts10093();
        translate([0,  ecart, hauteur])rotate([180, 90, 0])mdp_ts10093();
            /////// percage \\\\\\/
        translate([0, -ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
            cylinder(h=1000, r=d_perc/2, center=true);
        translate([0, -ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
            cylinder(h=1000, r=d_perc/2, center=true);
        translate([0, -ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
            cylinder(h=1000, r=d_perc/2, center=true);
        translate([0, -ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
            cylinder(h=1000, r=d_perc/2, center=true);
    }
}
plaque1();

module plaque2() {
    difference() {
    translate([-40, -(d_moteur+ecart/2)*1.2, 0])
        cube([epp, (d_moteur*2+ecart)*1.2, (d_moteur*1.3)]);
    translate([0, -ecart, hauteur])rotate([  0, 90, 0])mdp_ts10093();
    translate([0,  ecart, hauteur])rotate([180, 90, 0])mdp_ts10093();
        /////// percage \\\\\\/
    translate([0, ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=1000, r=d_perc/2, center=true);
    translate([0, ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
        cylinder(h=1000, r=d_perc/2, center=true);
    translate([0, ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=1000, r=d_perc/2, center=true);
    translate([0, ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
        cylinder(h=1000, r=d_perc/2, center=true);
    }
}
plaque2();

module plaque3() {
   difference() {
    translate([ -40 , -(d_moteur*2+ecart)*1.2*0.5 , 0])
       cube([ 80+epp , (d_moteur*2+ecart)*1.2 , epp]);

    ////percage\\\\\//

    translate([-36+3, -(d_moteur*2+ecart)*0.6+3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);
    translate([-16+3, -(d_moteur*2+ecart)*0.6+3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);

    translate([ 36-3, -(d_moteur*2+ecart)*0.6+3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);
    translate([ 16-3, -(d_moteur*2+ecart)*0.6+3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);
        
    translate([-36+3, (d_moteur*2+ecart)*0.6-3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);
    translate([-16+3, (d_moteur*2+ecart)*0.6-3, -10 ])
       cylinder(h=100 , d=d_perc , center=true);
        
    translate([ 36-3, (d_moteur*2+ecart)*0.6-3, -10 ])
        cylinder(h=100 , d=d_perc , center=true);
    translate([ 16-3, (d_moteur*2+ecart)*0.6-3, -10 ])
        cylinder(h=100 , d=d_perc , center=true);
    }
}

plaque3();
//projection( cut=true )plaque3();
///petite platine
module platine1() {
    difference()
    {
    translate([49+epp, -ecart-d_moteur/2-(d_moteur*0.2/2), 0])cube([epp, (d_moteur)*1.2, (d_moteur*1.3)]);
    translate([0, -ecart, hauteur])rotate([0, 90, 0])mdp_ts10093();
    /////// percage \\\\\\/
    translate([0, -ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
    }
}
//platine1();

module platine2()
{
    difference()
    {
    translate([-49-epp, ecart-d_moteur/2-(d_moteur*0.2/2), 0])cube([epp, (d_moteur)*1.2, (d_moteur*1.3)]);
    translate([0, ecart, hauteur])rotate([180, 90, 0])mdp_ts10093();
        /////// percage \\\\\\/
    translate([0, ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
    }
}
//platine2();

/*
translate([0, -ecart/2, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*1.5, hauteur*1.75+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*1.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);
translate([0, -ecart*0.5, hauteur*0.25+d_perc])rotate([0, 90, 0]) 
    cylinder(h=1000, r=d_perc/2, center=true);*/
/*
//****\\Platine des roues dentees et motrices//****\\//
module equerre1()
{
 translate([81, -((d_moteur*2+ecart)*1.2)/2, -d_roued])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);
    translate([40, -((d_moteur*2+ecart)*1.2)/2, -d_roued])rotate([0, 90, 0])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);  
}
*/
    