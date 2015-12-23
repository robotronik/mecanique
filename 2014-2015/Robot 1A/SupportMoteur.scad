$fn=100;

module renvoi_coude() { translate([0,-20,0]){
    cube([55,40,40]);
    translate([19,-1.5,20])rotate([-90,0,0])cylinder(d=28.6+1, h=40+2*1.5);
    translate([19,-3.5,20])rotate([-90,0,0])cylinder(d=11.8+1, h=40+2*3.5);
    translate([19,-20.,20])rotate([-90,0,0])cylinder(d=10.0+1, h=40+2*20.);
    translate([55-20,20,40]) cylinder(d=35.0+1, h=3);
    translate([19,20,20])rotate([0,-45,0])rotate([-90,0,0]) {
        translate([ 19,0,0])cylinder(d=4+0.2,h=70, center=true);
        translate([-19,0,0])cylinder(d=4+0.2,h=70, center=true);
    }
}}

module support() {
    translate([25,0,20])cube([50,40+2*5,40], center=true);
    linear_extrude(height=30) minkowski() { union(){
            translate([12.5,0])#square([25-4,67-4], center=true);
            translate([25,0])#square([5,67-4], center=true);
            translate([12.5+25,0])#square([25-4,87-4], center=true);
        }
        circle(r=2);
    }
}

difference() {
support();
renvoi_coude();
}


linear_extrude(height = w, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[10,0],[0,10]], paths=[[0,1,2]]);