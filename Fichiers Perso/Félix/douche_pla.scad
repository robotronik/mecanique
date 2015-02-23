$fn=100;
module metal() {
#import("douche_metal.stl", convexity=3);
}
module pomme() {
translate([0,-25,0])rotate([-90,0,0])cylinder(d=20,h=100);
}
module pla() {
cylinder(d=17, h=15);
translate([0,-17/2,0]) cube([30,17,15]);
translate([30,0,18]) support_pomme();
translate([32.5,-8.5,3]) cube([10,38.5,15]);
translate([39.5,-8.5,3])rotate([-90,0,0])cylinder(d=6,h=38.5);
translate([24,-8.5,0]) cube([15.5,38.5,13]);
translate([24.1,-8.5,3])rotate([-90,0,0])cylinder(d=6,h=38.5);
translate([21.1,-8.5,2.5])rotate([0,-14.5,0])#cube([5,38.5,12.8]);
/*translate([0,17/2,0])difference(){
cube([30,21.5,9]);
rotate([0,0,45])cube([40,30,9]);
}*/
}

module support_pomme() {
difference() {
translate([0,-10,0])rotate([-90,0,0])cylinder(d=25,h=40);
translate([0,10,10])#cube([18,45,20], center=true);
}
}


module main() {
difference() {
pla();
{
	metal();
	translate([30,0,18])#pomme();
}
}
}

main();