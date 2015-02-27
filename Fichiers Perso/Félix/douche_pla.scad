$fn=100;
diam=0;

module metal() {
#import("douche_metal.stl", convexity=3);
}
module pomme() {
translate([0,-25,0])rotate([-90,0,0])cylinder(d=26,h=100);
}
module pla() {
    cylinder(d=15, h=7);
    translate([0,-15/2,0]) cube([40,15,15]);
    translate([35,10,0]) rotate([0,0,180+45])support_pomme();
/*translate([0,17/2,0])difference(){
cube([30,21.5,9]);
rotate([0,0,45])cube([40,30,9]);
}*/
}

module support_pomme() {
translate([2.5,-8.5,3]) cube([10,38.5,15]);
translate([9.5,-8.5,3])rotate([-90,0,0])cylinder(d=6,h=38.5);
translate([-6,-8.5,0]) cube([15.5,38.5,13]);
translate([-5.9,-8.5,3])rotate([-90,0,0])cylinder(d=6,h=38.5);
translate([-8.9,-8.5,2.5])rotate([0,-14.5,0])#cube([5,38.5,12.8]);
difference() {
translate([0,-10,18])rotate([-90,0,0])cylinder(d=30,h=40);
translate([0,10,28])#cube([24,45,20], center=true);
}
}


module main() {
difference() {
pla();
{
	metal();
	translate([35,10,18]) rotate([0,0,180+45])#pomme();
}
}
}

main();