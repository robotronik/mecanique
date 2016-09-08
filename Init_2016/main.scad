$fn = 100;

use <moteur.scad>;

translate([40, 0, 0]) union(){
    translate([-27.5, 0, 0]) rotate([0, -90, 0]) roue();

    moteur();
}

translate([70, 0, 0]) mirror([1, 0, 0]) union(){
    translate([-27.5, 0, 0]) rotate([0, -90, 0]) roue();

    moteur();
}