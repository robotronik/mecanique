$fn=80;

include <../Constantes.scad>;


module arriere() {
    difference() {
        square([cote_octogone, hauteur_plexy]);
        translate([cote_octogone/2,hauteur_plexy-15])circle(d=4);
    }
}
module milieu() {
    difference() {
        square([cote_octogone, hauteur_plexy]);
        translate([5.5,202])circle(d=4);
        translate([cote_octogone-5.5,202])circle(d=4);
        translate([12,170]) square([78, 90]);
    }
}
module avant() {
    difference() {
        translate([0,160]) square([cote_octogone, hauteur_plexy-160]);
        translate([cote_octogone*1/2,hauteur_plexy-15])circle(d=4);
    }
}

module petit_bord_avant() {
        translate([0,160]) square([20, hauteur_plexy-160]);
}


module plaque_plate() {
    translate([0])
        arriere();
    translate([1*cote_octogone,0])
        milieu();
    translate([2*cote_octogone,0])
        avant();
    translate([3*cote_octogone,0])
        petit_bord_avant();
}

module plaque_pliee() {
    translate([0,0,-larg_pliure])
        rotate([0,-45])
            translate([0,0,-5])
            linear_extrude(height=5)
            arriere();
    translate([larg_pliure,0])
            translate([0,0,-5])
            linear_extrude(height=5)
        milieu();
    translate([larg_pliure+cote_octogone,0,0])
        rotate([0,45])
            translate([0,0,-5])
            linear_extrude(height=5)
            avant();
    translate([2*larg_pliure+cote_octogone,0, -larg_pliure])
        rotate([0,90])
            translate([0,0,-5])
            linear_extrude(height=5)
            petit_bord_avant();
}
