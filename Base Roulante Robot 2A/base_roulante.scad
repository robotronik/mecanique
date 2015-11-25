use <roue_motrice.scad>;
use <roue_dentee.scad>;
use <mdp_ts10093.scad>;

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
    translate([0, -ecart, hauteur]) {
        rotate([0, 90, 0]) mdp_ts10093();
        translate([ 63, 0, 0]) mirror([1,0,0])roue_dentee();
    }
    translate([63, 0, 0])roue_dentee();
    translate([90, 0, 0])roue_motrice();
}




//****\\Platine des moteurs//****\\//
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

module platine2() {
    difference() {
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

placement();
rotate ([0,0,180])
placement();

plaque1();
plaque2();
plaque3();
platine1();
platine2();


/*
//****\\platine des roues dentees et motrices//****\\//
module equerre1()
{
 translate([81, -((d_moteur*2+ecart)*1.2)/2, -d_roued])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);
    translate([40, -((d_moteur*2+ecart)*1.2)/2, -d_roued])rotate([0, 90, 0])cube([3, (d_moteur*2+ecart)*1.2, d_rouem]);  
}
*/
