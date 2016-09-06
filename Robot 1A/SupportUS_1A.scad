$fn=100;

module supportUS_ar() {
dia_trou_fixation=4;

// -->
capteurUS_largeur = 19.9;
capteurUS_longueur= 22.1;
capteurUS_ep_PCB= 1.7;

module vis_capteur() {
    translate([2.54,2.54])
        circle(d=3.1);
    translate([2.54+12.6,2.54+17])
        circle(d=3.1);
}
module capteur_US_base() {
    cube([capteurUS_largeur,capteurUS_longueur,capteurUS_ep_PCB]);
    translate([0,0,-10])linear_extrude(height=20)vis_capteur();
    translate([9,capteurUS_longueur/2])cylinder(d=16.4, h=15.5);
    translate([17.9,0,-7]) cube([2,19,7]);
}
module capteur_US() {
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2])capteur_US_base();
} //-->

module support90() {
    difference() {
        mirror([1,1,0]) {
            /*translate([-1,0,-2])
                cube([capteurUS_largeur-1,2,capteurUS_longueur+4+2]);*/
            translate([0,0,-2])
                cube([capteurUS_largeur,2,capteurUS_longueur+6]);
            
           /* translate([0,0,-2])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur,2],
                    [0, capteurUS_largeur]]);
            }*/
           translate([0,0,capteurUS_longueur+2])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur-2,2],
                    [0, capteurUS_largeur]]);
            }
	translate([0,0,-2])rotate([0,0,90])
                    cube([capteurUS_largeur,2,capteurUS_longueur+4+2]);            
        }
        
        
    translate([-2,-2-capteurUS_largeur/2,capteurUS_longueur/2+1])
        rotate([90,0,-90])#capteur_US();
    }
}

mirror([0,0,0])support90();

translate([-20,0,-2])#cube([2,6.2,capteurUS_longueur+6]);
translate([-10,6,-2])rotate([0,0,90])cube([2,10,capteurUS_longueur+6]);
}

module supportUS_av() {
dia_trou_fixation=4;

// -->
capteurUS_largeur = 19.9;
capteurUS_longueur= 22.1;
capteurUS_ep_PCB= 1.7;

module vis_capteur() {
    translate([2.54,2.54])
        circle(d=3.1);
    translate([2.54+12.6,2.54+17])
        circle(d=3.1);
}
module capteur_US_base() {
    cube([capteurUS_largeur,capteurUS_longueur,capteurUS_ep_PCB]);
    translate([0,0,-10])linear_extrude(height=20)vis_capteur();
    translate([9,capteurUS_longueur/2])cylinder(d=16.4, h=15.5);
    translate([17.9,0,-7]) cube([2,19,7]);
}
module capteur_US() {
    translate([-capteurUS_largeur/2,-capteurUS_longueur/2])capteur_US_base();
} //-->

module support90() {
    difference() {
        mirror([1,1,0]) {
            /*translate([-1,0,-2])
                cube([capteurUS_largeur-1,2,capteurUS_longueur+4+2]);*/
            translate([0,0,-2])
                cube([capteurUS_largeur,2,capteurUS_longueur+6]);
            
           /* translate([0,0,-2])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur,2],
                    [0, capteurUS_largeur]]);
            }*/
           translate([0,0,capteurUS_longueur+2])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur-2,2],
                    [0, capteurUS_largeur]]);
            }
	translate([0,0,-2])rotate([0,0,90])
                    cube([capteurUS_largeur,2,capteurUS_longueur+4+2]);            
        }
        
        
    translate([-2,-2-capteurUS_largeur/2,capteurUS_longueur/2+1])
        rotate([90,0,-90])#capteur_US();
    }
}

mirror([0,0,0])support90();

translate([-20,0,-2])cube([2,6.2,capteurUS_longueur+6]);
translate([-10,6,-2])rotate([0,0,90])#cube([1,10,capteurUS_longueur+6]);
}

// attention dépasse un peu de la face avant
//rotate([90,0,-90])supportUS_ar();
rotate([90,0,-90])supportUS_av();