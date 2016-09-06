$fn=50;
dia_trou_fixation=4;
include <capteur_US.scad>
// En imprimer 2 de 45
//module support45() {
//    // Attache sur le capteur
//    translate([10,0])
//    difference() {
//        translate([0,0,-2]) {
//            translate([0,0])
//                cube([2, capteurUS_largeur-1,capteurUS_longueur+4]);
//            translate([0,1])
//                cube([2,capteurUS_largeur,capteurUS_longueur+4]);
//        }
//        translate([0,capteurUS_largeur/2+1.1,capteurUS_longueur/2])
//            mirror([0,0,1])rotate([-90,0,90])#capteur_US();
//    }
//    // Attache sur la plaque de plexy
//    rotate([0,0,-45]) translate([0,2,-2])difference() {
//        translate([0,-2])
//            cube([capteurUS_largeur,2,capteurUS_longueur+4]);
//        translate([capteurUS_largeur/2,0,7])rotate([90,0,0])
//            cylinder(d=dia_trou_fixation, h=100);
//        translate([capteurUS_largeur/2,0,capteurUS_longueur+4-7])
//            rotate([90,0,0]) cylinder(d=dia_trou_fixation, h=100);
//    }
//    // Renfort
//    translate([3,-3+0.7])
//    rotate([0,0,10])
//        translate([0,0,-2])
//        cube([9.5,2,capteurUS_longueur+4]);
//    translate([0,0,-2])linear_extrude(height=2) {
//        polygon([
//            [0,0],
//            [10,capteurUS_largeur+1],
//            [12,capteurUS_largeur+1],
//            [( capteurUS_largeur+2)/1.414,
//             (-capteurUS_largeur+2)/1.414]]);
//    }
//}
//rotate([0,0,45])translate([-3/2,0,0])#cube([3,100,100], center=true);

module support90() {
    difference() {
        mirror([1,1,0]) {
            translate([-1,0,-2])
                cube([capteurUS_largeur-1,2,capteurUS_longueur+4]);
            translate([0,0,-2])
                cube([capteurUS_largeur,2,capteurUS_longueur]);
            
            translate([0,0,-2])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur,2],
                    [0, capteurUS_largeur]]);
            }
            translate([0,0,capteurUS_longueur])linear_extrude(height=2) {
                polygon([
                    [0,0],
                    [capteurUS_largeur-2,2],
                    [0, capteurUS_largeur]]);
            }
            translate([-2,0,0])rotate([0,0,90]) difference() {
                translate([0,-2,-2])
                    cube([capteurUS_largeur,2,capteurUS_longueur+4]);
                translate([capteurUS_largeur-7,0,5])rotate([90,0,0])
                    cylinder(d=dia_trou_fixation, h=100);
                translate([capteurUS_largeur-7,0,capteurUS_longueur-5])
                    rotate([90,0,0]) cylinder(d=dia_trou_fixation, h=100);
            }
            
        }
        
        
    translate([0,-capteurUS_largeur/2,capteurUS_longueur/2])
        rotate([-90,0,-90])#capteur_US();
    }
}
support90();

mirror([0,1,0])support45();