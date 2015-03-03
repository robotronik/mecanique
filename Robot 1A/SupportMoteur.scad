$fn=100;

module renvoi_coude() {
translate([0,0,0])cube([40,40,55]);
translate([20,-1.5,19])rotate([-90,0,0])cylinder(d=28.6, h=40+2*1.5);
translate([20,-3.5,19])rotate([-90,0,0])cylinder(d=11.8, h=40+2*3.5);
translate([20,-20.,19])rotate([-90,0,0])cylinder(d=10.0, h=40+2*20);
translate([0,20,55-20])rotate([0,-90,0])cylinder(d=35.0, h=3);

}

renvoi_coude();